Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89144519814
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 09:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320367.541060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9OT-0000ta-AR; Wed, 04 May 2022 07:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320367.541060; Wed, 04 May 2022 07:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9OT-0000rZ-70; Wed, 04 May 2022 07:25:53 +0000
Received: by outflank-mailman (input) for mailman id 320367;
 Wed, 04 May 2022 07:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLg=VM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nm9OS-0000pG-Bu
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 07:25:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe06::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d1b6af5-cb7b-11ec-a406-831a346695d4;
 Wed, 04 May 2022 09:25:51 +0200 (CEST)
Received: from DB6PR07CA0165.eurprd07.prod.outlook.com (2603:10a6:6:43::19) by
 DB9PR08MB7177.eurprd08.prod.outlook.com (2603:10a6:10:2ca::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Wed, 4 May 2022 07:25:50 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::6b) by DB6PR07CA0165.outlook.office365.com
 (2603:10a6:6:43::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.7 via Frontend
 Transport; Wed, 4 May 2022 07:25:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 07:25:49 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 04 May 2022 07:25:48 +0000
Received: from 44a58f65f1c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 554B77AF-40FB-42D7-AED6-B7F156C36EDB.1; 
 Wed, 04 May 2022 07:25:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44a58f65f1c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 07:25:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7185.eurprd08.prod.outlook.com (2603:10a6:102:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 07:25:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 07:25:40 +0000
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
X-Inumbo-ID: 6d1b6af5-cb7b-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L8t9Ij4FFkYD6P9Dcior8pMbleREACfwbTyBRUnCMIYgZw5437zOenIR6nhKdTz+un69Ftf/MMmLh54vDDIWTn0K+pZ6LwYEsZFTD2wHZJRskrtgxlEQfMVR3CvKH1VgTyVhtJdRmsihByU8TY+j8Dj8DiA/a1PCmyh3jRkQQqvIJqlyltYDzC5iJT+MMh1ZJNtz+DghCiR6sWmaLUvez9PCsiPNkdwZoDFJ3kFri92R4HaVbCdmL3Ha27YRMHytx9yvHOTFSsKhE6ITDM2t6ZKdmsqprUI60Sghr1XcRi6di58e7ANRnxMP0MqMRpXVmJgzULXPIxQ4e2LkIPPBTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i6aKpT1Q9Wb0tSNFh84E7CqB5bX+55FNc8kTTdRO24=;
 b=SYpZsjCUtE4g7EkAQCHwpFgaZm5P4IlDoWSnHqSW/nSGGhkAoeHzsM9rWAgWjnpEx/ucHpUMmLDkhoLepHgAzihLhO3j5itjkQgXuXWbAOcoykZEiLRVgzLcsJJ6Gotf6HfLce8GohO6MRt8pPlRI2xZhHIpZaDhtIO0Xf1MDhE2TQ5hUncrzIMVLukhSKE4RNsWyBvPllWBctolHwfSVDEKzLFCa8cJGABf0mZ8Mk22akLCQAhm6KamIpGzzU8IhbqiT8nhsv4g3r2wWN1tBEAN3xvEZTguCURGqpPTHXAk1jYo/E1jUrKJo7iDyRfL/KFymxOuLhSpjJOpjTmsow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i6aKpT1Q9Wb0tSNFh84E7CqB5bX+55FNc8kTTdRO24=;
 b=uG1fFdWFLOhLmFQReDifOZjJFuRD6J10xX5oy8E7r3yeSYj/TLsu/UVv/J+aMZiOUY7NuE93nQqrQOakcEnLRy1GSNFOR4kn+qIuoom9xJpzPbHNwK82KTjYnyPI0FHO4Q6vCE0C45so2z1qN6XArBrrHWTmu0/KmfuKFaiVC5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61fd4502fcc52b69
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEW/1tsNcghplI60jU9gfIGi/4jjgrYhn4uukqz++RA9xWWjmZfXgDi5Z/Ia0ZdUcM5NVvA7BX2Hy1dUR2AmRqo5zMbrQHeNWaIq64LtxjXyKzVfyhTgQ/93SKPPvfuXAifwsMl7xdnlgUGDw1uiwSU2sBUexRjuwsqDqR7hycWDRenXadZPdrqqkpY452cCzA+qjUOz/VGQKhr41abECNw4aktVoqmcQdgo82gGm+KdR+sYREXEwVRdGmQZNkL8LzuicmoAgU/M8UvokBTxFwzbUQ3a1RTmYaAJ25HYfQoiD6PfPq7qb4zJONxRVLtLg0appZO9y/F5KEbyMEFHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i6aKpT1Q9Wb0tSNFh84E7CqB5bX+55FNc8kTTdRO24=;
 b=aZQ9JmIkXobb/xQefVbKVgcCbzhTr9QmdDqTTo4paHVnjp/8L4eYBhC6qfMPSwFgtozEYQ0tpZEBMnyky1gRpEImkq7CApYRg7hXv8+rGZW+1DoqN8DH0XmI8JdKS3ktmI6Z0UUnRt0mgoh5ydAOUJjiGbzEn8oiuDnoL3zwzY0UNbwjPK0usXdRktsYzuPXjed5RchfA/xnJs7CLvccNw1no+AOgEOciO7AVFO2uZFUWiiGEMsk9IXAGlwQaXppP2llQDUJEiKRuDLVZkJJqe2yq4DDH2FT9v5EpSxHca4t4xuSg6Una8uHmmbYiIzeM44jAf1NqnchrqtXgdzuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i6aKpT1Q9Wb0tSNFh84E7CqB5bX+55FNc8kTTdRO24=;
 b=uG1fFdWFLOhLmFQReDifOZjJFuRD6J10xX5oy8E7r3yeSYj/TLsu/UVv/J+aMZiOUY7NuE93nQqrQOakcEnLRy1GSNFOR4kn+qIuoom9xJpzPbHNwK82KTjYnyPI0FHO4Q6vCE0C45so2z1qN6XArBrrHWTmu0/KmfuKFaiVC5A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] xen/arm: Advertise workaround 1 if we apply 3
Thread-Topic: [PATCH 2/3] xen/arm: Advertise workaround 1 if we apply 3
Thread-Index: AQHYXtGhCQ41RL6ZvkCIAGwqzunCAq0Ndo4AgADcHgA=
Date: Wed, 4 May 2022 07:25:40 +0000
Message-ID: <3700FF65-C9BD-44D6-87EA-7C2B4B2A8557@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <8119538cce93516f1e78d37d578996a195686f89.1651570561.git.bertrand.marquis@arm.com>
 <becd3d5f-a5ac-a69d-40a3-b29a541773b3@xen.org>
In-Reply-To: <becd3d5f-a5ac-a69d-40a3-b29a541773b3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88c2c7f4-c006-483f-1117-08da2d9f5007
x-ms-traffictypediagnostic:
	PAXPR08MB7185:EE_|DBAEUR03FT058:EE_|DB9PR08MB7177:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7177C3A88230F5FEAC825DDB9DC39@DB9PR08MB7177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xOC2SGmrcSnsQsFpifoa7ES8lp+SMb6jWjmk+cW9MzNJzb3KxWPJlpXlTITTm1FEkVoP8UnTNAPDjhUToiWAiZqpzkyP9gKHMZn4X8ZNLgFZCycxCpEtvEAyHdLTDp8KDgBTiamyQ/fDqCBz5K3YFEdXufkjsgC9hOw5XM3h7iW/Sbcqbq2hPPt13MxCvqvRntRViRMTqx1Cu2NA/jz5L6sd7Rx/gb1Iden32yKue15V5HsTuwdGUClJc6HddSQ2vSK6BpwKAzImYepd/DLMPybCRT6QFW1wyrTV9pYJDq0IWji78qMkv/o+4tgBH61QZPs/RsFbVN42RaSQTZCAXWzpfM8TrcuSpluTABvEl+oy/osGQWlK2sYlEua9mGL2bLl1Jb+cRo3Fhnz00yJqu1VUqB+laKiUag+NkW4uRFUpzlE6OfmrwgviqkENQ1BQjuMtmSvt6x0vLatIxwa87Yh4/WeGqnn3Iyt/l9bOPt/qucs8P18m3Bgy3Yl6/Q32yIYcRVN/Bw4moWjfKakkScmJcV1UuPDoz2yhvDd++BLskKfzpAEWjvD2UM5FqBt73A+EaVKSMU81FroMCfszf4E7ZlYnd7+8N9IemtLv/hoRIgDK+hnoiOZS512MlSaFr0i0uiIzBtkUkKl2MjBsPF7lcY7l0Uj+LyIaAQ5fRDgTetfnBDUBvXWo8DkwG6++yn2Um9eJ/zLHwQSCphlEqsexqx7VqT2eQ5ZgGUIm2tZhtn8zSTFS+QPMwhFRtlNr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(508600001)(54906003)(38100700002)(38070700005)(122000001)(4744005)(6916009)(316002)(33656002)(6486002)(71200400001)(26005)(4326008)(66946007)(8676002)(76116006)(6512007)(64756008)(66476007)(66556008)(91956017)(66446008)(2616005)(83380400001)(186003)(86362001)(6506007)(53546011)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C58BD131A035140A772D28783ACA66C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be50143c-8ba4-410e-73fb-08da2d9f4aef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B78BJoJqSdYnDwaa2oB2pdlHkrsQNZNlEP4ukFFSftoaGgVR6CE0oxqXbe9Q0Abr/TAHumEDRwmNL+Xm2a+GNSIJZ+QUikXdhkiSjiu1nbl2uEzvffPV9xIzD7ci6weFLLhix5Z+rS/Q8ydRNTHui+0x23IFK37ySQgcrGVx6JCfTJsCWXXDxIR682fus6sY95vC8azxyyFcJO9KUfOtaSEKns32HtgK2CQvkGgCQX1NuORIXHRzRuo86B4dd6Fpups5pQ/xq6p2+pW99kvpUbLbAQhN5ML5Fgx+F/XeO8aX30jb1XvZOWIp5nCf2g0TrG740TSNkuKJIHk5Nfd1rAcb9lTQork7dTUbDJ/NfaJOWsp8RXsIv2YKfD28S7NOebd/GSyKhGquPDuIHN8RIc7zi3zSTe4D4nDFqKu3QepU2JBVKeos5KYMVlgKxTqSpxyqlUvNKIm2CrdorxgIAEx0gVdq2ANpis1U17v9OwnKkYwE5YheGG2uHTh/YIL6Qq6RaIyncjU/p8n+vzHxfmQZfta4d6Ki65LveHsTPnNGWIOxZvTtmDjiJYcBmJnxQfPFOxn/wWdhK6vpMrAuje+p49b4p0sVqTEAnCSYnIyQ4N1QJushzLXF88XfbCnywW6EAhvcYhcC7IrwmDQkq7C2Ufm8Hh1hE67V7WsE3Yhqnc0OU72rPOIp4s43239a
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(33656002)(47076005)(316002)(5660300002)(6486002)(36860700001)(86362001)(336012)(2906002)(8936002)(186003)(26005)(4744005)(6506007)(54906003)(508600001)(53546011)(6512007)(83380400001)(107886003)(82310400005)(356005)(2616005)(81166007)(4326008)(40460700003)(6862004)(36756003)(8676002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 07:25:49.1880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c2c7f4-c006-483f-1117-08da2d9f5007
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7177

Hi Julien,

> On 3 May 2022, at 19:17, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 03/05/2022 10:38, Bertrand Marquis wrote:
>> SMCC_WORKAROUND_3 is handling both Spectre v2 and spectre BHB.
>> So when a guest is asking if we support workaround 1, tell yes if we
>> apply workaround 3 on exception entry as it handles it.
>> This will allow guests not supporting Spectre BHB but impacted by
>> spectre v2 to still handle it correctly.
>> The modified behaviour is coherent with what the Linux kernel does in
>> KVM for guests.
>> While there use ARM_SMCCC_SUCCESS instead of 0 for the return code value
>> for workaround detection to be coherent with Workaround 2 handling.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks

>=20
> I think we should also consider for backport.

Agree.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


