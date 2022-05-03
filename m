Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE9517FCF
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319272.539467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo0n-0002zZ-HT; Tue, 03 May 2022 08:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319272.539467; Tue, 03 May 2022 08:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo0n-0002x4-E7; Tue, 03 May 2022 08:36:01 +0000
Received: by outflank-mailman (input) for mailman id 319272;
 Tue, 03 May 2022 08:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nlo0k-0000uC-Vm
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:35:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe05::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de54020-cabc-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:35:58 +0200 (CEST)
Received: from AS8PR07CA0017.eurprd07.prod.outlook.com (2603:10a6:20b:451::26)
 by PA4PR08MB6015.eurprd08.prod.outlook.com (2603:10a6:102:e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 08:35:55 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::f4) by AS8PR07CA0017.outlook.office365.com
 (2603:10a6:20b:451::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.14 via Frontend
 Transport; Tue, 3 May 2022 08:35:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 08:35:55 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 03 May 2022 08:35:55 +0000
Received: from 589ff73727ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4DB304D-C6FC-4C1B-A286-D4401E840EF4.1; 
 Tue, 03 May 2022 08:35:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 589ff73727ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 08:35:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6937.eurprd08.prod.outlook.com (2603:10a6:10:26e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Tue, 3 May
 2022 08:35:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Tue, 3 May 2022
 08:35:46 +0000
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
X-Inumbo-ID: 0de54020-cabc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QLiEOQS5JtfMXkd3GNxmUsbHs/SDNbA4BCYNugEw8RYt9qfNQEznRr/lrK4G2G89KOOGcM+frKwZvRPe6QssPqvTXkiJDnHofK65K/DCne3TjCOc+5Zd1N4g0zL31AnNoKYQXf37Sqo0YsYmCE9M1+Of2wE64f80K1sGhd4sSl0VEgrJDeyGch/UGPfAgN04M8D6Hi/jM/CJ7STGf8XlqmoHnkH5b/Uljgw+opmC55ADGCS2NuAiIhLobsGY1TC+KGNj96qECJnneX8AGSLX1Jwxd75ZnYlXG4H6NtMHH3H9JolnqHITEQx2DaxD5PeWhWFQW84WxRmdUYtIsBOJdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yda4xcJu5mnJDxkVyWw2AodnTbGtdWn9mxh+pgXoEPs=;
 b=SPIaE8TbRFViGntQVYHr8CoiQFVtptsHkkIViTXmt0CMeu8va08JpFKs9Nx1aw31KLd5RB/xjhEYFM5ujrQmbDA0itx4kUW1+LCbJ31YdJK+GN2FghwdQS4Ly5xsoeLXweNauUoSysL19gxXwkQwcVcS1ae2z2T+oo38UuDNlq8q+hHS6jaigi/oEeiG4Nhyd0g+PINLuWP5GfS6+DqmIyh7+7g7OAXn71QHsDuS6A2eWjr8qVVWoSSl6UrveiGEjREtllHrO2rxVWv2+3rZzSQ9dFQxHU2MmOwPVR8+Gvalarpaq3BLv+c2ZwIKvtHMYhfG6Ps+7scM8lB2DjQW8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yda4xcJu5mnJDxkVyWw2AodnTbGtdWn9mxh+pgXoEPs=;
 b=mRUK4URrNyS3GWHxr0xAjZNx+rFYim2YvYiUgRge7PBek0Q96V2bsHwRAHfQOo9IK87qJSWWyzYxYc72tWXa2vTS8Bn1Kc8jIieK9KvqWG5l3x2JPWM9LuQMzOLBOKW7DryPPHv51Rt0RTPtnvl6FWs62UF/4gHYR8gLPPAQREw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 994f4633e817c899
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjqoT1rKlty8qVoY/+0Ak+TRMDNtPhng8YQShn1i87hN4kQzqc3krFsloYGgSUaGUog8Ql3R8kuA+ymhqvsH+WcrWjlemYrEYgP9Zj5KJWVA8Fd6x9pee36/FarTSGQtzO5YIzx58/2ukMpDijsUy+zzN2KRO0316rM9YpWvcezOHpsHgJkZ2fnQzbNujwOALwoYwxYs5wYDT1F8jJWrZAOaDZ5kGG4leWuVvTVPa2UNlq/Bo060BH6dnFzzKQHIXiZ4c/YT1NCzf4jHBmC1FJJLZuh4ax1LsEKktIb5Ck00ZfzauDEKoh6cvZ++Y0B8OC6JugDwJ8+EmKeHQ6a6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yda4xcJu5mnJDxkVyWw2AodnTbGtdWn9mxh+pgXoEPs=;
 b=BI8sg8yQwJ+ZrPpLx8vDD2UtsMx6IEuAxP+yrekT7lU0pKDraHOk74CKsgWw3ki3H5vkHIEc4z4387JZ5sc1rcI7sIzzfgv0VpHup/HAhlVYZSOTcjR3vklYYzCAMXs4vZZkeusqX3iCD7XSGgwi4qRVp+nYO8k3+WFn6x38Npyig2NFCEukJ7H5u2tddpMbytQpbM3jLbLUQdYSCSVss9WG/yiZQ5Bm44seRZVc+dU6ie86VQRSwT2dyyq6rPHVBEFKYEmJowUadq1xObexyKlF/qDgqR9wX2JmwLM+iTNw+8QfHE6QztUm6358Z/iz5z4Ely52aqS+BR8jzV5UPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yda4xcJu5mnJDxkVyWw2AodnTbGtdWn9mxh+pgXoEPs=;
 b=mRUK4URrNyS3GWHxr0xAjZNx+rFYim2YvYiUgRge7PBek0Q96V2bsHwRAHfQOo9IK87qJSWWyzYxYc72tWXa2vTS8Bn1Kc8jIieK9KvqWG5l3x2JPWM9LuQMzOLBOKW7DryPPHv51Rt0RTPtnvl6FWs62UF/4gHYR8gLPPAQREw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Luca Miccio
	<lucmiccio@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v5 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v5 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index: AQHYXAvIGnfac0SmG02EavYMjYFNdq0M2XkA
Date: Tue, 3 May 2022 08:35:46 +0000
Message-ID: <AFDF2E68-787A-43B4-930C-BDACA527874E@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-4-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-4-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ab3d45dd-1f06-4a17-8283-08da2cdff0d5
x-ms-traffictypediagnostic:
	DB9PR08MB6937:EE_|AM5EUR03FT044:EE_|PA4PR08MB6015:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6015761EF6135364083545669DC09@PA4PR08MB6015.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c9zGTGwvVbxU0wFYrZ8W86AxWjdlWHDrQa1KJUbbqbXFwxf7Nx3ZKQ4Fptb7UmJU895hufb+zuTEpVhYfJ4bAHYFAeqnlXiRI/Sr00lgGzSkIe0s5qDGXRmxcxGBSfyB9EW8naEHPd5+i8bS7YcyG0nCkg7MvmHxYaYFDhrqfgngFXatC02LmyWvKaD6kuzJ80yrL9T40e4P4VExsOu87ETZxbmJLhJu7TV7FmbJ8ZjMUFDbkJip2USRvR31/YN7ovuT8kBUyXLWG/6B67HJr3zFe2wqSSmpjt+ki3KVOfWHXZBwj2RjSZVf1XEY/9UA3xbBncfANwzm8vxw5pK50OvMEMXlySWFjfxyYnFGCZqJ2Ts3JshkrKOskpqFQCl5allec70OzQBDj22cLaXxOyZ5yWL1XmUSHlZNyt4CLGCcD2jftnvroDyLE6+kQZ0f0Ii4V8PKrmbhBI7iVnzcFGVirL4Pfuc1yfaq/C9td6WtjFj+uMK5PqffZmbRm0kLBRQMQa9L2VWY6lsO1Fl1kL5SLqPXXM4SaGEWdYWQrCmsndV5y2Dzs0SPSeDBgOF1e5ive1Vv/tc8j3q+0d/TN7WJIPXuNDUqj2/sTsN4eYKkZ5+BpLyAKq7E7EuHNht8L3EIxrKIqRZSg8AruDno0uPETvBa5oVhS0A8Mor9nL566S9Ngj3g8CYq22SHjG4iV4d39Dyv0GTPV1MV3aGEkFZPJTrsE1yrm3xtOZgKUZAlH4A83YVjkjievo1A0xg/PqP8cmDM4NVL2+OJRlRc0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(5660300002)(2906002)(186003)(2616005)(36756003)(4744005)(83380400001)(508600001)(6486002)(6916009)(8936002)(38100700002)(38070700005)(122000001)(71200400001)(91956017)(26005)(6512007)(76116006)(8676002)(86362001)(64756008)(6506007)(66946007)(66476007)(66446008)(4326008)(66556008)(316002)(53546011)(54906003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <301DAE064B7B6F4A9609D691F6B3318D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6937
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	922333c3-378c-43a0-17d3-08da2cdfeb7d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Kt2tMzzh0M+5fmcBxKVo5+bKIA30xGioG/jtxkS0SnhYcdobJEFmA8LwhlC5b+Oxax65FlsVGKEi8xcnRvwoPZug0VzE8Bk10yH7YVSyeGI9QtvoaCHkCEKMhubbQIfsh7ovsrnFBLmnoyPYCE2U9r6I1QmjUNwF1+HjnzZpzESnZiLiZeAQw/2s1hMXDusY2OCeyoU4j2A4g+YrDQSBi9e/GeX7CvtvGYevHDvOm5P4IeI7yBo9xjxUOfz/d3/r2ADDC2LrT1S/qaELOo1DlCF4gw8prtPnp9//MjgIV7h1Zw5kmqdEaHn/GTDlAa7chjslzv25E9qUqfyroSctTOpiLk1jpJ3OcHMTVTdTVLZkWMkRTYrnjFB1/+nOmi7lrJFj6iD3xxubW1ASU+BXDaqCxvxkjQoN7N+/1PdBvUJC4rgxeaJzN67JA0l+rYveFgShH2RAvc2A1YwXO653DOQk8/EqrXMem07Lcz0+1dvvgJK+bWk3OrW+aDHyjejKQGB25zm0ELDDAru27/V9EIxgpgtp8knHRplWCoJHZ7VgC9NZz+4v7DEnLTm4m2+luizlSyub02ebOnpwhoJGfZB3Sv5PRDEnUlmRC9SujUsLwayVBPuoW4sL8KczvysuD14wEwIWM+gn7g3lWY3PyNiIvnxCci8o/NhPY5OH84roan1sGFxBHsG2fAPjfgo68I15h+BXVe3vf2xe3ffZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(53546011)(316002)(83380400001)(356005)(47076005)(107886003)(6506007)(40460700003)(508600001)(336012)(2616005)(86362001)(82310400005)(186003)(4744005)(26005)(36860700001)(6486002)(36756003)(5660300002)(2906002)(54906003)(8936002)(8676002)(70206006)(4326008)(6862004)(70586007)(81166007)(33656002)(6512007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:35:55.5575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3d45dd-1f06-4a17-8283-08da2cdff0d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6015

Hi,

> On 29 Apr 2022, at 21:57, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Export evtchn_alloc_unbound and make it __must_check.
>=20
> If "xen,enhanced" is enabled, then add to dom0less domains:
>=20
> - the hypervisor node in device tree
> - the xenstore event channel
>=20
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


