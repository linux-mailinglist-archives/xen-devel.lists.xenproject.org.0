Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747DA57E21B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373213.605303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsTg-0003kT-6T; Fri, 22 Jul 2022 13:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373213.605303; Fri, 22 Jul 2022 13:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsTg-0003iG-3A; Fri, 22 Jul 2022 13:14:00 +0000
Received: by outflank-mailman (input) for mailman id 373213;
 Fri, 22 Jul 2022 13:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEsTe-0003hw-G3
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:13:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 242e1747-09c0-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 15:13:56 +0200 (CEST)
Received: from AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) by DB6PR0801MB1878.eurprd08.prod.outlook.com
 (2603:10a6:4:76::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 22 Jul
 2022 13:13:51 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::97) by AM5PR0402CA0003.outlook.office365.com
 (2603:10a6:203:90::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 13:13:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 13:13:50 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 22 Jul 2022 13:13:50 +0000
Received: from a592652af29a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BCA623B-2E25-4D1C-B09B-88CC5C2B2EAB.1; 
 Fri, 22 Jul 2022 13:13:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a592652af29a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 13:13:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB9PR08MB6906.eurprd08.prod.outlook.com (2603:10a6:10:2ac::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 13:13:41 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 13:13:41 +0000
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
X-Inumbo-ID: 242e1747-09c0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T0NNu8dxGAvRuaxwxdHl3T89YwPq/w0ChX5xVZwfLX8wm9tfSThqN9dcg6DCcd52MlBMuZ86YlPFHtjx3rgtqCNfqZBbr5N/4RZRFU1YA36vF7oXjl4Yu6vkfhf6wQ51CH/ojp5tP8j34HJX3d1uUvX/P80DxaEViPrcxxK2ESdzoRqmTwc/VeZAVHgJ2wq5x9zlG71YwKj/tBsueebBHvRoswnb1tKUMGbvizVeWUiWuD3LQPB4qKdaQ1RJgXPapiKp1cq1ru8mTfG/g5Yiw2rIejuKuIL+DdUE4JWqcwKy1Kf1OWSR2YPowV+5oblg3ft5AJ99/hexo6O3cuAiiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wErP77+PBFHHrVpdVOfdqP3+il67j2XJK8wRT0Uiu14=;
 b=H6ctCwGiqNZDfqhv5hkYArTe3mdTNCKx5/KP2Gons42r8dRMaJmduz96SJ9deP88gDNIrKCZhFUqfPIdDxkzSVbAszFK/fANBSNxLoBjb385+IjOejanvMRvxEHkQIvl5Y7yAzBAPRE91wUkCExcwE79tUu2Nn3T3p9zpikVuxlx+hzpcSZAMJ3UHeqBCuQjhvM3DaGtFdWbsyO18lTrwxl9Xad3PAvJOSNM5QeFn6bFcqBMUJsUQcn/1gSQhG4aSuNjmG+teWIVhNz9Orcru8CnVv48zcADxtmaNvun3z35/5KaZ928o6DKJfZLvVJlkLdXOfYqmRK+hweKb26aTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wErP77+PBFHHrVpdVOfdqP3+il67j2XJK8wRT0Uiu14=;
 b=w61n3c2x1RotT5D2rVcH5suyxYF3UCLEwTIMiFnZbSSBZxxOs61H3qwJQZD49y5lO1yyi6iuO9Ez2j7HVYaOcw19N8hUFIeMbbjUhVdVmDrTHQibu9y0/z5+41BtOEDk+AJmfXQScxrin+hlfE4fWcmvG4kv3thhSYKKsh/h2Yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43249df0cc27a5ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nreUMO6KLmWrKGIJRtg73ypmgS8919OQm7uAdt+7aMWhjEFppNdm3KId5h3io/hJbKQQzBI2CRJhQpUdTm15hp+dogyUSzxi0eqL6umR79os8jVBF3n905vbSrZrNt9ekoyH3Vlc9WejzFhrjONR3/EOtVfFQQyIFJ79c91TdBLF1eU8CPKjr20Cxim0zrayQ2IfjAmXC7nBsnXH0G9+vlvV7yHh5sMnXgqRiWdO3PccSr+oRZQHSYr22cm1aWzJRZAVXiF7V7B8ASBJyguZPWdqgFdIYbjlsRNNrRy/mN+H31beTjJoFW7bGV34ip4kdrec7HIitTZMuQw7BOsb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wErP77+PBFHHrVpdVOfdqP3+il67j2XJK8wRT0Uiu14=;
 b=TZHHaGBx0giL5z9RZSpDkFhuuZpfD2UrLiRXSlS4egFtFenEfN9kTLOom5AqCrSk8LZMcNuaygYhTaySGfnryn/7Cy6GCOcL00NmxJQJ2B0KSCROl4+0WLN6PynBpRGmVGXWXG7b8mn/l4pPEkES4OE0SngJZZq8Gll6XKsVNYiAodgW9oPmMUBrhSLLciioMCEyT5KUwga2BhcRXgVGq1/t0IHPRO0fCsyqLpJXS/2qxO7joBrudc5ADK5M5y5eWCRwcWassq6JKD8DqpLTejgQXMSz+KYN4PpGZGILHK7hRa0NWGd1z1xj4XbxPyIMt/Gfx6F5EBmD3OHObfp1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wErP77+PBFHHrVpdVOfdqP3+il67j2XJK8wRT0Uiu14=;
 b=w61n3c2x1RotT5D2rVcH5suyxYF3UCLEwTIMiFnZbSSBZxxOs61H3qwJQZD49y5lO1yyi6iuO9Ez2j7HVYaOcw19N8hUFIeMbbjUhVdVmDrTHQibu9y0/z5+41BtOEDk+AJmfXQScxrin+hlfE4fWcmvG4kv3thhSYKKsh/h2Yk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 10/25] tools/xentop: rework makefile
Thread-Topic: [XEN PATCH v3 10/25] tools/xentop: rework makefile
Thread-Index: AQHYh+Q1KLXT6Xly3keDEoxcgJ3CFK2Kie8A
Date: Fri, 22 Jul 2022 13:13:41 +0000
Message-ID: <D5971FBC-86A5-4CE8-947F-B1EC32C0E650@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-11-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-11-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: af1b2753-9651-4d51-4339-08da6be40530
x-ms-traffictypediagnostic:
	DB9PR08MB6906:EE_|VE1EUR03FT037:EE_|DB6PR0801MB1878:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RkUVUIBn0M+q/CZAq1184bWfZSwdnnGx+IT9q8HSpswtyaLGem9ZIGFH37VvCJfvam1JuSd1lkrG08zhYFwDuSv7ck2YAa4j+7WSQFB5tE3gl0un5+N5zGJp94omnr+ZaHWBRa7jFsr+iLcx66t0q5RoYBYm7F4X9ovx7FyWI6r1KMENWD2u7mt0Ww3WB65/R4ARP/KoTEWnkEhtXZatcN8znH6FAgBRi0dN+S8bG5N9kvLvd8m8baGMRGtvPTufbMJaML5/WhMXg1GIfp1vYzWf+KNpFemr+1XZK1ydUfabhiOgLCxv4/Z9MNOK/aabNKW+4Fvr8/LnN104fXRBDFB3lXiwqbT3H780do+t1U6R2nvKYGmyvCgr+hBsuCd03rXGG6BypMTUBL/op2yfYzOzbe+UKh3qZmCnUaNj1qcrujHKWaC8cEPp/5nRPteEhKi38bTFz5skd49f1KiBW59W9TLJ9ZvQ2Ufpz53cX3c9ejLCZH1vaw3GE5Jitsvn80sgT6WQ7KZ77R2HaLuB8U4BhU4wjzuWdVU1m0setTisu1cNv1TAEjm8gQWYdakeqP18ySNK8YIiHvICUFMXHhS6fir190QcJCunLtSBB0D4cnUQgGT2GYDn2IYrqnNpNF6UFiatKInmatZO02/wT6GawudODJxxUkLKDcU8nFfLOv1mmRE/NXj5qQO2YafozYE2za85dydNjwPOkrgK0G66yFJLkfhtA5FMQTzyq6mJXFWyBCTlL7OQSfB1W5UkVDEFHyhQ4zH4FEesvqmsfJ+dQ6hQhnfmmI7diajfihT5i0UdNVpXq8KUYFuVmiOHgskf4w7QSrmElmetI4u+vw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(91956017)(8936002)(5660300002)(4326008)(76116006)(66476007)(66946007)(4744005)(64756008)(66446008)(66556008)(8676002)(2906002)(54906003)(38070700005)(33656002)(38100700002)(36756003)(71200400001)(86362001)(6486002)(122000001)(186003)(6506007)(6512007)(26005)(53546011)(6916009)(478600001)(41300700001)(2616005)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E04063A4294010408A2A5CCA742276CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6906
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed0ec2c8-492e-407e-8938-08da6be3ff4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OhJNt6FGQsgqvlfdjAawl/yvwyJEI6AIrCcEJG1PddMYWFX4YAU8LqvUki2DhqRaA/3IJ7ocKjVDRI8o5+poEaLXycE69kANLSmeVpIF3QtlQRMiR8mxIoDkAmIdsSnnjfOjYOEJjMcW3Szvg6g/VuCS6yV6aeC1YAl+/Pn+inUZlwW77+EEU7gNibIGPsk8KDaTwvS1aIp2tkgmeYZs0EoIp+jpdr1ZjqHpqd7nnW5ZMFefdfuqhhB+2KzyAoBLwxSz7x9pNrnQDzt5rWIoY/jZ8eCRpD58/c3ZeMNR8SGSwqMtcPAwGPkLldPu/nQ89ZbmaARMBCYBLKdAdJCz1bD9W+Q0qTwObl/Vx0MIqox67ie6mldBKer/wgXcPw0lw82ga0osoRpBt/3oJcGAPPT/HIXBT4iii34qva75MceFtKKSn3OxslMDPNhAdWRRE7BBXAoduwomqrh9t2DphQ0lE6U0G8iGuvvq3PM7oSBx70ev9w3ibVoh4524ufEfHVdafxw8H1jixbMU2nQMNSFVoFoLGR+pBEvyWTK+md+r4FYNagJr+W5KZFt9L9imk0dfuMAfxj1AcahFlM/klCNhSPxKOcFTKCSO9tmY778cuLy0jM1Es4Z/Y1ZOwd6aN4EBx0/StA7AYEUBZM0R83rwMIcwnZzfjXggfoMnwwjd6zWi2GIjxFKcR1WhN7pMpt6Sp+O/ypM8azF0gD5Spo06U21UFb1focXlYIx85PIyXdXehYK2jTCO3G3QwH//grVBC4xSiXGxNZVo8QTsTszFSpWyfDR8jfNBYXAtg2hvzGYx5gPeljAcjHb/qUgp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(40470700004)(316002)(186003)(81166007)(33656002)(41300700001)(8676002)(54906003)(82740400003)(70206006)(4326008)(336012)(2906002)(86362001)(40460700003)(2616005)(47076005)(356005)(5660300002)(70586007)(53546011)(6506007)(6512007)(26005)(478600001)(4744005)(82310400005)(6486002)(8936002)(36860700001)(40480700001)(6862004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 13:13:50.9017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1b2753-9651-4d51-4339-08da6be40530
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1878

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgInhlbnRvcCIgdG8gIlRBUkdFVFMi
IGJlY2F1c2UgdGhpcyB2YXJpYWJsZSB3aWxsIGJlIHVzZWZ1bCBsYXRlci4NCj4gDQo+IEFsd2F5
cyBkZWZpbmUgYWxsIHRoZSB0YXJnZXRzLCBldmVuIHdoZW4gY29uZmlndXJlZCB3aXRoDQo+IC0t
ZGlzYWJsZS1tb25pdG9yLCBpbnN0ZWFkIGRvbid0IHZpc2l0IHRoZSBzdWJkaXJlY3RvcnkuDQo+
IFRoaXMgbWVhbiB4ZW50b3AvIGlzbid0IHZpc2l0ZWQgYW55bW9yZSBkdXJpbmcgIm1ha2UgY2xl
YW4iIHRoYXQncyBob3cNCj4gbW9zdCBvdGhlciBzdWJkaXJzIGluIHRoZSB0b29scy8gd29ya3Mu
DQo+IA0KPiBBbHNvIGFkZCBtaXNzaW5nICJ4ZW50b3AiIHJ1bGVzLiBJdCBvbmx5IHdvcmtzIHdp
dGhvdXQgaXQgYmVjYXVzZSB3ZQ0KPiBzdGlsbCBoYXZlIG1ha2UncyBidWlsdC1pbnMgcnVsZXMg
YW5kIHZhcmlhYmxlcywgYnV0IGZpeCB0aGlzIHRvIG5vdA0KPiBoYXZlIHRvIHJlbHkgb24gdGhl
bS4NCj4gDQo+IFVzZSAkKFRBUkdFVFMpIHdpdGggJChJTlNUQUxMX1BST0cpLCBhbmQgdGh1cyBp
bnN0YWxsIGludG8gdGhlDQo+IGRpcmVjdG9yeSByYXRoZXIgdGhhbiBzcGVsbGluZyB0aGUgcHJv
Z3JhbSBuYW1lLg0KPiANCj4gSW4gdGhlICJjbGVhbiIgcnVsZSwgdXNlICQoUk0pIGFuZCByZW1v
dmUgYWxsICIqLm8iIGluc3RlYWQgb2YganVzdA0KPiBvbmUgb2JqZWN0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IOKA
lA0KDQpIaSBBbnRvbnksDQoNCk5pY2UsIHRoaXMgZG9lcyBpdCB3aXRoIGp1c3Qgb25lIGdjYyBp
bnZvY2F0aW9uLg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KDQoNCg0K

