Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2645B1D0D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403306.645375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGgq-0005Zp-1g; Thu, 08 Sep 2022 12:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403306.645375; Thu, 08 Sep 2022 12:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGgp-0005Wz-Si; Thu, 08 Sep 2022 12:31:27 +0000
Received: by outflank-mailman (input) for mailman id 403306;
 Thu, 08 Sep 2022 12:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z23V=ZL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oWGgo-0005Ws-E0
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:31:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26e89eee-2f72-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 14:31:25 +0200 (CEST)
Received: from AM6PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::15) by DU0PR08MB7993.eurprd08.prod.outlook.com
 (2603:10a6:10:3e0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 12:31:15 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::5d) by AM6PR01CA0038.outlook.office365.com
 (2603:10a6:20b:e0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 12:31:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 12:31:14 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 08 Sep 2022 12:31:14 +0000
Received: from eb930b282432.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F0FE29E-AC6F-43C3-8147-353CBFC3EE16.1; 
 Thu, 08 Sep 2022 12:31:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb930b282432.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 12:31:02 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Thu, 8 Sep
 2022 12:31:00 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::89c6:c8ca:3340:ca53]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::89c6:c8ca:3340:ca53%5]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 12:31:00 +0000
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
X-Inumbo-ID: 26e89eee-2f72-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N093/A0HRDQ5tFpDHB/y8u/1zPyGom06yea45BteORrt0tO1FwVxi/nycoEgyUJ8+G62rT1wwlQDvllwyXI9FV006RTkHKucC8VqaK1I+8KaJqsrhjPEuEU8ZQFK303C3yas/IZi0qN8Ji/6AMZRYKnPqM4wbRqiOHTiGK4zd53TYLNJ4UOeZzYlL/VPKJQzNwGO9e9+SY6ylU85FDvRBVu0WZAlDisaBsrekfc1hCA4pnBDjNKsIWX5TfQfbNCjnmhMqd/TFfIZYoATsN5rOr/kmiR4ZesGBSafWw462V3QH28tI2KBoLalgANb/exooJ0CpwJqeiVuD5rUTFuiEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Owx4enNlxYj4A+G5gejC0zzYLiB7DggolNr7gKWjFk=;
 b=jYZrTGRblzYl0jHfpE//dFko6zkmAb6O5ZTpy+G/ke0EhXRAmH8F8ETmNxGPDH2oUg8OtxG4tfU/NRk1EuO46UqQtlDzrx3zkLYkrtyOeFuySPuNhmevrfoRnAi6BNxCI3woR9LGD/b9Ni/4smoE4XXz1RwBXjIgIf9wIwqPcTZ0i+QjoLaRkOhLI5tzQ0VwTiT9tieIdQVaMXxsJmwouJtUhpdf1To2Wz7dCKeji5AuqkgwVYicTjzgNW93vp0ofx0nTARBUUq+OovxYqNr1RkLb14rfFs3ANcSIix5L1j63qI4Ckm3y5xOqDetPTpNs+Rn8/k1XobPHFZeWy8LJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Owx4enNlxYj4A+G5gejC0zzYLiB7DggolNr7gKWjFk=;
 b=FBgyYzoSN+pNSudTw2SbmD8j2b/2s3kd9gjZ24GHgUEJ7MU1DUEn5fGOVgL211eFA/zvl5XuRE44yORviSSqgUZSXRyB7NAhS4jf80xViLIBwHYBLzFzH2EravJhdNaBbVDwlIepSb9xpsbM1ONR2AL/qxlsY8UFaaFc/aR/bm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 088c1e1a15196bcf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfAoX59IHOhN6AO+RmQvb/EthpGOugoiPnHrciot7hA/86xYI3LHDhgG7AAo7dee2SRGQKnudaJZrrWDx9mHLKDdepkfk74TEFecAK3bj1ITrIG8d2YiDNmTJAQhz7fxjs05zK/HC3COHKn4+djmDeQtdIUgTnr+uWEu76nmQU51+75Kv2fDs4gT5anRoNdIC9T1AR+NfOjSka+i5RvMgdNpO5eQYfMRli8B/zZIk9Vdxa4ilyrcMj9yADKxm9gWSU9vWALyYg8ZIiXb6fWoDXX+eH0kAhrNyXERkXBcB/WJSYgyP5EjRzC4CX7oVs+xwhd6SV4A3IOx0uEKEMIWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Owx4enNlxYj4A+G5gejC0zzYLiB7DggolNr7gKWjFk=;
 b=JD77nypOy4m+/GZ1YUa30l+f44fdk24NuNmD7WT3JKwak7zu88T9s8f0y9uyIhhP0mnwzvKcl8e3Hl/82cx9XiKXJa9+7bW5ORY7Jn3EMDa+BAeuaLKf4ez14fBMmFzODt6ytb5xPDYDMl/5fWVc5eMTRhQZJmvLxantCAcGbgrOwcmvFNHtlnSByHWnolrjELX6yskFFtFOD2o8G76blBWYIwH0InSuda8dVCyDLGIc+eu30UJNiM/6dm3EPtejg81SaK2Kx/sunCg/6KKUQ4zrB2vTUBEAPQjxZ3urlvvQYryD/LGAjxx04/cQvqPxUKoW6NVhfp0O9VMW9s5Dbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Owx4enNlxYj4A+G5gejC0zzYLiB7DggolNr7gKWjFk=;
 b=FBgyYzoSN+pNSudTw2SbmD8j2b/2s3kd9gjZ24GHgUEJ7MU1DUEn5fGOVgL211eFA/zvl5XuRE44yORviSSqgUZSXRyB7NAhS4jf80xViLIBwHYBLzFzH2EravJhdNaBbVDwlIepSb9xpsbM1ONR2AL/qxlsY8UFaaFc/aR/bm8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYw3p7gwIvcD2fwEqa0fZdexa62K3Vbv8AgAAHwAA=
Date: Thu, 8 Sep 2022 12:31:00 +0000
Message-ID: <03EABD2D-9FB5-4E91-BB65-7E5B5384F232@arm.com>
References: <cover.1662637415.git.rahul.singh@arm.com>
 <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
 <5db80611-c968-34c7-7181-41071636efca@suse.com>
In-Reply-To: <5db80611-c968-34c7-7181-41071636efca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DU0PR08MB8277:EE_|VE1EUR03FT039:EE_|DU0PR08MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e95a1c-daab-4411-9300-08da9196054d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Klz0dPa09EzgY/rx+dbp1qScx+QfOt/T4D/YgjmsgzQOm/dTjNc97Bbgw0Bc/bldseruRP4MEAycBcmnFfME8bm4ehQ+akuYxBPLUEV+t6HsLrR4ctzjwVD31cTYQzuN5oNWv6mRCMInX3zMDpDXezYm552BHQ/H6mn9jjb8bhTfBDn3HKMy/3TRA4tJHjcBhXnuMkGQ53pPBAh7dZZLstMOucYfaVtjifHcOZjzk/tKi3c0Nq5hb9q9oyONhW+31aLfmhqCQ1WNa4sC8LbOLuWlGlnJwLZec4O71o6LdD1bXhnitBpnqIOTmJqCStrYLJEfrCJh+5wc0DrkPF9+Ptr9nTEHB5I+BI7Tj1Z7IaOQoa/Qnr3s28jT/hiQkiMUG+p0bXhstC4hKkBQUEc+9xRtsaHKAUDK1ASd/HAZNWqC6QQcubzXlGq35uY7bcDvprWXdTX6lImpHpqcoP6Q6Db7U55Yfdz35OKb9VG9Ov+qokNZmqffhMMkwSs3PSx9r6huSImVH3D0Kxu1kjgUBShNdRlths8bkXSqeltzXO1VtqwmB3OXfAEQM67IFvuqeOMibgM91sC0Yy+AtOkAk+ZDilA1j7CKn0tewXwtcuLKM3ltrNA/19N5plx+24JETVDjzWJq8piGW6/efP+t048+6ypWN1TqNNRAGL94ls7/bLgsIKPtmDrjXLiH2B4zhNGbxLoG/NJzP3VlexBSYhWVdI7jVWuRwQ2gYjmc8EEq2ik8WXocdgRWoQrh9FiF+xp2LcdiWC9g5+XKg3FXn03xBvPkGvWLKXDU3bXhq48=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(36756003)(86362001)(6916009)(38100700002)(54906003)(71200400001)(26005)(316002)(2906002)(122000001)(91956017)(76116006)(64756008)(4326008)(66476007)(66556008)(83380400001)(8676002)(478600001)(66446008)(66946007)(41300700001)(38070700005)(53546011)(6506007)(8936002)(2616005)(186003)(6486002)(5660300002)(33656002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F393E006BEF3E745BA3D1CD3A5CA4B0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3712c64b-3aa6-4791-d600-08da9195fd0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IdU7RpL6gF2XOmqIjGst4hUGDEF+73UZg+ohsK6mYs5x12MPr0oGHvtJY1ngW2g4xwqNcIEB4MLhjGQJg8wPniE928hnbryQFwmQlkncYTJBQvm0P77ka0XDr4obTxAZkpso6KIwrMaW7RuJLqCmr/TLkKXiXU79K95wzhir9/Fh3G7/fVwHnpavQkF+ilknviJ0fm9zOfmkyzVEp7d2sSSqBoN6dqikFqwedE5LjEQij+H4MJICTvyZRDNKsHzLgCDeJK3mMMrTUKUH4h6P5URBcL+nvRbBoTFAe2cdcSUhZVTNLxOnkySfzgnwLcWQhEkxf4ojUejFQvgvLa30MmB07Fo0Wmk6zem2kL7ALCVM54FQPwJbxTjF6gEMaXrFpxR7RAd9EtoPZ6/VfL65r/XlsoUUnluiHY6j5gryhFYrKn75TrtlV42Y1ItBxwfgtmMMI+U7VhflZF6hrFQc99oZJ+LskYCK2JKHCO4KwfKYYw74VakZNjWik4XdMmFyjyQhwn1QOpQcmcGrbHJ0Tnp4S0SqqzJZRONvUHBeRosvH29Qvdi24VVKmxZERAYc0h5sOkgpHSuCtJzrA5d46D9OQ+Pii2qYlzCz7vB6xCu5uImsaBLBXmC+GGzM/7RtvmdqPMWM4y/5fE0HsCjUMccwP/VdMHRnLN6k8fBBxHZEP9BHNuAzOwRgfmROIIjaNKuW8iHPiIelgfa3c1hJZly4iIFbhww+cLfAn4Yc9AyW8Ic4IJ0+spQMoFLQZnsquaW7QeRCfpujQhimcxyrzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(40470700004)(70206006)(6862004)(5660300002)(8936002)(41300700001)(2616005)(33656002)(26005)(6512007)(53546011)(2906002)(40460700003)(82740400003)(40480700001)(86362001)(6506007)(36860700001)(82310400005)(186003)(70586007)(336012)(47076005)(81166007)(356005)(83380400001)(478600001)(6486002)(8676002)(54906003)(4326008)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 12:31:14.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e95a1c-daab-4411-9300-08da9196054d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7993

SGkgSmFuLA0KDQo+IE9uIDggU2VwIDIwMjIsIGF0IDE6MDMgcG0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wOS4yMDIyIDEzOjQ5LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IGlzX21lbW9yeV9ob2xlIHdhcyBpbXBsZW1lbnRlZCBmb3IgeDg2IGFu
ZCBub3QgZm9yIEFSTSB3aGVuIGludHJvZHVjZWQuDQo+PiBSZXBsYWNlIGlzX21lbW9yeV9ob2xl
IGNhbGwgdG8gcGNpX2NoZWNrX2JhciBhcyBmdW5jdGlvbiBzaG91bGQgY2hlY2sNCj4+IGlmIGRl
dmljZSBCQVIgaXMgaW4gZGVmaW5lZCBtZW1vcnkgcmFuZ2UuIEFsc28sIGFkZCBhbiBpbXBsZW1l
bnRhdGlvbg0KPj4gZm9yIEFSTSB3aGljaCBpcyByZXF1aXJlZCBmb3IgUENJIHBhc3N0aHJvdWdo
Lg0KPj4gDQo+PiBPbiB4ODYsIHBjaV9jaGVja19iYXIgd2lsbCBjYWxsIGlzX21lbW9yeV9ob2xl
IHdoaWNoIHdpbGwgY2hlY2sgaWYgQkFSDQo+PiBpcyBub3Qgb3ZlcmxhcHBpbmcgd2l0aCBhbnkg
bWVtb3J5IHJlZ2lvbiBkZWZpbmVkIGluIHRoZSBtZW1vcnkgbWFwLg0KPj4gDQo+PiBPbiBBUk0s
IHBjaV9jaGVja19iYXIgd2lsbCBnbyB0aHJvdWdoIHRoZSBob3N0IGJyaWRnZSByYW5nZXMgYW5k
IGNoZWNrDQo+PiBpZiB0aGUgQkFSIGlzIGluIHRoZSByYW5nZSBvZiBkZWZpbmVkIHJhbmdlcy4N
Cj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+
DQo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAjIHg4NiwgY29t
bW9uDQo+IA0KPiBGVEFPRDogSSBvYmplY3QgdG8gdGhpcyB0YWdnaW5nLCBhbmQgSSBkaWQgbm90
IHByb3ZpZGUgdGhlIGFjayB3aXRoDQo+IHN1Y2ggdGFncy4gUXVvdGluZyBkb2NzL3Byb2Nlc3Mv
c2VuZGluZy1wYXRjaGVzLnBhbmRvYzogIlRoZQ0KPiBgQWNrZWQtYnk6YCB0YWcgY2FuIG9ubHkg
YmUgZ2l2ZW4gYnkgYSAqKm1haW50YWluZXIqKiBvZiB0aGUgbW9kaWZpZWQNCj4gY29kZSwgYW5k
IGl0IG9ubHkgY292ZXJzIHRoZSBjb2RlIHRoZSBtYWludGFpbmVyIGlzIHJlc3BvbnNpYmxlIGZv
ci4iDQo+IFRoZSBkb2MgcHJvdmlkZXMgZm9yIHRhZ2dpbmcgaGVyZSwgeWVzLCBidXQgc3VjaCBz
aG91bGQgb25seSBiZSB1c2VkDQo+IGZvciB0aGUgdW51c3VhbCBjYXNlIG9mIGFuIGFjayByZXN0
cmljdGVkIHRvIGxlc3MgdGhhbiB3aGF0IGENCj4gcGVyc29uJ3MgbWFpbnRhaW5lcnNoaXAgY292
ZXJzLiBPdGhlcndpc2Ugd2UnZCBlbmQgdXAgc2VlaW5nIG92ZXJseQ0KPiBtYW55IHRhZ2dlZCBh
Y2tzLiAoUmVjYWxsIHRoYXQgdGFnZ2VkIFItYiBpcyBhbHNvIGV4cGVjdGVkIHRvIGJlIHRoZQ0K
PiBleGNlcHRpb24sIG5vdCB0aGUgY29tbW9uIGNhc2UuKQ0KPiANCg0KT2suIEkgd2lsbCByZW1v
dmUg4oCcIyB4ODYsIGNvbW1vbuKAnSAgaWYgSSBnZXQgY29tbWVudHMgb24gdGhpcyBwYXRjaA0K
YW5kIHRoZXJlIGlzIGEgbmVlZCBmb3IgdGhlIHRoZSBuZXh0IHZlcnNpb24sIG90aGVyd2lzZSwg
SSBzdWdnZXN0DQp0aGF0IHRoZSBjb21taXR0ZXIgY2FuIHJlbW92ZSB0aGlzIHdoaWxlIGNvbW1p
dHRpbmcgdGhlIHBhdGNoLiANCg0KUmVnYXJkcywNClJhaHVsDQoNCg0K

