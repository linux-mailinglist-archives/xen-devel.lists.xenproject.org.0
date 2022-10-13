Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DE5FD6E8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 11:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421791.667416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuP5-0004WV-G1; Thu, 13 Oct 2022 09:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421791.667416; Thu, 13 Oct 2022 09:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuP5-0004Ud-Bx; Thu, 13 Oct 2022 09:21:23 +0000
Received: by outflank-mailman (input) for mailman id 421791;
 Thu, 13 Oct 2022 09:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiuP3-0004UW-VY
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 09:21:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b06104-4ad8-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 11:21:20 +0200 (CEST)
Received: from DB6P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::30) by
 PAXPR08MB6495.eurprd08.prod.outlook.com (2603:10a6:102:dd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Thu, 13 Oct 2022 09:21:18 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::4e) by DB6P193CA0020.outlook.office365.com
 (2603:10a6:6:29::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Thu, 13 Oct 2022 09:21:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 09:21:18 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 13 Oct 2022 09:21:18 +0000
Received: from dde0b5c46ab0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83A13626-5EF0-440E-8030-A5BF28B0F14A.1; 
 Thu, 13 Oct 2022 09:21:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dde0b5c46ab0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 09:21:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5459.eurprd08.prod.outlook.com (2603:10a6:208:186::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 09:21:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 09:21:10 +0000
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
X-Inumbo-ID: 65b06104-4ad8-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CXvJzdRDkgi9y3kBea3OYtmw0n0iIy4dBMyHFkyBbrc6GCFh7zueGgsp4wLjOkZxvzK7/7RDWZDVOpIwjKl4odNewVPQ3sWIm+P4gSIa/4ry4Iivx62OIB1h1AzWjP0A2lkXfIv3kk09LjRXNsTLl2epMAPS8BLDUi+qSbWAqaCpGdVboVQ6USEGN8AofRgU/u0hOOmHtSL47CVmmMxlew6KvNzl9AHNzNXaXzJ2P4p9NS7tWCRwUFBSz1GYRHU1j494cty0WJqXhDnMKKZ/wJfTWHPdfeCRoGHINacQmkUYUF+tngFqZw1Hu+SoWd+hImunvjOPC3NjOe2oMXTqWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJV8Jn6ATABpdsHsHCkhHy9K7j3LBcCWjb2s7CdMPQU=;
 b=PcEhfTzjNanQE5ADbmweU81LGQOikt9FbZDICUtAC7mIM6VHPjKeh1VphEbjedvbxIjBf11vk4tdgzadbiXhNbXjeQ3X8gVU+A3YSSnZ3caa4/xf8ViYdQouw2JMomKW+rf90lL05KTzRx1e8R9nxpd52Yv1lUdO/kXfEICA0mtbqEymsRQ/TimXi2Be+1nKqrpoejy7WdO/6yA+7ZtLpCtCaXOMa6nY7oqHTzZNjmkO9Ue+WPyEJPbzKiHDJPRIfgn8bf0Ur4PKpdAULUkB01IV+NtN5ClP0pMwqy1uybfLPUOND/Qg9ECvLjUZoplrr8q0x1eAINjLaz13O5vYVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJV8Jn6ATABpdsHsHCkhHy9K7j3LBcCWjb2s7CdMPQU=;
 b=mWsdoScqUN9tkyLd0rD/ynxHqv2MyZQJ3kzzHrk1Hoiqs08bQRlkTMD02pN4YZB7L2Jyzhgm15maGNzHPOTYl1FKii+Jff5OtvnSMLpHM3jPGV5b9lwA9Ijk94i1slV1gJzqoDK0sm6zUZcLovc667CoFBwdF+QnLYcXLUNV7f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvY0A4oTwTCMqT/Fm00yBFgbD7pnI8JFVuCqRrmTCz5mWAFxJtNSLp1lum/GKnzFLjbTbeivIbskaTOWQBBu+4K8N+GkGxBbTPj2jW1df9VoXJvRArAvVZnRjeEUJlC8iCmZm/eB/NRk0CuH7FkB7ckLzL/ZLjapJOhWhvLNbclGY8jSN7trlzg5J28MV8QgwuohV4vz68u+YZPNZC95k5ijZjmdn9XSrYvyBAYgGz1qoymrdd7Zn7+DuGOwSXerZwRuF+EbvWLOi9Uw6kbVAmYShT2qUeU3uKAC/Pwj9HnwoJrskR4M53C9z8SWcEMrj90fgbL7/rBcuaCiNY68Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJV8Jn6ATABpdsHsHCkhHy9K7j3LBcCWjb2s7CdMPQU=;
 b=Z4XcCpQ2gGHpDdX1/Sawqokwwva8YOqt1IMJ1yjUqldw7UP6UQD4H441r8xW8hAx1DarxkRmkWIK3WCud3bXD6ZPvO+fAJh/cBFniPrI3I1VYhTv2m0/z1AYrr+CoOeKxD2ltDhvv+SqGjJZFTXh46Sq0CDCR33GQ6I5pgCWEGq76ghd/R24KAEIB6HaLBga++wXwkQuXtIgS/1nLUdskpWyDEwrWDJ8SZR7H/5BKIoHWBm9J3kSWnhLpfAZePYdLITNXMpVsFDxGHp9bsTkqVf+y4go2mcnmH5ez7mAr8oAPlevc3mYyfwT2B0qsp7kbvEA0RC5ByNS+0s2dHHQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJV8Jn6ATABpdsHsHCkhHy9K7j3LBcCWjb2s7CdMPQU=;
 b=mWsdoScqUN9tkyLd0rD/ynxHqv2MyZQJ3kzzHrk1Hoiqs08bQRlkTMD02pN4YZB7L2Jyzhgm15maGNzHPOTYl1FKii+Jff5OtvnSMLpHM3jPGV5b9lwA9Ijk94i1slV1gJzqoDK0sm6zUZcLovc667CoFBwdF+QnLYcXLUNV7f0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY3t81xdeRddBbSEGLoF20gErPe64MCngAgAAAYwA=
Date: Thu, 13 Oct 2022 09:21:10 +0000
Message-ID:
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
In-Reply-To: <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5FC7E0AB37670D45946E321E5D3B773B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5459:EE_|DBAEUR03FT025:EE_|PAXPR08MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1bb3b4-fdf6-4380-efb3-08daacfc48df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XNTXYCpSGYoRNCx2O5kIzMnX9ecfxYejoUheeq4QLanfw/yzCKhTOiWvpai45xNAKuTQJlQ6JNoN/ABa8SMDX2e1IQB2/jARD60HyKeNL39HQD1jfrHOhNl0RzZC9NWmQIiGjHzAk+PHW6CZwWeeORqMnMjIAs7lwBfqthfDxA8HjJs7xjEIX3qsfHjWsiNrGDeqpS9EVwjq6XRCrYM9vf89nAcVq1Nej9LVVe8fLCt8HXydFJqQGRbIxcIc3IjDxpftcFa4PD2ldWG8iq9POUu5BrpzWMDMAy8XRRZokJe3cT43+uxriN5edfe/HbjugtMb1rpyKAy4D0zkqXXqrNktJEFr/lZrkqXDDXJBS14LqMZWPbpTu/Q9IaB9cYoAcOZeDHRG48DjNJ6Oq4oBEp3+dLixjMt8ZneVfSoj3Qby5jY39tVXQbDKI/dxdsjMZBByO1S8A1lGpBldC3sKSO1AygfhGZaAv+uHchDFyZ1nK/SnZTIxaokB72m2Z2+ojPTmNltN4rZulSKM4vX3kaopoo2A8kAedcMzppe3822dW7Gg+FVNv+z+Wh8TWpmt4qLrNzffYvD1f2MogNnKfE6blvKUKBYlT4KP9mcCr6Bf88Xn6UWQobalo3g/aD2SHEIaeIPHGmLVWRf1gLNE1pb13xctwlV2lJB1CCSDP1QO+W/+UijbEIwKHFyLzrsxivM7zqBPytz7gjGO1/ZP0w9JtZkvdhENWv3asNEdjYGLFgnxCsTDQVUTIrSQD+V0JIHz39TZ7tD+T85jJ+ty7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(83380400001)(76116006)(66446008)(64756008)(4326008)(2906002)(8676002)(33656002)(38070700005)(66476007)(66556008)(66946007)(38100700002)(6506007)(110136005)(8936002)(26005)(52536014)(9686003)(86362001)(41300700001)(54906003)(7696005)(5660300002)(71200400001)(478600001)(186003)(122000001)(53546011)(55016003)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff4d31bd-5967-4201-6681-08daacfc445e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGRtwelePAlhUTzRkMHMcB4Qq2lllMIyuU8q5WkS9f7KXRQh2c9MJ64IP/Mrty53tfkk9nGDH+W8eWeyfInJ0xpaHuEqqw3HRW6hRtq5Y1WfKoSLnGBAzC7h8fna0fCL9E4wFL5O2/Bgsw6wiMm440beQJUrsyfN8E7onxALs693L8b+LF+62zLUnQfsARKoMsQEPm/+pPn4PkvOENFYO9TW4CJhOqZV9drwmzjBrGDDtCy2fpyQVoowVF39f9TU41HvWiiCV7dd7CmmYlkef7wwTQe6VC1TxE7Zz/dR8zb5huG6fznjITSzKBdBZmDkxPIJG0s10Q6nW7tvjLsaFrkqfK+1K1vd3M79uFuOKSQUsrE1PzDOVZUvQnkxOKT7i37+wN/lvst945LCJTCW1G5889Tru7UozfX2K7MlD5u5JoZ0LVa72hQFfRkcFxhZQfm83Cf4Vlphsw1pkv/q34c2M9e6NmKR7AzGqkDmXugxYsrZUotslBaTEbf3GcZl+W16cTbULfN0R4aWsuRs6vcYr8o+keZGyJQEBJOKcuWEfDhXyXUmauO9cGFA4JeNnELPG+ZQaJHkyBAZbt8kYMeovTZslpCy25PxFdTp2MFuAuoktBxeD19LokuIB6RqhX+FAQP33R6HWNHfILANlemEFKjmjitioJblnavhhT2+9zUsCPF3bSfmblHrhTPwdGtT+73NJ+9vV4uV1XwO0apaAR1p7PD5rIxbPPzIVSKMjwXlK4AhSzmpkEgSo3c8WwHAPxyKAgIMdOHYCJe7GQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(53546011)(6506007)(82310400005)(356005)(81166007)(54906003)(110136005)(316002)(478600001)(82740400003)(2906002)(9686003)(52536014)(186003)(41300700001)(5660300002)(8676002)(70586007)(107886003)(4326008)(55016003)(86362001)(336012)(40480700001)(83380400001)(7696005)(33656002)(8936002)(47076005)(70206006)(26005)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:21:18.0718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1bb3b4-fdf6-4380-efb3-08daacfc48df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6495

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06
IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9kb21haW5f
Y3JlYXRlKCkNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gT24gMTMvMTAvMjAyMiAwOTozOCwgSGVu
cnkgV2FuZyB3cm90ZToNCj4gPiBIYXJkd2FyZSB1c2luZyBHSUN2MiBuZWVkcyB0byBjcmVhdGUg
YSBQMk0gbWFwcGluZyBvZiA4S0IgR0lDdjIgYXJlYQ0KPiA+IHdoZW4gdGhlIGRvbWFpbiBpcyBj
cmVhdGVkLiBDb25zaWRlcmluZyB0aGUgd29yc3QgY2FzZSBvZiBwYWdlIHRhYmxlcw0KPiANCj4g
Q2FuIHlvdSBkZXNjcmliZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hhdCBpcyB0aGUgd29yc3Qg
Y2FzZSBzY2VuYXJpbz8NCg0KVGhlIHR3byBwYWdlcyB3aWxsIGJlIGNvbnNlY3V0aXZlIGJ1dCBu
b3QgbmVjZXNzYXJpbHkgaW4gdGhlIHNhbWUgTDMgcGFnZQ0KdGFibGUgc28gdGhlIHdvcnN0IGNh
c2UgaXMgNCArIDIsIGlzIHRoYXQgY29ycmVjdD8NCg0KPiANCj4gPiBhbmQga2VlcCBhIGJ1ZmZl
ciwgcG9wdWxhdGUgMTYgcGFnZXMgYXMgdGhlIGRlZmF1bHQgdmFsdWUgdG8gdGhlIFAyTQ0KPiA+
IHBhZ2VzIHBvb2wgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkgYXQgdGhlIGRvbWFpbiBjcmVhdGlv
biBzdGFnZSB0bw0KPiA+IHNhdGlzZnkgdGhlIEdJQ3YyIHJlcXVpcmVtZW50Lg0KPiA+DQo+ID4g
Rml4ZXM6IGNiZWE1YTExNDljYSAoInhlbi9hcm06IEFsbG9jYXRlIGFuZCBmcmVlIFAyTSBwYWdl
cyBmcm9tIHRoZSBQMk0NCj4gcG9vbCIpDQo+ID4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5
LldhbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiBUaGlzIHNob3VsZCBhbHNvIGJlIGJhY2twb3J0
ZWQgdG8gNC4xMywgNC4xNCwgNC4xNSBhbmQgNC4xNi4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNo
L2FybS9kb21haW4uYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPiA+IGluZGV4IDJjODRlNmRiYmIuLmU0MGUy
YmNiYTEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+ID4gQEAgLTc0MCw2ICs3NDAsMjAgQEAgaW50IGFyY2hf
ZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICAgICAgICAgICBCVUcoKTsNCj4g
PiAgICAgICB9DQo+ID4NCj4gPiArICAgIHNwaW5fbG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7
DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogSGFyZHdhcmUgdXNpbmcgR0lDdjIgbmVlZHMgdG8g
Y3JlYXRlIGEgUDJNIG1hcHBpbmcgb2YgOEtCIEdJQ3YyDQo+IGFyZWENCj4gDQo+IFRoZSB3b3Jk
aW5nIHN1Z2dlc3RzIHRoYXQgdGhpcyBpcyBvbmx5IG5lY2Vzc2FyeSBmb3IgR0lDdjIuIEJ1dCBi
ZWxvdw0KPiB0aGlzIGlzIGRvbmUgdW5jb25kaXRpb25hbGx5LiBJIGFtIGhhcHB5IHdpdGggdGhp
cyBiZWVuIGRvbmUNCj4gdW5jb25kaXRpb25hbGx5LCBidXQgSSB0aGluayB0aGlzIHNob3VsZCBi
ZSBjbGFyaWZpZWQgaGVyZS4NCg0KU3VyZSwgSSB3aWxsIGFkZCAiRm9yIEdJQ3YzLCB0aGUgYWJv
dmUtbWVudGlvbmVkIFAyTSBtYXBwaW5nIGlzIG5vdA0KbmVjZXNzYXJ5LCBidXQgc2luY2UgdGhl
IGFsbG9jYXRlZCAxNiBwYWdlcyBoZXJlIHdvdWxkIG5vdCBiZSBsb3N0LCBoZW5jZQ0KcG9wdWxh
dGUgdGhlc2UgcGFnZXMgdW5jb25kaXRpb25hbGx5IiBpZiBpdCBpcyBvayB0byB5b3UuDQoNCj4g
DQo+ID4gKyAgICAgKiB3aGVuIHRoZSBkb21haW4gaXMgY3JlYXRlZC4gQ29uc2lkZXJpbmcgdGhl
IHdvcnN0IGNhc2UgZm9yIHBhZ2UNCj4gPiArICAgICAqIHRhYmxlcyBhbmQga2VlcCBhIGJ1ZmZl
ciwgcG9wdWxhdGUgMTYgcGFnZXMgdG8gdGhlIFAyTSBwYWdlcyBwb29sDQo+IGhlcmUuDQo+ID4g
KyAgICAgKi8NCj4gPiArICAgIGlmICggKHJjID0gcDJtX3NldF9hbGxvY2F0aW9uKGQsIDE2LCBO
VUxMKSkgIT0gMCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcDJtX3NldF9hbGxvY2F0aW9u
KGQsIDAsIE5VTEwpOw0KPiANCj4gU2hvdWxkbid0IHRoaXMgYmUgZG9uZSBpbiBwMm1fZmlpbmFs
X3RlYXJkb3duKCkgdG8gY292ZXIgc28gdGhlIHBhZ2VzDQo+IHdpbGwgYmUgZnJlZWQgYW55dGhp
bmcgYWZ0ZXIgdGhpcyBjYWxsIHdpbGwgZmFpbCAoaW5jbHVkZSBpbiB0aGUgY2FsbGVyDQo+IGRv
bWFpbl9jcmVhdGUoKSk/DQoNCkhtbSwgeWVzLCBJIHdpbGwgcmVtb3ZlIHRoaXMgcDJtX3NldF9h
bGxvY2F0aW9uKGQsIDAsIE5VTEwpOyBpbiB2Mi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K
PiANCj4gPiArICAgICAgICBzcGluX3VubG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ID4g
KyAgICAgICAgZ290byBmYWlsOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgc3Bpbl91bmxvY2soJmQt
PmFyY2gucGFnaW5nLmxvY2spOw0KPiA+ICsNCj4gPiAgICAgICBpZiAoIChyYyA9IGRvbWFpbl92
Z2ljX3JlZ2lzdGVyKGQsICZjb3VudCkpICE9IDAgKQ0KPiA+ICAgICAgICAgICBnb3RvIGZhaWw7
DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

