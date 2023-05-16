Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE406704321
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 03:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534918.832417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyjrC-000809-Dm; Tue, 16 May 2023 01:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534918.832417; Tue, 16 May 2023 01:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyjrC-0007wo-B4; Tue, 16 May 2023 01:52:06 +0000
Received: by outflank-mailman (input) for mailman id 534918;
 Tue, 16 May 2023 01:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TnGy=BF=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1pyjrA-0007wi-1T
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 01:52:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e7ac675-f38c-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 03:52:00 +0200 (CEST)
Received: from AM6P194CA0045.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::22)
 by DB4PR08MB9237.eurprd08.prod.outlook.com (2603:10a6:10:3fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 01:51:56 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::d6) by AM6P194CA0045.outlook.office365.com
 (2603:10a6:209:84::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 01:51:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 01:51:55 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Tue, 16 May 2023 01:51:55 +0000
Received: from 12ab0d554c6f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 763CED03-F944-49C6-9E13-4BFFFC34A9F0.1; 
 Tue, 16 May 2023 01:51:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12ab0d554c6f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 May 2023 01:51:48 +0000
Received: from DB9PR08MB7674.eurprd08.prod.outlook.com (2603:10a6:10:37d::21)
 by AS8PR08MB8827.eurprd08.prod.outlook.com (2603:10a6:20b:5ba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 01:51:46 +0000
Received: from DB9PR08MB7674.eurprd08.prod.outlook.com
 ([fe80::17bf:7315:44a:3014]) by DB9PR08MB7674.eurprd08.prod.outlook.com
 ([fe80::17bf:7315:44a:3014%7]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 01:51:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3e7ac675-f38c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cn+qLn2HDGBuIuBfG2AsGcWSyQo5Ucg8P8Tm+y6XxQ=;
 b=yXceWx8PsYCgLmBp4i9ZiZ6Kj2lNWtfO6KazouneIQXkQn9F5jwNkTw7u5mIaeuD8/Uuo+g5ffPi8TGaa+LROuJ/KKFNO5L3vbCfsHYoVcjzpdqxsaoYszliCgVlUVTgtCrrz2zAdZt1hEoYWCAe+UEImORly7pzniT7kHwgewk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eedf60301999df81
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp0o9I8GDF9dyaWXrYWimZ7ByQG+kcY768rT7snYoSmTRRzCPubsIRnGDvTX1W3x4fXdgo/BMiGLUl57C2KDcZ5drhx9cQkeuSDuDV4uzu9DIDWW6wFOc7fS+IS/Hyw7gfTf8WsLkTradAB5Lu4ZDM+i6Hf2ubJ+S/3e+QZo3FS9NdkWOtNZLqMb/IH5Hx/CiQROCtr3r2kYPIBpKsPzKFzwPSzl/zdLIAsawsnP9i2lodspVutpq8c1nT3Xxz2w7ym1Te8rcPm0El+WoeXLNP5P4vJj92lZHb5SlWoRZQHui7s1yFWNHyccumw/fd2u+n5fTa5yJseJnWc2//vfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cn+qLn2HDGBuIuBfG2AsGcWSyQo5Ucg8P8Tm+y6XxQ=;
 b=BMVMZh4PQ1okYeLHKlCRLTh9lhXdp/N1l2XFyYuux0g8BPAMca20RrZSMlwC6hpOWw+uIWGe3KnXP1Dkk7xoLIRHxB9JI/TiOATUWcArIqC+iNaXXg11SHMYr+dUgDxFsP+CFX5KMThQNuqvsdOH71f4pVkUpFMEQg7w2c0u7knT9KMpi27KQoB/PDY/qbUXlagphgGzQGiP5fWzC0g+5R9PMq5SINaeS4pTUXuI65F75PzTtQhAUtePXyDO+qOWeP9yPcfQ5KSq6TaKiDnK2bRE+o71CQ3VzaHXwIRKd8TGmzRKaGfcJmLyowHbmfzIRLuaIltxW52EK2Wcxe5Htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cn+qLn2HDGBuIuBfG2AsGcWSyQo5Ucg8P8Tm+y6XxQ=;
 b=yXceWx8PsYCgLmBp4i9ZiZ6Kj2lNWtfO6KazouneIQXkQn9F5jwNkTw7u5mIaeuD8/Uuo+g5ffPi8TGaa+LROuJ/KKFNO5L3vbCfsHYoVcjzpdqxsaoYszliCgVlUVTgtCrrz2zAdZt1hEoYWCAe+UEImORly7pzniT7kHwgewk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: multipart/alternative;
 boundary="------------HciZi8HHxWRoK3JEVWJH9fXB"
Message-ID: <3e596d57-e4dd-c105-af3d-0b031767294f@arm.com>
Date: Tue, 16 May 2023 09:51:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] automation: make console options configurable via
 variables
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
 <e0504797d1b3758c035cd82b2dc3b00d747ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com>
From: Jiamei Xie <jiamei.xie@arm.com>
In-Reply-To: <e0504797d1b3758c035cd82b2dc3b00d747ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DB9PR08MB7674.eurprd08.prod.outlook.com
 (2603:10a6:10:37d::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7674:EE_|AS8PR08MB8827:EE_|AM7EUR03FT004:EE_|DB4PR08MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: b89aa031-1a69-4bcf-3dd1-08db55b020c3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a43KBJZyPDyOuA+hwbu2CjfR7azZExiGLLZ9C49dwIkbeF1ogJxEYgeKvx9Lpjj78V8CLhYD42ObxQfVGEpgzbkoLpkndmBrQDs6jDg0e0kQH/ZVryTspIYTGnkCz4F0KfmHwSbvppQF3PmHZ3nusW9VjwuP9x/O2daRnxGIw2hsB6dnm2JNvUYxlwN9DWWRz4rwyaHgAVVhYKC8qGz1Sni/OW01CWVAuTXfoflpvZQyo4H6Ax1vT7jLqDGSB6ZMiR4plb+Jgv/cOUv4J8xj9tcHzRHV+elW6lTKRih9nRuARx5COeXbup/Hl8bTHhwboLDA0gNvzt8MNu1O0ATCIWH1IOU1FIPBYXoxB8IgDg0dZQdzO5P9TigkXicbxhYy9N5HbvrwjCDeW6rGzc26IvOUG5FOEXzaUjx6Q2nYdnmTBDX/dlvW92HxnovSxr3AQdOUPdvRcXioJ1cTLnuqlC3Sghqpm2fIljbMoZ2iKun2GK+JuuTqiD9BIS6WFAtYhKuBdM+MK95WwwMjUFriPoDUXhmj4B4WdVcE7o1iOCoOCxsrRsDJ96QPuKI7f+p2MNB5bwfS2sFLbeQ7oYI2ig7nztRb8Rp2gzFx2EoUbmCuHZKiMYIMQeJ6+GyzzElD9k/PmBz1ul7u/fhHrBp4RQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(31686004)(66556008)(66476007)(478600001)(6916009)(66946007)(6506007)(186003)(53546011)(6512007)(38100700002)(2616005)(36756003)(8936002)(8676002)(2906002)(44832011)(41300700001)(6666004)(33964004)(6486002)(316002)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8827
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d023d8d-abdb-4834-d7bb-08db55b01ab6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EbwRq/SOEF0z0xBxwcWfCLpXC/FRJ45OtuCZFAN2O6G6LmDNRKNAsdwDwgzm2ExKZCBm1KgctNIIdC9+ETG0vz/AQXed/mRZH0EFPriAyYIPOuZvbz2hkV2F1Z6P/hRcLLQxKIDhMlC4JPtqMnN6omHzG/jAHiCmv7Sz09g/f/jclCngvkliS0S+T9tED6Zm78gESKVKgXdvp5ERQwg2IDg3B/tiFTuOoRCPCfs4GsTGVztPFOYRTP2zMeIcA5IcnkPdyKaLfgpEnPzmi/ApgFWtNo2OytHa+aU0+BgXkuAhvaQGn/qygNyjj3doZtYjlrPYxMNe8f3dtb4k8GJGkwjTTEijrdZoIypak4t//d6JqxabK1D/7LxS0wHjLNYNoyN1/MpyKENmmxNOpyWRvECeDkiyGUFNi9wqMqKKQfymOnd/WUAEJzgbJyEhSQr4NnB7He1GrEnuDp+zW4yVocCjhtA3I5UPG8X/RfhO75pR1bqgrBbJ6OpM6+iDXwKFsfyvRwOOKg4bc9mbnFeZXbtLUEjpK1pJi+epmDBITrOTV7I5rZpNT3z5Tu0SSVx4LEiVjSbLYScEBv7RJ7Uee19tPpdMt+UOVBnb0JaeOKv+3IExtXl5eKDBHXJ1y+y/64ujrcBHKhm9wnPiq/8hMipHQLFLRlV3Q85TGahxc62rxpnhPMXo57e8Le7Px+gAokjl9jm+PzpDkMy/6xXRpccZrGA2fW+2WEmLYpvt+qrupkj05qL/VN7VHHUBnltL1Gw2Y9JMzxSH5TghuiAg6A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(31686004)(36860700001)(36756003)(6916009)(44832011)(40460700003)(2906002)(31696002)(8936002)(8676002)(82310400005)(40480700001)(81166007)(316002)(86362001)(5660300002)(82740400003)(41300700001)(356005)(70206006)(70586007)(336012)(47076005)(53546011)(186003)(6506007)(6666004)(33964004)(26005)(478600001)(2616005)(6486002)(6512007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 01:51:55.4547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b89aa031-1a69-4bcf-3dd1-08db55b020c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9237

--------------HciZi8HHxWRoK3JEVWJH9fXB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/5/13 10:12, Marek Marczykowski-Górecki wrote:
> This makes the test script easier reusable for different runners, where
> console may be connected differently. Include both console= option and
> configuration for specific chosen console too (like com1= here) in the
> 'CONSOLE_OPTS' variable.
>
> Signed-off-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>

Reviewed-by: Jiamei Xie <jiamei.xie@arm.com>

--------------HciZi8HHxWRoK3JEVWJH9fXB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2023/5/13 10:12, Marek
      Marczykowski-G=C3=B3recki wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:e0504797d1b3758c035cd82b2dc3b00d7=
47ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">This makes the test script eas=
ier reusable for different runners, where
console may be connected differently. Include both console=3D option and
configuration for specific chosen console too (like com1=3D here) in the
'CONSOLE_OPTS' variable.

Signed-off-by: Marek Marczykowski-G=C3=B3recki <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisib=
lethingslab.com&gt;</a>
</pre>
    </blockquote>
    <pre class=3D"content" style=3D"box-sizing: border-box; overflow: auto;=
 font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; =
font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line=
-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wr=
ap: break-word; background-color: white; border: 0px; border-radius: 0px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial;"><span class=3D"review=
ed-by" style=3D"box-sizing: border-box;">Reviewed-by: </span><span style=3D=
"color: rgb(33, 33, 33); font-family: &quot;Roboto Mono&quot;, &quot;SF Mon=
o&quot;, &quot;Lucida Console&quot;, Monaco, monospace; font-size: 14.6318p=
x; font-style: normal; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial; display: inline !important; float: none;">Jiamei Xie &lt;</span><a hre=
f=3D"mailto:jiamei.xie@arm.com" target=3D"_blank" rel=3D"noopener" style=3D=
"border: 0px; box-sizing: border-box; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-variant-numeric: inherit; fo=
nt-variant-east-asian: inherit; font-variant-alternates: inherit; font-weig=
ht: 400; font-stretch: inherit; font-size: 14.6318px; line-height: inherit;=
 font-family: &quot;Roboto Mono&quot;, &quot;SF Mono&quot;, &quot;Lucida Co=
nsole&quot;, Monaco, monospace; font-optical-sizing: inherit; font-kerning:=
 inherit; font-feature-settings: inherit; font-variation-settings: inherit;=
 margin: 0px; padding: 0px; vertical-align: baseline; color: var(--link-col=
or); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px;" class=3D"moz-txt-link-freetext">jiamei.=
xie@arm.com</a><span style=3D"color: rgb(33, 33, 33); font-family: &quot;Ro=
boto Mono&quot;, &quot;SF Mono&quot;, &quot;Lucida Console&quot;, Monaco, m=
onospace; font-size: 14.6318px; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; display: inline !important; float: none;"=
>&gt;</span></pre>
  </body>
</html>

--------------HciZi8HHxWRoK3JEVWJH9fXB--

