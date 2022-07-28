Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC54584573
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 20:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377016.610067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH7wS-00053J-LX; Thu, 28 Jul 2022 18:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377016.610067; Thu, 28 Jul 2022 18:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH7wS-00050i-HJ; Thu, 28 Jul 2022 18:09:00 +0000
Received: by outflank-mailman (input) for mailman id 377016;
 Thu, 28 Jul 2022 18:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qu6=YB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oH7wQ-00050J-Ad
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 18:08:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58529cd5-0ea0-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 20:08:56 +0200 (CEST)
Received: from AM6P194CA0033.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::46)
 by AS4PR08MB7553.eurprd08.prod.outlook.com (2603:10a6:20b:4fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 18:08:53 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::d2) by AM6P194CA0033.outlook.office365.com
 (2603:10a6:209:90::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 18:08:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 18:08:52 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Thu, 28 Jul 2022 18:08:52 +0000
Received: from c772c7a123d7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F6A098E-4E47-4A22-A4A9-509D19A3A602.1; 
 Thu, 28 Jul 2022 18:08:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c772c7a123d7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 18:08:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB5126.eurprd08.prod.outlook.com (2603:10a6:20b:ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 18:08:40 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 18:08:40 +0000
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
X-Inumbo-ID: 58529cd5-0ea0-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lPY8LAxHu7JHaxyrI9qJeSayC20YmusE9ILwbsArsF1cUO051XwHrGxGMpgZrMr74nXvH5WJp15wWkUYjNudlJ1HKJQ/gOliqatzisiiH6D2T4PqqLkwpyhS72AhsgewOlAQPhHZ8idGe92NQKfRy6LP0gPWc8bkbWP+i0dzE8iYUyUptL6LyTFLyUxVyYHoumuU8k6hjEG8ng6237Lnm0tmwixEO12HBNailfDedm09nLwCEP9SbU9DVlxg+8Em4pfbWiYZfTdRVCU5iTSGgexLuLxUvmhgx/fCrXvi2VParX7CGaDPoiwW6JJi9UXcT9exY4bKkUml324dzewkEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxiOG7xtmKa5GcyJ5nBQ1r+LJwJUQzFcdlUsfmfQhz0=;
 b=Df9OLGMviaBFjTsscWZ3bRAWeETWL97pd3JvXyi4UViM/yD0nXCfBFrQ9d01VpojRvn18hWgsvKvRsrT6QaiOIXJs0CEbAjIv0YPnYr5MTomOOy4qjRrHx8Czd+YUW2JGsekv5NoQSWkAGpbpdvyZt/NGeHFYzRo4mz0SWGs1/6c4dl5A7dNgWI2GhxbS/hHiGhgAmdW/z02rzMgVwQb/HrWsvtJ4PgtgoroTJR3oOAfmI0f+Isj4thUkp+LxIgI1P++DtaiRHk6+3+I+REJWpAOTeL/+zQ8wIPJBpCQAxyC71OdKPF4LcvDVY6T/hZwnowcexa9lGcPX1IFADbzYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxiOG7xtmKa5GcyJ5nBQ1r+LJwJUQzFcdlUsfmfQhz0=;
 b=CNIcZMxZZz3wTsIeszJHks3fMxVw2/nuBPLVc+AtsfE3MS9gfHeBwm9b3aTy5dJrcGXwOm2XmeK34jej0YOuN5NoBy65LNV/Mju2T8hhovEkSFDTUFsrd6EiFdpvq5w2g+d4epE3zaOv0P4pqDxKpntqwinPnelW9gIHwEwdbAY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa6eb36dc0cdb73a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf8DrvD43c4ac6huKM1lMv9odAoGJEaxZqROxrlpXtBCGBbRtI91fq4uX2CvZYRSKjf8sLAcBNrpwqKEWC6rA+OySlghdZjtfnIG5m1ucee0tVohYOJ3hRvDiGK14n/8oB/pmbLryCxBYe8GP2Z2P3hWI57z8EbB/PsfTwUwAGDwMj77ijszX4mEwSaowrSWoIGL6q344ULHCaWeML1kfAWVcfeGT3vrjtJRsvK82JkDPuin3GCSFGs2Am4fEeUfLsbwkzjGbJGCn+NGvTVcYMCVifCv+qBcSTxvtR93POZBxEA95DD8/VtRvuSuPXpGUOahmQ84iHvW7LGO9qLGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxiOG7xtmKa5GcyJ5nBQ1r+LJwJUQzFcdlUsfmfQhz0=;
 b=f6cXst+GFg9K+Mzceqh0zp+ycUUxlk4j64atrOu1tuR/JlyrbnQxCDoDVbJ4QZ/5GKn8XNF6d/z74RxEgcKE9Uj+k1J5eN5so4zlWXXx2ptCDVx0k0lap1CjZOXtYEh22Sup1vP31hzOysfL9fSMswd3JmEc1q8qryBhD+hs4xFb1nJtwy38KmBZiPhYLv6UjrKTfWXBu58Z/krTBjcyZOTTKDm1DB1PmLrT0tljQrvwRpBgHKmUkKFdNZGW33jEcQr3Z9Dhe+02wYWUp//UTRTvOP4lv7ZMe9sqEYB0UGON7p3qAhotrLZlf0wpr9QMxBtPoGtX8bGYxDQY84hdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxiOG7xtmKa5GcyJ5nBQ1r+LJwJUQzFcdlUsfmfQhz0=;
 b=CNIcZMxZZz3wTsIeszJHks3fMxVw2/nuBPLVc+AtsfE3MS9gfHeBwm9b3aTy5dJrcGXwOm2XmeK34jej0YOuN5NoBy65LNV/Mju2T8hhovEkSFDTUFsrd6EiFdpvq5w2g+d4epE3zaOv0P4pqDxKpntqwinPnelW9gIHwEwdbAY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Topic: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Index: AQHYoDVxqGFUWjtG0EOgt/onXyD48a2UGUWAgAAAcIA=
Date: Thu, 28 Jul 2022 18:08:40 +0000
Message-ID: <E90317DB-5C1E-415B-8699-0ED1A0984C34@arm.com>
References: <20220725144634.8086-1-luca.fancellu@arm.com>
 <e069280a-4d97-7a63-a125-b8ef3c397319@xen.org>
In-Reply-To: <e069280a-4d97-7a63-a125-b8ef3c397319@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d52f1a2c-45d8-4690-4c05-08da70c43ade
x-ms-traffictypediagnostic:
	AM6PR08MB5126:EE_|AM5EUR03FT014:EE_|AS4PR08MB7553:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JGOzPZNmkH0mjDxm5GPnryvC4qedldQ3vYOHBD4/ARaknlnGNRQ/G2ToGnn5qSW7PsgkAxscYX1Ur2e+apz1R7i5XS87vp3eR16P2/XDpBa7CXNG4+3Vm5iKpMOaGUJUSQz3DC58AOB782BthWMsyENmaIk7/A+yCCdSo5uIAltZlkvEfsTe5ACwlQioiAvKq0e6UrvwCQHpZ0ZihmTmbjiUjMbhFHOhJWnTZ+cQW0FAsr/I4f+Y9UnsN/ZMu8SSoRLIRUfDxhVvxwklRhSN3Uk6B7XHwRAQdOe1++TR+gZY4IGdaaJJ0/f9h1122F6ez4DUvYEpXHYXBkwUr+EUnF+RxucTISHwHy2RjQIoH+h2dVR6xqbpU6Gl/t9swlHddX2yvrv0iAI07Gx48SXWBwK/duf62QpKYFou+879zgKgSDoB3ATYN/Kj3r9eoRJvndnUv2j3yoQw+2RZDVOZNNc74r36vjUvufiUQsAcmporzDrmFwETpYcf0xPyRF207UYaqOCV4jRv8yvG6PVJcRe0QXe5LTcMW+42YaoU6wtJm6/8rb5YXLDmE0P39C8JyutkVBU1FshoAolzLaEYxRv1EeS726fxBlTjqvZIrtE4V7kAnA0lqhf3SYJDzvdGlvsPmFeFWUQJLFF55SX5JWkkaPG6QOVbX8GTSHOetG4vmdZedyEiW5tO6PX7bCwn8bQ/SUAEsCiSmH6bnR1shqf0YTZp8dRdziYYOEd/E5YvCTQHKwx8E/LEd084Wt5Q64yqzZ9umL5ZEdqZQy8y4Ut7/SG1UID4KVhzKEEgrPK8NRt3nIK5G+tBgCqkLGRInv2KogZaucmsOiaI2yxCoA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(33656002)(26005)(66946007)(478600001)(6486002)(6506007)(41300700001)(86362001)(54906003)(6916009)(2906002)(316002)(53546011)(4326008)(71200400001)(91956017)(38070700005)(6512007)(38100700002)(76116006)(186003)(36756003)(64756008)(122000001)(66556008)(5660300002)(66476007)(83380400001)(8676002)(66446008)(8936002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8A45AD2D943664CB28A9808A3A4F9C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5126
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa3692ad-c4be-4a1b-f8d9-08da70c4336c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gX04rDBjJe7rhaMUAW4kWpW9aofeL2ndyAb5429LJ6mtRE/cF5nL/tZvCmdHU2C2SZbx8AA9jK5laluHpkyDJrNAvi0lA4zdcIdOPvXjrIj8HEuQN/9TzkG8tHXQ89qtMyAoTsV2galzGZ8z05dgKSS2HnPqFwjaR8skM0kzZPw8Xvfgrn0rpVfba5O+wdFjvZfagN2djnBOixlvx6jN7Wrqf1a4Udd2lLyzCqT58LgMcEE8wASmPGGq3CpiC8Y1sb/rv5DKPXhCsbU33VYd2XfpUkyjIp5KTuM8Q4fYvSotHgYr4Q202KLa0gJf8vj91oCTQI5UMJ8mWyO+rbplp3hCw8DGt/sFG5Wl4xK+GPf1FbSiv5xleNrL7KX6uZOlfM0rx4D8nzEMtS/A4wzdDTgEG8ifrbbmkIzM3zKd9h+BFd5Cl+/Qq7rqdspNHVpo5Fmj1F7DAC8yZTxRmJYek18U5eyFTOEGDYwyZNj16e8ye7xVzcVX779lk9R01AnNs4qsIzxkDTMAcL0sYU+yoPjzWEfh7q2/f/pbJn+CiFTn0fpob2kG23KuLgN3pgYWmy6P8I5k3fNRmbUdC4MqCcXPU4q09R097PeakJBWm1qzHW7WCit3TnunRuibdaIo444UyQUp4w8/4rQZLetpO0rB5BVvp5Y5wBYWN/hzbLip5cWk7ZXR48DcjKYzy61BXWIXmMXZXpkdsE1I1jyILjNfbQO57sxqg/HTt64c31iCWj9GURrbNSv49fAjJ5oJuKmmxGtGawcOsW79UBxRdi/uWlNARou9rAuVSTAInwHarzbtRCH/wYgTrvI8ESjI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(40470700004)(36840700001)(46966006)(8676002)(36860700001)(70586007)(2906002)(40480700001)(41300700001)(356005)(5660300002)(6512007)(26005)(82740400003)(33656002)(4326008)(478600001)(6862004)(6506007)(6486002)(336012)(83380400001)(107886003)(2616005)(86362001)(81166007)(316002)(82310400005)(47076005)(36756003)(54906003)(70206006)(186003)(53546011)(8936002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:08:52.9269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52f1a2c-45d8-4690-4c05-08da70c43ade
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7553

DQoNCj4gT24gMjggSnVsIDIwMjIsIGF0IDE5OjA3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyNS8wNy8yMDIyIDE1OjQ2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gVGhlIGZ1bmN0aW9uIGFyY2hfc2V0X2luZm9fZ3Vlc3Qg
aXMgbm90IHJlYWNoZWQgYW55bW9yZSB0aHJvdWdoDQo+PiBWQ1BVT1BfaW5pdGlhbGlzZSBvbiBh
cm0sIHVwZGF0ZSB0aGUgY29tbWVudC4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL2RvbWFpbi5j
IHwgNiArKystLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gv
YXJtL2RvbWFpbi5jDQo+PiBpbmRleCAyZjhlYWFiN2I1NmIuLjY0NTFjZDAxM2MxYSAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jDQo+PiBAQCAtODgyLDkgKzg4Miw5IEBAIHN0YXRpYyBpbnQgaXNfZ3Vlc3RfcHY2NF9w
c3IodWludDY0X3QgcHNyKQ0KPj4gI2VuZGlmDQo+PiAvKg0KPj4gLSAqIEluaXRpYWxpc2UgVkNQ
VSBzdGF0ZS4gVGhlIGNvbnRleHQgY2FuIGJlIHN1cHBsaWVkIGJ5IGVpdGhlciB0aGUNCj4+IC0g
KiB0b29sc3RhY2sgKFhFTl9ET01DVExfc2V0dmNwdWNvbnRleHQpIG9yIHRoZSBndWVzdA0KPj4g
LSAqIChWQ1BVT1BfaW5pdGlhbGlzZSkgYW5kIHRoZXJlZm9yZSBtdXN0IGJlIHByb3Blcmx5IHZh
bGlkYXRlZC4NCj4+ICsgKiBJbml0aWFsaXNlIFZDUFUgc3RhdGUuIFRoZSBjb250ZXh0IGNhbiBi
ZSBzdXBwbGllZCBieSB0aGUgdG9vbHN0YWNrDQo+PiArICogKFhFTl9ET01DVExfc2V0dmNwdWNv
bnRleHQpIGFuZCB0aGVyZWZvcmUgbXVzdCBiZSBwcm9wZXJseSB2YWxpZGF0ZWQsDQo+PiArICog
b3IgYnkgUFNDSSBjYWxsIChQU0NJX2NwdV9vbikgaGFuZGxlZCBieSB2cHNjaSBtb2R1bGUuDQo+
PiAqLw0KPiANCj4gSSB3b3VsZCBwcmVmZXIgaWYgdGhlIGNvbW1lbnQgZG9lc24ndCBtZW50aW9u
IHdobyBhcmUgdGhlIGNhbGxlcnMuIFNvIHRoZXJlIGFyZSBubyBuZWVkIHRvIG1vZGlmeSB0aGUg
Y29tbWVudCB0aGUgbmV4dCB0aW1lIHdlIGFkZC9yZW1vdmUgYSBjYWxsZXIuIEhvdyBhYm91dCBz
b21ldGhpbmcgbGlrZToNCj4gDQo+ICJJbml0aWFsaXNlIHZDUFUgc3RhdGUuIFRoZSBjb250ZXh0
IG1heSBiZSBzdXBwbGllZCBieSBhbiBleHRlcm5hbCBlbnRpdHksIHNvIHdlIG5lZWQgdG8gdmFs
aWRhdGUgaXQiDQoNClNvdW5kcyBnb29kISBJ4oCZbGwgdXBkYXRlIGFuZCBwdXNoIGl0IHNvb24h
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

