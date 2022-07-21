Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA657C93E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372640.604481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETci-0007UB-FO; Thu, 21 Jul 2022 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372640.604481; Thu, 21 Jul 2022 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETci-0007RS-C6; Thu, 21 Jul 2022 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 372640;
 Thu, 21 Jul 2022 10:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oETcg-0007RM-PC
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:41:38 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29f5d3c-08e1-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 12:41:38 +0200 (CEST)
Received: from AS9PR06CA0368.eurprd06.prod.outlook.com (2603:10a6:20b:460::32)
 by AM6PR08MB5220.eurprd08.prod.outlook.com (2603:10a6:20b:c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Thu, 21 Jul
 2022 10:41:32 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::21) by AS9PR06CA0368.outlook.office365.com
 (2603:10a6:20b:460::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 10:41:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 10:41:31 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 21 Jul 2022 10:41:31 +0000
Received: from 70dadfa6af9d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 281CC5B1-6F6E-45BA-B922-1AABB462A9D9.1; 
 Thu, 21 Jul 2022 10:41:25 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70dadfa6af9d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 10:41:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7675.eurprd08.prod.outlook.com (2603:10a6:10:37e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:41:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 10:41:22 +0000
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
X-Inumbo-ID: b29f5d3c-08e1-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DJSuaQqqje3e09fA5yJoKhOPfLcsSpJR1Bd9BmFh81X5Gb4bJIfh/E6UF/xpCdQMlSaZxm7/6Yk/5fS6GKBwRtaD2kiQjp7h0kp+yqj7MNh2pjgBWtKityft8coiCqSS0ZQWds7zqYqK7Px4XeNWmvQhocsoFniFfoZ2B2PtkRgNzLdGMdB1EMn3Uo1H43VUARBzU18VRE3e9CcQk3Kq8zH0B8YTx/QK/do6l7x4uVL0dMNVqZljSYG8U0mZ8Aka/D6CeP6YbMDgrpPd/z+IqYJ+YNmWdopNQuXP2ExJKwE3JbSZQ3IhNS4UF4qhmx8Hcum8elvqGNU6Of2pOciVbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1TGAxKC86E82i+Y2tz5z0X+LL2+RboBagycbhTk1Eg=;
 b=S1dJU8+1/qw4pjqSkDvn8D9QZULWjmeM9WXq6YQOz41ljXCXmH/+8mB8h2KZNl32DJ+uumxyJBvW/TIiZA9tscw7Rq99sgjxpiO+tyidbmMWY4vberMZagcs4P5I1pRrDeqwGRmhmhf3z6rhDMeb8gIUcNzDskbnLHSmEvoRg29Q+hxRudgdv7QWEUb+xOdJtSSZt68creUigpPf0aiF0XGTtBredKKN/4SLWFWqtGeUXP3T1rZ0TYfrk0JrEw1+L+47qMcJL/HfgNhzcdTSBCGZ8G1gNljPgq/5mnTE15HCyoGj9LAyf/EysxJaxEuwdfvLocfMcbY9RAC1+GcWHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1TGAxKC86E82i+Y2tz5z0X+LL2+RboBagycbhTk1Eg=;
 b=JUYiayTb9Hi0a5phYi/gHwdW85XPv8Jw6zFlVlwcYMz4qwnOz9KYX2ulxl6jO4OiOvSxMUcn1vRmQOLw4uejKLNwxPk8lQbuAPVBOMTHJenTEZtWfBaEvzfcXx+JB0536NSK35H8EwY7lVjdKjFdOzys35eFE4pGnDPFfQ7eLa4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5f387c06155b1f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm8XB/LkEra5dFNPqQPd689U29x2hBX2KhVk8vr6UmQ96lkkYGl8DYKO3qkTifCTsN+JbnmTkY5CTZXjOVg9YaaGd5t22iKAUnraTdE08eNHuQwQ/tCNHvgNBhZlwZZmOto7NILx4U1owifpm+yiM22rJTmksBWFgdE9WVtL/kDP55tswGqCs6zs61xJyZqnrbTJx/uDo88t0EkyhfYoa8sF4YSC+Vbhnyg684fcMR/A4XXwfFrjsJvHbA6Ddl5VyAVTxKucUmUYumwZi85Hj9ulydkKxBVshR+RNM4COKetpPZq5RjVrKvGroMSX6K2mpCGJb4mr6sZgiE53Vm+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1TGAxKC86E82i+Y2tz5z0X+LL2+RboBagycbhTk1Eg=;
 b=c4Okt+0xQHfkDZx52OFuyMG52Qz06yhC4yNOgCf40cn1JbXi/iXHzISdZmxJl9fursyFQJSP6ncnGB3UqYD5V585xnSOOdzHI+IAUM2G/K8D9Y26TDRVar5AMsgxJWZW0QsRUnL6j+AICKvovOH2OTRc5Bku+mUXJnh+2195WXcew+i30PR6+pgWM03Ykb5kDPR0IhaNIPIckQevIlMLfjKzR8/QkJRshyB8wICeudy7j+I2I2tnjQz9U5cQmI+tvLBfen6fM20BXsznsPuvo/QrauNRtpIAY376qvbIA6lmzdFFLO404X9RzQiKBBFyejMRWC7GtubcxUVQTGyItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1TGAxKC86E82i+Y2tz5z0X+LL2+RboBagycbhTk1Eg=;
 b=JUYiayTb9Hi0a5phYi/gHwdW85XPv8Jw6zFlVlwcYMz4qwnOz9KYX2ulxl6jO4OiOvSxMUcn1vRmQOLw4uejKLNwxPk8lQbuAPVBOMTHJenTEZtWfBaEvzfcXx+JB0536NSK35H8EwY7lVjdKjFdOzys35eFE4pGnDPFfQ7eLa4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/5] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
Thread-Topic: [PATCH v2 4/5] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
Thread-Index: AQHYnGjgbGc3p9EL0UO5jUcNVt1sgq2IpAQA
Date: Thu, 21 Jul 2022 10:41:22 +0000
Message-ID: <CCD077DC-E27F-441E-A286-AA40F0625664@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-5-julien@xen.org>
In-Reply-To: <20220720184459.51582-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d0a241d2-192c-41a2-1ec1-08da6b059361
x-ms-traffictypediagnostic:
	DB9PR08MB7675:EE_|VE1EUR03FT013:EE_|AM6PR08MB5220:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0wJgKS6k7gH6fYA4OrDSkb/qx3cv5m6oDYLoqvpAt94W6+w61+RL+d+QqLo43nS9vlak4c3w/bExjI2foljbL0UploXHL67PNyOr+7uyS1KIjD/JGdfC37jiY+ix0+YzPUJphuwtpag91VpblSYopil1NVHnyTXDAXNwPNB4exHQr2s8lQ1Z41rpJWkidUDVY2LRuXPxVdZZyAtDCYClXt2mvXw+Ow4S8FiHRvvqOWK1q5HEVsAHfLQJs2NlV5Ht8UCAc7ygBOi924/8e3T74bu4UB3ipQFP8jzu7fho1SsZCtI8+gUqYfh9EusT0/jK3rShsosjL047kG8dDun8n5ZJ9hChY+/Fxsz7rnGrBgYprdZIDp4SGshh7N3qk0K3pkTyDzfIdfQ7G0CS7n3OiV12YiDNbH05AhqPPH3bI4ULgXYeGwTiGhJ1fjq2nVF3dG63Jxs2rtVjoLmwkQOmFJWsMIqEoC+/CambD81GMZV9MbnOMCcd8L7ernL4gNKa2xgg48yAFxnDOekpoWpXKZCClqkvZ2+iAuBULM8h5EHCO00DCGkX0Zfkl0rEC2k6jYj7o7DyhiGIGpbKyU/xroNDtViqhR7vbPhnyVYgohJ3cc+uPAn8HzSjlY2fUYzMsJiApsxS8CRYADmjy4i77cpDlH6DaQxAkbbn6nE/3BPsbwuh/DCPNqykBBQIVV7g8v5DoVJmmzE29vOmlV6/t3sAcgqKZ/hWIB3ZJanKzu0b2ctUELbl2Guj1O80FQeGx5tmOdPh3RD07V74X64j7fJ0o2Bd0dWhSyFjA2V+e2Tdsyo9PDxDR5IVIgKZIVkSysvfspD464Ays4OHdYZ24w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(53546011)(26005)(41300700001)(186003)(6506007)(2906002)(2616005)(6512007)(122000001)(83380400001)(86362001)(33656002)(38070700005)(66446008)(38100700002)(5660300002)(478600001)(316002)(71200400001)(54906003)(36756003)(64756008)(8936002)(8676002)(66556008)(66476007)(66946007)(6486002)(6916009)(4326008)(30864003)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB5098DE6226424EA0202C1CB5EA0BBC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66903634-7d9f-4a9d-5b00-08da6b058dde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iKQjMHH8M6nwafvcbUZxkhPGSCvymwlLuOcorUdD3j3lbBhAuH94Z0YWWDNqRE+ckn0Ztmhal4SOCSJvkOVmI5lmRTwv4LwmWh6VltJMz7XD2ZU1+eq3qoa7SpYPCOnAmAeBeO/bIZ56NyGnOrAcm+GacxxrKMrOzTNj54yKjfhXwbiKwE5SqygM8NfOCHLlvp08jLH0Ml+k13oiXQCr1/9TVqlc6Y+BRYo5wl8dFIFuW7C6GUQlCW45qf6oxh1J4Lw72n3M7A4eeDEAgS4G5aHtOAvr7hx/FGLOPx44PqFY0VKIZKaylnpoQzpUZDQ7y/okfkwmHVEy7hrszsbr9TicvkG/WSokW3SNMjv1wxnlZqmFXw4rBPKjDcpus0rpzyrvYGjnFZSqvGB/KfaVzHBgXCUUwzA85JZNQdzx+T3pxqNSOM4l3QlH0vmPGHiZ7eihDCHxZXUtrD671XL5vvoMoUICUZWitvI6ZOMmer7rttrSjRGz7nRrlLsi9Z+gC6MxrymVDyOoquOfM80/jF5E4ky13s5ZB8XzfYn0E7svPS7qPBVSgQjNWBFsWhyFK7pX9fSHZNKly1vg1fZKB2ygvQ9KGyU0VJotE4AZ47kGbUBKXIJxK+K+/plTJtObj2hk3/ha4egvLT+2yr8kvyyVmb3Mg4wIpd+ZMKnNn+OT6pHJv3/vsraHkYxxudMZGDKnO+3vkOIsOBK5B/z3uiD97+B1ZWe89FJXjCTWd+iva5Rb2jTnKx2d3pYY+9rPzMv0/5P40ad8BjGnCyX/UH48W4uiSXo7CHl+QyoKiM4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(40470700004)(26005)(41300700001)(6512007)(54906003)(36860700001)(336012)(6506007)(82310400005)(5660300002)(8936002)(186003)(30864003)(6862004)(40460700003)(2906002)(356005)(478600001)(40480700001)(83380400001)(53546011)(4326008)(316002)(47076005)(2616005)(36756003)(70586007)(81166007)(70206006)(8676002)(82740400003)(86362001)(6486002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:41:31.6564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a241d2-192c-41a2-1ec1-08da6b059361
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220

Hi Julien,

> On 20 Jul 2022, at 19:44, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The file xen/arch/mm.c has been growing quite a lot. It now contains
> various independent part of the MM subsytem.
>=20
> One of them is the helpers to map/unmap a page which is only used
> by arm32 and protected by CONFIG_ARCH_MAP_DOMAIN_PAGE. Move them in a
> new file xen/arch/arm/domain_page.c.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the kconfig part removed:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ----
>    Changes in v2:
>        - Move CONFIG_* to Kconfig is now in a separate patch
> ---
> xen/arch/arm/Makefile               |   1 +
> xen/arch/arm/domain_page.c          | 193 +++++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm32/mm.h |   6 +
> xen/arch/arm/include/asm/lpae.h     |  17 +++
> xen/arch/arm/mm.c                   | 198 +---------------------------
> xen/common/Kconfig                  |   3 +
> 6 files changed, 222 insertions(+), 196 deletions(-)
> create mode 100644 xen/arch/arm/domain_page.c
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index bb7a6151c13c..4d076b278b10 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -17,6 +17,7 @@ obj-y +=3D device.o
> obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
> obj-y +=3D domain.o
> obj-y +=3D domain_build.init.o
> +obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) +=3D domain_page.o
> obj-y +=3D domctl.o
> obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> obj-y +=3D efi/
> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> new file mode 100644
> index 000000000000..63e97730cf57
> --- /dev/null
> +++ b/xen/arch/arm/domain_page.c
> @@ -0,0 +1,193 @@
> +#include <xen/mm.h>
> +#include <xen/pmap.h>
> +#include <xen/vmap.h>
> +
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
> +/* cpu0's domheap page tables */
> +static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
> +
> +/*
> + * xen_dommap =3D=3D pages used by map_domain_page, these pages contain
> + * the second level pagetables which map the domheap region
> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
> + */
> +static DEFINE_PER_CPU(lpae_t *, xen_dommap);
> +
> +/*
> + * Prepare the area that will be used to map domheap pages. They are
> + * mapped in 2MB chunks, so we need to allocate the page-tables up to
> + * the 2nd level.
> + *
> + * The caller should make sure the root page-table for @cpu has been
> + * allocated.
> + */
> +bool init_domheap_mappings(unsigned int cpu)
> +{
> +    unsigned int order =3D get_order_from_pages(DOMHEAP_SECOND_PAGES);
> +    lpae_t *root =3D per_cpu(xen_pgtable, cpu);
> +    unsigned int i, first_idx;
> +    lpae_t *domheap;
> +    mfn_t mfn;
> +
> +    ASSERT(root);
> +    ASSERT(!per_cpu(xen_dommap, cpu));
> +
> +    /*
> +     * The domheap for cpu0 is before the heap is initialized. So we
> +     * need to use pre-allocated pages.
> +     */
> +    if ( !cpu )
> +        domheap =3D cpu0_dommap;
> +    else
> +        domheap =3D alloc_xenheap_pages(order, 0);
> +
> +    if ( !domheap )
> +        return false;
> +
> +    /* Ensure the domheap has no stray mappings */
> +    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
> +
> +    /*
> +     * Update the first level mapping to reference the local CPUs
> +     * domheap mapping pages.
> +     */
> +    mfn =3D virt_to_mfn(domheap);
> +    first_idx =3D first_table_offset(DOMHEAP_VIRT_START);
> +    for ( i =3D 0; i < DOMHEAP_SECOND_PAGES; i++ )
> +    {
> +        lpae_t pte =3D mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
> +        pte.pt.table =3D 1;
> +        write_pte(&root[first_idx + i], pte);
> +    }
> +
> +    per_cpu(xen_dommap, cpu) =3D domheap;
> +
> +    return true;
> +}
> +
> +void *map_domain_page_global(mfn_t mfn)
> +{
> +    return vmap(&mfn, 1);
> +}
> +
> +void unmap_domain_page_global(const void *va)
> +{
> +    vunmap(va);
> +}
> +
> +/* Map a page of domheap memory */
> +void *map_domain_page(mfn_t mfn)
> +{
> +    unsigned long flags;
> +    lpae_t *map =3D this_cpu(xen_dommap);
> +    unsigned long slot_mfn =3D mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
> +    vaddr_t va;
> +    lpae_t pte;
> +    int i, slot;
> +
> +    local_irq_save(flags);
> +
> +    /* The map is laid out as an open-addressed hash table where each
> +     * entry is a 2MB superpage pte.  We use the available bits of each
> +     * PTE as a reference count; when the refcount is zero the slot can
> +     * be reused. */
> +    for ( slot =3D (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i =
=3D 0;
> +          i < DOMHEAP_ENTRIES;
> +          slot =3D (slot + 1) % DOMHEAP_ENTRIES, i++ )
> +    {
> +        if ( map[slot].pt.avail < 0xf &&
> +             map[slot].pt.base =3D=3D slot_mfn &&
> +             map[slot].pt.valid )
> +        {
> +            /* This slot already points to the right place; reuse it */
> +            map[slot].pt.avail++;
> +            break;
> +        }
> +        else if ( map[slot].pt.avail =3D=3D 0 )
> +        {
> +            /* Commandeer this 2MB slot */
> +            pte =3D mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
> +            pte.pt.avail =3D 1;
> +            write_pte(map + slot, pte);
> +            break;
> +        }
> +
> +    }
> +    /* If the map fills up, the callers have misbehaved. */
> +    BUG_ON(i =3D=3D DOMHEAP_ENTRIES);
> +
> +#ifndef NDEBUG
> +    /* Searching the hash could get slow if the map starts filling up.
> +     * Cross that bridge when we come to it */
> +    {
> +        static int max_tries =3D 32;
> +        if ( i >=3D max_tries )
> +        {
> +            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n"=
, i);
> +            max_tries *=3D 2;
> +        }
> +    }
> +#endif
> +
> +    local_irq_restore(flags);
> +
> +    va =3D (DOMHEAP_VIRT_START
> +          + (slot << SECOND_SHIFT)
> +          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
> +
> +    /*
> +     * We may not have flushed this specific subpage at map time,
> +     * since we only flush the 4k page not the superpage
> +     */
> +    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
> +
> +    return (void *)va;
> +}
> +
> +/* Release a mapping taken with map_domain_page() */
> +void unmap_domain_page(const void *va)
> +{
> +    unsigned long flags;
> +    lpae_t *map =3D this_cpu(xen_dommap);
> +    int slot =3D ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHI=
FT;
> +
> +    if ( !va )
> +        return;
> +
> +    local_irq_save(flags);
> +
> +    ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
> +    ASSERT(map[slot].pt.avail !=3D 0);
> +
> +    map[slot].pt.avail--;
> +
> +    local_irq_restore(flags);
> +}
> +
> +mfn_t domain_page_map_to_mfn(const void *ptr)
> +{
> +    unsigned long va =3D (unsigned long)ptr;
> +    lpae_t *map =3D this_cpu(xen_dommap);
> +    int slot =3D (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
> +    unsigned long offset =3D (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
> +
> +    if ( (va >=3D VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIR=
T_SIZE) )
> +        return virt_to_mfn(va);
> +
> +    ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
> +    ASSERT(map[slot].pt.avail !=3D 0);
> +
> +    return mfn_add(lpae_get_mfn(map[slot]), offset);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/a=
sm/arm32/mm.h
> index 575373aeb985..8bfc906e7178 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -1,6 +1,12 @@
> #ifndef __ARM_ARM32_MM_H__
> #define __ARM_ARM32_MM_H__
>=20
> +#include <xen/percpu.h>
> +
> +#include <asm/lpae.h>
> +
> +DECLARE_PER_CPU(lpae_t *, xen_pgtable);
> +
> /*
>  * Only a limited amount of RAM, called xenheap, is always mapped on ARM3=
2.
>  * For convenience always return false.
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/l=
pae.h
> index fc19cbd84772..3fdd5d0de28e 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -261,6 +261,23 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr=
);
> #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
>=20
> +/*
> + * Macros to define page-tables:
> + *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
> + *  in assembly code before BSS is zeroed.
> + *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
> + *  page-tables to be used after BSS is zeroed (typically they are only =
used
> + *  in C).
> + */
> +#define DEFINE_BOOT_PAGE_TABLE(name)                                    =
      \
> +lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")             =
      \
> +    name[XEN_PT_LPAE_ENTRIES]
> +
> +#define DEFINE_PAGE_TABLES(name, nr)                    \
> +lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
> +
> +#define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
> +
> #endif /* __ARM_LPAE_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7a722d6c86c6..ad26ad740308 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -57,23 +57,6 @@ mm_printk(const char *fmt, ...) {}
>     } while (0)
> #endif
>=20
> -/*
> - * Macros to define page-tables:
> - *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
> - *  in assembly code before BSS is zeroed.
> - *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
> - *  page-tables to be used after BSS is zeroed (typically they are only =
used
> - *  in C).
> - */
> -#define DEFINE_BOOT_PAGE_TABLE(name)                                    =
      \
> -lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")             =
      \
> -    name[XEN_PT_LPAE_ENTRIES]
> -
> -#define DEFINE_PAGE_TABLES(name, nr)                    \
> -lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
> -
> -#define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
> -
> /* Static start-of-day pagetables that we use before the allocators
>  * are up. These are used by all CPUs during bringup before switching
>  * to the CPUs own pagetables.
> @@ -110,7 +93,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
> /* Main runtime page tables */
>=20
> /*
> - * For arm32 xen_pgtable and xen_dommap are per-PCPU and are allocated b=
efore
> + * For arm32 xen_pgtable are per-PCPU and are allocated before
>  * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
>  *
>  * xen_second, xen_fixmap and xen_xenmap are always shared between all
> @@ -126,18 +109,10 @@ static DEFINE_PAGE_TABLE(xen_first);
> #define HYP_PT_ROOT_LEVEL 1
> /* Per-CPU pagetable pages */
> /* xen_pgtable =3D=3D root of the trie (zeroeth level on 64-bit, first on=
 32-bit) */
> -static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> +DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> -/*
> - * xen_dommap =3D=3D pages used by map_domain_page, these pages contain
> - * the second level pagetables which map the domheap region
> - * starting at DOMHEAP_VIRT_START in 2MB chunks.
> - */
> -static DEFINE_PER_CPU(lpae_t *, xen_dommap);
> /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated *=
/
> static DEFINE_PAGE_TABLE(cpu0_pgtable);
> -/* cpu0's domheap page tables */
> -static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
> #endif
>=20
> /* Common pagetable leaves */
> @@ -371,175 +346,6 @@ void clear_fixmap(unsigned int map)
>     BUG_ON(res !=3D 0);
> }
>=20
> -#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> -/*
> - * Prepare the area that will be used to map domheap pages. They are
> - * mapped in 2MB chunks, so we need to allocate the page-tables up to
> - * the 2nd level.
> - *
> - * The caller should make sure the root page-table for @cpu has been
> - * allocated.
> - */
> -bool init_domheap_mappings(unsigned int cpu)
> -{
> -    unsigned int order =3D get_order_from_pages(DOMHEAP_SECOND_PAGES);
> -    lpae_t *root =3D per_cpu(xen_pgtable, cpu);
> -    unsigned int i, first_idx;
> -    lpae_t *domheap;
> -    mfn_t mfn;
> -
> -    ASSERT(root);
> -    ASSERT(!per_cpu(xen_dommap, cpu));
> -
> -    /*
> -     * The domheap for cpu0 is before the heap is initialized. So we
> -     * need to use pre-allocated pages.
> -     */
> -    if ( !cpu )
> -        domheap =3D cpu0_dommap;
> -    else
> -        domheap =3D alloc_xenheap_pages(order, 0);
> -
> -    if ( !domheap )
> -        return false;
> -
> -    /* Ensure the domheap has no stray mappings */
> -    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
> -
> -    /*
> -     * Update the first level mapping to reference the local CPUs
> -     * domheap mapping pages.
> -     */
> -    mfn =3D virt_to_mfn(domheap);
> -    first_idx =3D first_table_offset(DOMHEAP_VIRT_START);
> -    for ( i =3D 0; i < DOMHEAP_SECOND_PAGES; i++ )
> -    {
> -        lpae_t pte =3D mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
> -        pte.pt.table =3D 1;
> -        write_pte(&root[first_idx + i], pte);
> -    }
> -
> -    per_cpu(xen_dommap, cpu) =3D domheap;
> -
> -    return true;
> -}
> -
> -void *map_domain_page_global(mfn_t mfn)
> -{
> -    return vmap(&mfn, 1);
> -}
> -
> -void unmap_domain_page_global(const void *va)
> -{
> -    vunmap(va);
> -}
> -
> -/* Map a page of domheap memory */
> -void *map_domain_page(mfn_t mfn)
> -{
> -    unsigned long flags;
> -    lpae_t *map =3D this_cpu(xen_dommap);
> -    unsigned long slot_mfn =3D mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
> -    vaddr_t va;
> -    lpae_t pte;
> -    int i, slot;
> -
> -    local_irq_save(flags);
> -
> -    /* The map is laid out as an open-addressed hash table where each
> -     * entry is a 2MB superpage pte.  We use the available bits of each
> -     * PTE as a reference count; when the refcount is zero the slot can
> -     * be reused. */
> -    for ( slot =3D (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i =
=3D 0;
> -          i < DOMHEAP_ENTRIES;
> -          slot =3D (slot + 1) % DOMHEAP_ENTRIES, i++ )
> -    {
> -        if ( map[slot].pt.avail < 0xf &&
> -             map[slot].pt.base =3D=3D slot_mfn &&
> -             map[slot].pt.valid )
> -        {
> -            /* This slot already points to the right place; reuse it */
> -            map[slot].pt.avail++;
> -            break;
> -        }
> -        else if ( map[slot].pt.avail =3D=3D 0 )
> -        {
> -            /* Commandeer this 2MB slot */
> -            pte =3D mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
> -            pte.pt.avail =3D 1;
> -            write_pte(map + slot, pte);
> -            break;
> -        }
> -
> -    }
> -    /* If the map fills up, the callers have misbehaved. */
> -    BUG_ON(i =3D=3D DOMHEAP_ENTRIES);
> -
> -#ifndef NDEBUG
> -    /* Searching the hash could get slow if the map starts filling up.
> -     * Cross that bridge when we come to it */
> -    {
> -        static int max_tries =3D 32;
> -        if ( i >=3D max_tries )
> -        {
> -            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n"=
, i);
> -            max_tries *=3D 2;
> -        }
> -    }
> -#endif
> -
> -    local_irq_restore(flags);
> -
> -    va =3D (DOMHEAP_VIRT_START
> -          + (slot << SECOND_SHIFT)
> -          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
> -
> -    /*
> -     * We may not have flushed this specific subpage at map time,
> -     * since we only flush the 4k page not the superpage
> -     */
> -    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
> -
> -    return (void *)va;
> -}
> -
> -/* Release a mapping taken with map_domain_page() */
> -void unmap_domain_page(const void *va)
> -{
> -    unsigned long flags;
> -    lpae_t *map =3D this_cpu(xen_dommap);
> -    int slot =3D ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHI=
FT;
> -
> -    if ( !va )
> -        return;
> -
> -    local_irq_save(flags);
> -
> -    ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
> -    ASSERT(map[slot].pt.avail !=3D 0);
> -
> -    map[slot].pt.avail--;
> -
> -    local_irq_restore(flags);
> -}
> -
> -mfn_t domain_page_map_to_mfn(const void *ptr)
> -{
> -    unsigned long va =3D (unsigned long)ptr;
> -    lpae_t *map =3D this_cpu(xen_dommap);
> -    int slot =3D (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
> -    unsigned long offset =3D (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
> -
> -    if ( (va >=3D VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIR=
T_SIZE) )
> -        return virt_to_mfn(va);
> -
> -    ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
> -    ASSERT(map[slot].pt.avail !=3D 0);
> -
> -    return mfn_add(lpae_get_mfn(map[slot]), offset);
> -}
> -#endif
> -
> void flush_page_to_ram(unsigned long mfn, bool sync_icache)
> {
>     void *v =3D map_domain_page(_mfn(mfn));
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index f1ea3199c8eb..f0aee2cfd9f8 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -11,6 +11,9 @@ config COMPAT
> config CORE_PARKING
> 	bool
>=20
> +config DOMAIN_PAGE
> +	bool
> +
> config GRANT_TABLE
> 	bool "Grant table support" if EXPERT
> 	default y
> --=20
> 2.32.0
>=20
>=20


