Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F015ADCCE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 03:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399298.640425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVN5g-0003XS-3t; Tue, 06 Sep 2022 01:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399298.640425; Tue, 06 Sep 2022 01:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVN5f-0003Uj-Vz; Tue, 06 Sep 2022 01:09:23 +0000
Received: by outflank-mailman (input) for mailman id 399298;
 Tue, 06 Sep 2022 01:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVN5e-0003Ud-6v
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 01:09:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 893d462e-2d80-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 03:09:20 +0200 (CEST)
Received: from AS9PR06CA0470.eurprd06.prod.outlook.com (2603:10a6:20b:49a::29)
 by DBBPR08MB6057.eurprd08.prod.outlook.com (2603:10a6:10:1f5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 01:09:18 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::ea) by AS9PR06CA0470.outlook.office365.com
 (2603:10a6:20b:49a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 6 Sep 2022 01:09:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 01:09:17 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 06 Sep 2022 01:09:17 +0000
Received: from b5728015e667.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94EA476B-2186-4AAC-BB5D-9EB7F7FBAB07.1; 
 Tue, 06 Sep 2022 01:09:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5728015e667.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 01:09:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7699.eurprd08.prod.outlook.com (2603:10a6:10:392::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 01:09:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 01:09:04 +0000
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
X-Inumbo-ID: 893d462e-2d80-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jroc47vanB76l+PahsXxkZx3Ai2HXJvBHLYTu2ZFI3jfgT2M8p/O/wr/6zvBmMnHZdIkjVQJ5qZ9dRJfpVQYlI6lEhZT0wgHOEY+crd8rc3+1u5Qw5GlpaKkXdWpnYL++RBDAe90tvR3Z2/6+29z/PcP52ARP2hPsTkn95NN0f3IAuSkgSoPl7YNT+TSF14vT4NCpHW6R7Gc5jJRrqn1kDfDsSzuCCHpWXyhwULYc+zhC6J6YAcqiE/Ze2JdfX0XDjmhB/2UXmG8zhsGNM+67ZQZ6TnuOxCHDY81cnW+pvZFePrALizrEpAvR3zKbdfoqMGfNdNsKdBNIwy/36WGMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc/FOGss4EeFcefUfgnZZs9tCthkRP6fMl0fwkk5FRA=;
 b=KcT7tVchId+A1ggtOrV+cHxTaphSJAICqCJ7V/0NnXXH2IrqKc2l9DkWajj5QVtYnmv2AulnWSi4Kwz44gUh/h3kFxea9WRH0P4lDy6maEIxP1rRgdQ6tp+DECYljglYJVLrSHQ/AZ2l7rCeMR60Lkgl2olZczL0C9ksnvJ28pbQ/NFzI9nNdjvFwEzaa6l38qConIftVYJDcmsXv6E7HVmZGbU/YOuukpeftRGXYzYem3qqeSdiQfIF4ubAWNM+r0Uw2BpuyLR7W3TFS31doROqJTuLDGgE8KEhMnFqks5rGKIYJBnTxa5mi5YZZkDx31F0ieLeJvXx/u/kOKvnZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc/FOGss4EeFcefUfgnZZs9tCthkRP6fMl0fwkk5FRA=;
 b=mTf51U+kycw4IRlhcEdfeSHlT/EXtJmphlxf6XIZtKkDpN7iDnjYQY5nnLSc4R1ErvV4aXhFwhGBAqS4DPcU+AX/HIwoAOCMKYho5717c4et3j/5vDkommrJ5MMOtCHGqM0uGh+UvY0p5a7v7tm8QOM8PdxHk7/4WGyJ/UOwYjs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgURaX3z0vbnaLxazQgLnUcYxICzwLdV52YO8rx/MOknFquY5d+u9+hFiEAoKX8qY5+yOs94/hQX22pZn8Z2pwx8FwVHiOBkxyaiARPG+K83EQSJz2PiWJ84p2s6XeJa3bmctEbLXhXtSofbOgVbZBFsYs51aQv29s1GBk3tJaLQp0cETatrpJO2vKdoBRFQBxBxZOtZ8/3CBCBBEmM8KlDvMQpjdbzbBFkQLBZbz31vr6h8Azsx2Ulkq/rwWE/wTBuO1dUVkdXfmOKcEf1J3GEJUkv5UQCvwiufQ1hfH8R9W4iioURn8i4HfLwwxChe3Y39nUtpnx++EyW2VjzW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc/FOGss4EeFcefUfgnZZs9tCthkRP6fMl0fwkk5FRA=;
 b=XKzWsrE+9TvZvt3l4AM6/9byTe2cdUuw6RFL583xtmV3f7So0QAo4FSOIrTQO9bcmkRI/Dq3PaHnGIaTYvTFQe/RNK8TneChGaV2iezi4yIo0A9awrDR8ydqbzH8xCxYz6beRuX/vVCCz6zpuj1nFsxfLh7RuBG1KR46LmmujS7WblkjNA/hN9i+s2OwjsrsmX5pM92wrEhgKQkjOO6Sm43sT/v/2wWItlJsYmpezTFsCTuFQd+rlW1l+mRsW3BnnurJhBX/qFOGMo95nTZzrTekUlfUGqUXBzcrCWCkk/C+Hi9/dak64AQRMnZK3XDgthRZVdicC45xFdSjSM8ctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc/FOGss4EeFcefUfgnZZs9tCthkRP6fMl0fwkk5FRA=;
 b=mTf51U+kycw4IRlhcEdfeSHlT/EXtJmphlxf6XIZtKkDpN7iDnjYQY5nnLSc4R1ErvV4aXhFwhGBAqS4DPcU+AX/HIwoAOCMKYho5717c4et3j/5vDkommrJ5MMOtCHGqM0uGh+UvY0p5a7v7tm8QOM8PdxHk7/4WGyJ/UOwYjs=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYwPjzoXW29+zrjEaaAKDaLd6E0a3RFcUAgACB/kA=
Date: Tue, 6 Sep 2022 01:09:04 +0000
Message-ID:
 <AS8PR08MB79916244C5F2F21A44421B08927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <4d5a9acb-32ae-dc52-61b0-4e35052c7270@xen.org>
In-Reply-To: <4d5a9acb-32ae-dc52-61b0-4e35052c7270@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D74880AE8FF07F44B48A41C8F1C3FDF1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b471601-fbbf-47cc-d122-08da8fa46c01
x-ms-traffictypediagnostic:
	DB9PR08MB7699:EE_|VE1EUR03FT048:EE_|DBBPR08MB6057:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k2UXXKx096VHpJsx+Mtb6bhzeZC4b5CFnvKHQ5KR2X+/DsNxJv0zCTKbrj/+W6oM7H/xRsDGO2ld/tgIw+tzE+f+sSC4VY6DbCGbA8ut0gdKlYyg/ECNJwMDq1zbvX4p/p2IGEXh5CaFttpkuu7BhPq4tGZ0/WL6L9094fbpyDv0wqi4u9RTIxQxZxQJXGCBU7uyIFe/eb+blNGAqwGg66LnTOyzUNlMwxvIvbZ1SYLvHwUGJO/R1inNH4osZzcF1xOtr9isGAV0JXZ0uheAYIXMpMP7hnxZ5TimvJ5XN7C1hmFphyaOoD+Z6Kmdfs/CldRi8AKbMOCIJdCjrjZrSFw6Iq+cUSqkbWMFFcZVSQwUGRld7SSX4xuKNTIyoQdU4IsQFJaVJKoFR41ICq/p5W4nZe3+skkOnl2IooeS8qgVa+9l6EpRR0XXJr4JbIJladlrfJi4A4eZ4sdIX4nA2O1CbUjJD3nE+adA6jjM6LAnXdVVxMqvUFYJ0yrDH65aXYm8JdyQoe4XQ0ReCa7B5GkrY8yY3Wt/yahwbI5G018sw6l4AA5hf+O3QKo/00A5gp2Ox5f9PrrpiD5OgT1Ntu71YfMnuDnfmLUlfTeOL3/9eR0v7V+JjIUeCCFn7ZkeW8uoqAVdsw72TDSI3Vu1JrA9T6N8yDBCxgpXow1SzPRIH2KNQGULSEkhPzrNa4PCMWKgN92DuBE5uBBV+hsuJ8SsoNze+cJ7u5jChZhuhKAD1iNZlw4m6m1BZTXgKyefQcSuICVnWFvDQLFyjticEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(186003)(6506007)(53546011)(52536014)(5660300002)(8936002)(9686003)(26005)(86362001)(33656002)(71200400001)(478600001)(7696005)(41300700001)(38070700005)(8676002)(4326008)(76116006)(64756008)(66446008)(66476007)(66556008)(2906002)(54906003)(66946007)(55016003)(316002)(110136005)(83380400001)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f25bf760-7196-410d-7af9-08da8fa46440
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tgssA239uOy+uXhGuN7VNKZdUjc249ep27J+g7j+URRUVq7k5RhvfF2/a1bf+8kasE6YTDNLCQp100ohTc1JwYwmhs/dJxINNqOg7xfriHehWxpnNOO3Rn8evt/VCDvNH8uOZfeuBC907EtPEL63Cyh37SRHEgOl2ccQHLoPvswSKc/qGRVpRrmNjYIrGo8rYqu5rOaK/2fTmNAEN7NAeDLrkva7taX7LCLNWwOi3ssjsPP/Ing8RJgeV5CvJqXSB7hKRjE+s82a+Wo6BGEtbZr+VoVZdD4rc4XcNgUNuJVRat/2JiGgMqEzgcaMXc5cIrT+SppBkvsXUPYcb6C9Ksq2XjhSKEcon3oiJhy0h6wd8Hgbi6As4fY0FhfGCr/ta3/aP9ns62MTmIG/hKIjQ9sFIbwSvPEV/r1CjcHLMUZzHkAi1rkMk1uwMUQ2EgC8ZkpPKU+kf0KlL6Z/v/7KDW6H0eD1+hoU7MvjUoVhVFMTzplXpccgNQeJh7JOGl+6raaAEifKe3wB8tXdfGMZSI30v6UCNmQ7vBhl9MxvjK5RsIC+GEyf76d2bas91tCk0Y47llHlDFfnM+6BQBlawV/Z9XxGTEC1nQV5xO3y/JUl6+jKvayxlK1YOPHECGseGqwBsfPsP8apqyFnpaUmwS3wtGA+DOp7AUthgL/4CbWJMbAcm11vIvbT4EyF/d6XgUQFfZ3a8/xxwkMzB1CeE9qeNNQDm1wu4v2onetNlIXzVlnvHqb7TldPywui2HMfXUjyR8p3ZVfSvk+yax4hJg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(40470700004)(36840700001)(46966006)(40480700001)(6506007)(55016003)(7696005)(83380400001)(4326008)(8676002)(70206006)(70586007)(86362001)(33656002)(53546011)(356005)(36860700001)(81166007)(478600001)(5660300002)(8936002)(41300700001)(52536014)(26005)(2906002)(9686003)(316002)(40460700003)(47076005)(336012)(82310400005)(110136005)(54906003)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 01:09:17.4740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b471601-fbbf-47cc-d122-08da8fa46c01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6057

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS80XSBk
b2NzLCB4ZW4vYXJtOiBJbnRyb2R1Y2UgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkNCj4gDQo+IEhpIEhl
bnJ5LA0KPiANCj4gT24gMDUvMDkvMjAyMiAwODoyNiwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiBU
aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIHRoZSByZXNlcnZlZCBoZWFwIG1lbW9yeSwgd2hpY2ggaXMg
cGFydHMgb2YgUkFNDQo+ID4gcmVzZXJ2ZWQgaW4gdGhlIGJlZ2lubmluZyBvZiB0aGUgYm9vdCB0
aW1lIGZvciBoZWFwLg0KPiA+DQo+ID4gRmlyc3RseSwgc2luY2UgYSBuZXcgdHlwZSBvZiBtZW1v
cnkgYmFuayBpcyBuZWVkZWQgZm9yIG1hcmtpbmcgdGhlDQo+ID4gbWVtb3J5IGJhbmsgc29sZWx5
IGFzIHRoZSBoZWFwLCB0aGlzIGNvbW1pdCBkZWZpbmVzIGBlbnVtDQo+IG1lbWJhbmtfdHlwZWAN
Cj4gDQo+IFRoZSB3b3JkaW5nIGlzIGEgYml0IGNvbmZ1c2luZy4gSSByZWFkIHRoaXMgYXMgdGhl
IGNvZGUgd2lsbCB1c2UgImVudW0NCj4gbWVtYmFua190eXBlIiBidXQgdGhpcyBpcyBub3QgcG9z
c2libGUgYXMgeW91ciBlbnVtIGlzIGFub255bW91cy4NCj4gDQo+IE15IHN1Z2dlc3Rpb24gd291
bGQgYmUgdG8gYXZvaWQgY3JlYXRpbmcgYSB0eXBlZGVmIChzZWUgYmVsb3cpLg0KDQpZZWFoIEkg
dGhpbmsgeW91IGFyZSBjb3JyZWN0LiBUaGUgdHlwZWRlZiBpcyBub3QgcmVhbGx5IG5lY2Vzc2Fy
eS4NCg0KPiANCj4gPiArLSBGb3IgQXJtMzIsIHNpbmNlIHRoZXJlIGFyZSBzZXBlcmF0ZWQgaGVh
cHMsIHRoZSByZXNlcnZlZCBoZWFwIHdpbGwgYmUNCj4gdXNlZA0KPiANCj4gdHlwZTogcy9zZXBl
cmF0ZWQvc2VwYXJhdGVkLw0KDQpPb3BzLCBzb3JyeSBhZ2Fpbi4uDQoNCj4gDQo+ID4gK3R5cGVk
ZWYgZW51bSB7DQo+ID4gKyAgICBNRU1CQU5LX01FTU9SWSwNCj4gDQo+IFRlY2huaWNhbGx5IGV2
ZXJ5dGhpbmcgaXMgbWVtb3J5IDopLiBJIHRoaW5rIGhlcmUgeW91IGFyZSByZWZlcnJpbmcgdG8N
Cj4gZWl0aGVyOg0KPiAgICAgLSBSZXNlcnZlZCBtZW1vcnkgZm9yIHRoZSBkZXZpY2UgKG9yIGZp
cm13YXJlKQ0KPiAgICAgLSBBbnkgbWVtb3J5IHRoYXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSBhbGxv
Y2F0b3IuDQo+IA0KPiBJIHdvdWxkIGNvbnNpZGVyIHRvIG5hbWUgdGhlIGZpZWxkIE1FTUJBTktf
VU5LTk9XTiBvcg0KPiBNRU1CQU5LX0RFRkFVTFQNCj4gd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmlu
ZyB0aGUgbWVhbmluZyBkZXBlbmRzIHdoZXJlIGl0IHVzZWQgKHdlIGhhdmUNCj4gc2V2ZXJhbCBh
cnJheXMgdXNpbmcgc3RydWN0IG1lbWJhbmspLg0KDQpNRU1CQU5LX0RFRkFVTFQgc291bmRzIGdv
b2QsIGFuZCBJIHdpbGwgYWRkIHRoZSBjb21tZW50Lg0KDQo+IA0KPiA+ICsgICAgTUVNQkFOS19Y
RU5fRE9NQUlOLCAvKiB3aGV0aGVyIHRoZSBtZW1vcnkgYmFuayBpcyBib3VuZCB0byBhDQo+IFhl
biBkb21haW4uICovDQo+ID4gKyAgICBNRU1CQU5LX1JTVkRfSEVBUCwgLyogd2hldGhlciB0aGUg
bWVtb3J5IGJhbmsgaXMgcmVzZXJ2ZWQgYXMNCj4gaGVhcC4gKi8NCj4gSSB3b3VsZCBjbGFyaWZ5
IHRoZSB0d28gdmFsdWVzIGFyZSBvbmx5IHZhbGlkIHdoZW4gdGhlIGJhbmsgaW4gaW4NCj4gcmVz
ZXJ2ZWRfbWVtLg0KDQpHb29kIHBvaW50LCB3aWxsIGRvLg0KDQo+IA0KPiA+ICt9IG1lbWJhbmtf
dHlwZTsNCj4gDQo+IEkgd291bGQgcHJlZmVyIGlmIGlmIHdlIGRvbid0IGRlZmluZSBhbnkgdHlw
ZWRlZiBmb3IgdGhpcyBlbnVtLiBCdXQgaWYNCj4geW91IHdhbnQgdG8ga2VlcCBpdCwgdGhlbiBw
bGVhc2Ugc3VmZml4IHdpdGggX3QuDQoNCk5vIEkgdGhpbmsgeW91IGFyZSBjb3JyZWN0LCBhIGVu
dW0gbWVtYmFua190eXBlIGluc3RlYWQgb2YgYSB0eXBlZGVmDQp3b3VsZCBiZSBlbm91Z2ggaGVy
ZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gPg0KPiA+ICAgc3RydWN0IG1lbWJh
bmsgew0KPiA+ICAgICAgIHBhZGRyX3Qgc3RhcnQ7DQo+ID4gICAgICAgcGFkZHJfdCBzaXplOw0K
PiA+IC0gICAgYm9vbCB4ZW5fZG9tYWluOyAvKiB3aGV0aGVyIHRoZSBtZW1vcnkgYmFuayBpcyBi
b3VuZCB0byBhIFhlbg0KPiBkb21haW4uICovDQo+ID4gKyAgICBtZW1iYW5rX3R5cGUgdHlwZTsN
Cj4gPiAgIH07DQo+ID4NCj4gPiAgIHN0cnVjdCBtZW1pbmZvIHsNCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IGluZGV4IDZl
MDM5OGYzZjYuLjhkM2Y4NTk5ODIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVw
LmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IEBAIC02NDQsNyArNjQ0LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfc3RhdGljbWVtX3BhZ2VzKHZvaWQpDQo+ID4NCj4g
PiAgICAgICBmb3IgKCBiYW5rID0gMCA7IGJhbmsgPCBib290aW5mby5yZXNlcnZlZF9tZW0ubnJf
YmFua3M7IGJhbmsrKyApDQo+ID4gICAgICAgew0KPiA+IC0gICAgICAgIGlmICggYm9vdGluZm8u
cmVzZXJ2ZWRfbWVtLmJhbmtbYmFua10ueGVuX2RvbWFpbiApDQo+ID4gKyAgICAgICAgaWYgKCBi
b290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tiYW5rXS50eXBlID09DQo+IE1FTUJBTktfWEVOX0RP
TUFJTiApDQo+ID4gICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgIG1mbl90IGJhbmtfc3Rh
cnQgPQ0KPiBfbWZuKFBGTl9VUChib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tiYW5rXS5zdGFy
dCkpOw0KPiA+ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBiYW5rX3BhZ2VzID0NCj4gUEZO
X0RPV04oYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbYmFua10uc2l6ZSk7DQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

