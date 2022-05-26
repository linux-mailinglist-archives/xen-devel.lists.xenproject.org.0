Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD00534CFF
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 12:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337531.562146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuARf-0004Wb-49; Thu, 26 May 2022 10:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337531.562146; Thu, 26 May 2022 10:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuARe-0004UH-Vv; Thu, 26 May 2022 10:10:18 +0000
Received: by outflank-mailman (input) for mailman id 337531;
 Thu, 26 May 2022 10:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paGh=WC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nuARd-0004UB-Kh
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 10:10:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a3cefd3-dcdc-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 12:10:16 +0200 (CEST)
Received: from DB6PR0202CA0027.eurprd02.prod.outlook.com (2603:10a6:4:a5::13)
 by AM0PR08MB4609.eurprd08.prod.outlook.com (2603:10a6:208:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Thu, 26 May
 2022 10:10:15 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::21) by DB6PR0202CA0027.outlook.office365.com
 (2603:10a6:4:a5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 10:10:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 10:10:14 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Thu, 26 May 2022 10:10:14 +0000
Received: from a68071cc5754.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24D95180-D7BA-4E82-9182-3F945E1F99F6.1; 
 Thu, 26 May 2022 10:10:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a68071cc5754.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 10:10:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 10:10:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 10:10:06 +0000
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
X-Inumbo-ID: 0a3cefd3-dcdc-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d5W7e+DjeOq7gz3sM7b6MDSuIgzFZz6pwBPT675x7t/Npbf7ohZH3qE0TbFEuENudThCxXV5nL7CynDs+CfFwc4Cu4yWavwDzBVrgveHJhFKcknlMnvNOv4aTsoy8akRoDs6BFGXGtNLeAZXXWu3FwVfablgcgXDgl7UtXEMlZjZY++PJR9uJlhIWqZEKkhFG2N0mc9z8DAhuDEK9O6pzZBgJhoBsbqF5IdzDKBCoyzds0Zcn6xN/e6yF1ioHSNMGGgcgzajauhSMRjUNiVxSI+ktMd3clyOSFRBtc/x03vbVhVmBCLKYDNSVI2PTdkIYx2hNx03ks32KkD0GizDVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8UITn91FnvY8HhDxe5rHXOeAambHx3RHnejjSQpW1c=;
 b=J91DtUON7yvcZyrxhtRgGQsUAmZkgLvCOtravpvOjeBiWZr7m2TrtOAMS/8g9A1rx4DZ9lTcKlwhscz5/D0OWZZzL5yKGgELlcZqRJzV7ip5nhfJ4vCZrkfKmInAWi2B3pEUmY85lOXn8vtWtXFnyRq+jAj+MoGpB1opOD7BndsTDjivaB4jgGComurKz7M9oTPDRx9FU4cd1gXIoB9NvNybvVsOO9/DyqwguzYWM5g25XzXlqF3ufuuz2EX7w0mu9xVc2C0w2OOUwHIeI+kK42rJiKg8S8GbzVSKu0kqWkKu1hizaJpihQyOoiTzDRCVca90yXkNcz89f6KHlCzWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8UITn91FnvY8HhDxe5rHXOeAambHx3RHnejjSQpW1c=;
 b=Jh4eOy/Q6ByEm/aghdPG6B/jW65YBh+hiVILNyLhzxdBkqAF9TvbDWoPaOtrrpef0Ysr30O19gVXKZtEvEGhHuW/4Po0KzN/NGPv8enrGu8R2e4yQHVwVD2Rk8GQU9qpNUYlP7tiftO4kZ0kWiiqx00GeMMmnxOUEWJCta55dM0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de5437d9066eac02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6msmo87+pPxbdmNhTbhLqxvqFEnzIAwGfniQ0/f9N6sd30su9eKzH+mWCipjtyIVyAEx41nl879aNtCvsWicRvi15mBwLbfUdIcVF9GTsGPSbeLtIh5lDTn6GBKMBcFe29l5Fc00xdoqUQVCSpOy2OrsuIbu2exXQwT8zAyA8rEmaSheBWJOXEUNVDzCJh0jva/VMi/J70y5pat93qdeOxebUofnJfT+HBptlOLi8ysP71UYFbH4Q5ty9Fh1KWSUOHRRqbd8Bk0bXYd1pSbx0kU77QVVf0GnRT33ZIU4Zt4Sg+jn7PCFi9hU/OVzsuf5H3Ooz4syQkRDZiOeDybPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8UITn91FnvY8HhDxe5rHXOeAambHx3RHnejjSQpW1c=;
 b=Lvej6QQ46X1tlF+YYeOknQsUuYP7ITV3JAKlGPbWwdfV+NlbQ83aH76wI6OtPMbUHI4f7u72WHnaajlXxnv+34UbsACCrAB6nVPbdzdNAjEb3IpJ4cgFLoY9OsSjBSn34SBNLwt5Z/zC/gQmsJ7iNe5QsHidAiqnDY96QRxPVFXaaAJoPnnZ3hRbprf6cxeZ350pDjlVn9n2FK0LyVlwZmn0wUW5+xRZRsYM63p9KywdPMZypjLIoz/lw8Pf3aEsgQmN+BJDOAMdJEywXBazTu4ZO6OEMxryPXruRQrNHC85SycBUr1Ke3Yx8DmxcqGIcL02dy8x7vNJu9bisCS1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8UITn91FnvY8HhDxe5rHXOeAambHx3RHnejjSQpW1c=;
 b=Jh4eOy/Q6ByEm/aghdPG6B/jW65YBh+hiVILNyLhzxdBkqAF9TvbDWoPaOtrrpef0Ysr30O19gVXKZtEvEGhHuW/4Po0KzN/NGPv8enrGu8R2e4yQHVwVD2Rk8GQU9qpNUYlP7tiftO4kZ0kWiiqx00GeMMmnxOUEWJCta55dM0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"julien@xen.org" <julien@xen.org>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
Thread-Topic: [PATCH 2/2] docs/misra: add Rule 5.1
Thread-Index: AQHYb89RqYcZa7uXSUe8aa9iaX1mVK0vPZ+AgAEfowCAAIxHgIAACGKA
Date: Thu, 26 May 2022 10:10:05 +0000
Message-ID: <F44719E4-B4A4-4C88-840C-055E61969028@arm.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-2-sstabellini@kernel.org>
 <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com>
 <alpine.DEB.2.22.394.2205251813290.1905099@ubuntu-linux-20-04-desktop>
 <39c930ba-f5b4-14a4-ec48-19dba9a21509@suse.com>
In-Reply-To: <39c930ba-f5b4-14a4-ec48-19dba9a21509@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 594eb094-8bba-44bc-8c7e-08da3effed55
x-ms-traffictypediagnostic:
	AS8PR08MB6853:EE_|DBAEUR03FT018:EE_|AM0PR08MB4609:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB46096AEDC51D105FE432F4A39DD99@AM0PR08MB4609.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lorGMc5B03LaDaM7b4ZZCSLwU2gdicbMCCmPxRqBBSoRts6rIGzPoCI0hxZhF+k0dTOntVOoL9Q3q0Nl7Nr0WPy9w9ju78NtOTw3cfJ8lwqycr4rTOfWu7G3K3ETU736Zi235hvHAuMLmXrGXofVdRNyUB8bTskDzTQGrxwCBUbO1C+82ibJL3kOk8RlNNR6U5R08DEkvWJcvv10TxMa2CXDghbnc8hyLwoxGt/zRKpRKOhNKh+3XjRj9lU74S6Gkx+t82hG0bf75tHBDgX1Rkz+Ejy1cgG7vEJV7Dg+zyYOm7YKsHyH4gmbt1L5usWOh8Z4KzGCXx7Iyeby/NEdr+wKoLAEMCkTZpTyQIXPqSAjAdF0Uaql90ka4kMfny7puEdE7niZU3bCC+QHJcGFFTd5TtC600PHoAZ3OM/fprRASLIpFAV+425hRjsHll4TnWtFVJV/kBfDiujAn8+Ys4K4Xn3f0qZiiymS8zHV5DrOyRbUHWlkStTZBej5SvYwIdguxoXG+6OO5tAx7mF9JGo7SfV8bAPjZ7/3US/E/ZPRUHKE3f2rceaKq6KMzu3MWYR23EheMqeyJ5eQOSXT+RVtiY+3kty2Ss5iYqr8BJdYPXKeP4um87ojB+t+y2MVffLH5W2JxICf4GMiFaS7A0yLw3ct0Dqkxx+MO1UaopcqcSi7XaT0JN2Qppvp47i9oVVakkR5FWsc2+r4jEklWoyXa+Mhsz+TW2YjML6g73HOkBgSBLtPMJxmjBPNg84O
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2906002)(508600001)(6506007)(71200400001)(6512007)(5660300002)(33656002)(186003)(91956017)(38100700002)(83380400001)(36756003)(8936002)(54906003)(122000001)(38070700005)(26005)(316002)(86362001)(8676002)(4326008)(53546011)(66446008)(66476007)(64756008)(76116006)(6916009)(2616005)(66556008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EED9ED9248D5EC4FA9A91A9C6C13502D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6853
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8abb25f-5049-4ef4-8f2c-08da3effe801
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kg7MsJ5b2gYgwxXmFfZgfxEcB+Xd6Lx7BtGDTaXgV92XUpIlXXRUhPoOpx9VS+up3VY81ttrMv8tzDZfPGYqA/FWe34WRhuOJkPjeORLiqG33xhiyy42U0jvXhQ7HSp8vC3YDphJ0LFL4iJEn965o1xqyb90QcTnhUfl8W7WclGb9NPREiW3d5uWQHB87O8Yv80CT9Z4fOSl22Dq6fAR2G5RZ9sR78hFggPgGwwJn6aSmgY+QOO8pPTi+wsXAmgKhL44ib2noDoSyv5daIsMNE3wGt5IsUD/FRtb5VH65MEfwYJb1KqFA4UZ3hi5B+UcLaSWNllW9lOBYR4J0lYx/Hc62FmYY+PsZJm3AXW4EdkFDpbiMq4Nl2EfTmLEnJJyqcgTDwTA8kuFtRJb3REzsdGvBzXs8oB18GTySzFuZHVo4yYNAqIVY3CssRHb/3J1VtY+0RxcnZ12Y+uMBdDRmIeCm6iri33CU5kNFcq5QjgzbkY+R8phQtg8aszp3dHxfnoDazc+I+Oh9Y8LXFHxL2XFHq+2MFFckeuKF1ajt/FONo2KLYeuqcdvGMIp3YDtjxolJYW6tJ/pnhzzalm29E1m5uz/IXIV3QUulzeEW2cKiKjkBmQJvz4YEZU9wGL+JVvkoB8rz0Mqjhn+GqNdS9Vnc8SHsYlGfoewAUGY14PmBZp/nXfWHF98XfDIHE0E
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(81166007)(53546011)(6862004)(2906002)(4326008)(6486002)(6506007)(8676002)(8936002)(33656002)(508600001)(356005)(36860700001)(5660300002)(316002)(86362001)(83380400001)(2616005)(54906003)(47076005)(36756003)(336012)(82310400005)(186003)(40460700003)(6512007)(26005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 10:10:14.5735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594eb094-8bba-44bc-8c7e-08da3effed55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4609

DQoNCj4gT24gMjYgTWF5IDIwMjIsIGF0IDEwOjQwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjYuMDUuMjAyMiAwMzoxOCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPj4gT24gV2VkLCAyNSBNYXkgMjAyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMjUuMDUuMjAyMiAwMjozNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBG
cm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0K
Pj4+PiANCj4+Pj4gQWRkIFJ1bGUgNS4xLCB3aXRoIHRoZSBhZGRpdGlvbmFsIG5vdGUgdGhhdCB0
aGUgY2hhcmFjdGVyIGxpbWl0IGZvciBYZW4NCj4+Pj4gaXMgNjMgY2hhcmFjdGVycy4NCj4+Pj4g
DQo+Pj4+IFRoZSBtYXggbGVuZ3RoIGlkZW50aWZpZXJzIGZvdW5kIGJ5IEVDTEFJUiBhcmU6DQo+
Pj4+IA0KPj4+PiBfX21pdGlnYXRlX3NwZWN0cmVfYmhiX2NsZWFyX2luc25fc3RhcnQNCj4+Pj4g
ZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXJfbm9zeW5jDQo+Pj4+IA0KPj4+PiBCb3Ro
IG9mIHRoZW0gYXJlIDQwIGNoYXJhY3RlcnMgbG9uZy4gQSBsaW1pdCBvZiA2MyBjaGFyYWN0ZXJz
IHdvcmsgZm9yDQo+Pj4+IHRoZSBleGlzdGluZyBjb2RlLg0KPj4+IA0KPj4+IEkgaGF2ZSB0byBh
ZG1pdCB0aGF0IGl0IGhhc24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgd2h5IHdlIHdhbnQgdG8NCj4+
PiBwZXJtaXQgKGlmIG5vdCB0byBzYXkgZW5jb3VyYWdlKSB0aGUgdXNlIG9mIHN1Y2ggbG9uZyBp
ZGVudGlmaWVycy4NCj4+PiBJZiA0MCBpcyB0aGUgbG9uZ2VzdCB3ZSd2ZSBnb3QsIHdoeSBub3Qg
bGltaXQgaXQgdG8gNDAgZm9yIG5vdw0KPj4+IHdpdGggYSBnb2FsIG9mIGZ1cnRoZXIgcmVkdWNp
bmc/IEEgNDAtY2hhciBzeW1ib2wgcGx1cyBzb21lDQo+Pj4gaW5kZW50YXRpb24gd2lsbCBhbHJl
YWR5IHBvc2UgcHJvYmxlbXMgd2l0aCA4MC1jaGFyIGxpbmUgbGVuZ3RoLg0KPj4gDQo+PiBXZSBj
YW4gZ28gbG93ZXIgdGhhbiA2MyBpZiB3ZSB3YW50IHRvLiBJIGNob3NlIHRoZSBjbG9zZXN0IHBv
d2VyLW9mLXR3bw0KPj4gbGVuZ3RoIC0xIGZvciB0aGUgTlVMIHRlcm1pbmF0b3IuIEJ1dCBpdCBk
b2Vzbid0IGhhdmUgdG8gYmUgYQ0KPj4gcG93ZXItb2YtdHdvLiBTbyB3ZSBjb3VsZCBnbyB3aXRo
ICI0MSIgaWYgd2Ugd2FudCB0by4NCj4+IA0KPj4gQW55b25lIGluIGZhdm9yIG9mIHRoYXQ/IEkg
YW0gaGFwcHkgd2l0aCBhbnkgbnVtYmVyIGJldHdlZW4gNDEgYW5kIDYzLg0KPiANCj4gV2h5IDQx
LCBub3QgNDA/IDQxIHNlZW1zIHlldCBtb3JlIGFyYml0cmFyeSB0byBtZSB0aGFuIGUuZy4gNDAu
DQo+IA0KPj4+IE90b2gsIGFzIHNhaWQgb24gdGhlIGNhbGwsIEkgdGhpbmsgdGhlIHB1YmxpYyBo
ZWFkZXJzIHdhbnQNCj4+PiBtZW50aW9uaW5nIGV4cGxpY2l0bHkgaGVyZSBpbiBzb21lIHdheS4g
UGFydCBvZiB0aGVtIChtb3N0IG9yIGFsbA0KPj4+IG9mIHdoYXQncyB1bmRlciBpby8pIGFyZW4n
dCB1c2VkIHdoZW4gYnVpbGRpbmcgWGVuLCBzbyB3b24ndCBiZQ0KPj4+IHNlZW4gYnkgRWNsYWly
IChhaXVpKS4gWWV0IHRoZXkgYXJlIGEgZm9ybWFsIHBhcnQgb2YgdGhlIGNvZGUNCj4+PiBiYXNl
LCBhbmQgZS5nLiByaW5nLmggaGFzIHNvbWUgcHJldHR5IGxvbmcgbmFtZXMgKGFsYmVpdCBzdGls
bA0KPj4+IGJlbG93IDQwIGNoYXJzIGFzIGl0IGxvb2tzKS4gU28gb25jZSB3ZSdyZSBhYmxlIHRv
IGdvIGRvd24gdG8gZS5nLg0KPj4+IDMyIGZvciB0aGUgYnVsayBvZiB0aGUgY29kZSBiYXNlLCBw
dWJsaWMgaGVhZGVycyBzaG91bGQgaW1vIHN0aWxsDQo+Pj4gYmUgZXhwbGljaXRseSBhbGxvd2Vk
IHRvIHVzZSBsb25nZXIgaWRlbnRpZmllcnMuDQo+PiANCj4+IEFjdHVhbGx5IEkgdGhvdWdodCBh
Ym91dCB3cml0aW5nIHNvbWV0aGluZyBmb3IgdGhlIHB1YmxpYyBoZWFkZXIgYnV0IEkNCj4+IHdh
c24ndCBzdXJlIHdoYXQgdG8gd3JpdGUuIFdoYXQgYWJvdXQ6DQo+PiANCj4+IC0gTm90ZTogdGhl
IFhlbiBjaGFyYWN0ZXJzIGxpbWl0IGZvciBpZGVudGlmaWVycyBpcyA0MS4gUHVibGljIGhlYWRl
cnMNCj4+ICh4ZW4vaW5jbHVkZS9wdWJsaWMvKSBhcmUgYWxsb3dlZCB0byByZXRhaW4gbG9uZ2Vy
IGlkZW50aWZpZXJzIGZvcg0KPj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCj4gDQo+IEZpbmUg
d2l0aCBtZSwgZXhjZXB0IEkgd29uZGVyIGluIGhvdyBmYXIgZ29pbmcgZm9yd2FyZCB3ZSBhY3R1
YWxseQ0KPiBuZWVkIHRvIHBsYXkgYnkgdGhhdCBsaW1pdCB0aGVyZS4gUHJvcGVyIG5hbWUtc3Bh
Y2luZyBpcyBwYXJ0aWN1bGFybHkNCj4gaW1wb3J0YW50IGluIHRoZSBwdWJsaWMgaGVhZGVycywg
c28gbWF5IHdhcnJhbnQgYSBoaWdoZXIgbGltaXQgZm9yDQo+IGNlcnRhaW4gKHVudXN1YWw/KSBj
aXJjdW1zdGFuY2VzLg0KDQpJIHRoaW5rIHdlIGNhbiBoYXZlIGEg4oCcZ2xvYmFs4oCdIGRldmlh
dGlvbiBmb3IgcHVibGljIGhlYWRlcnMgd2l0aCBhbiBoaWdoZXINCmxpbWl0IGJ1dCB0aGVyZSBz
aG91bGQgc3RpbGwgYmUgYSBsaW1pdC4NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg==

