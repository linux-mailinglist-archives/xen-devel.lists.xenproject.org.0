Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B615C41A5D1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 04:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197361.350385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV3Kz-0007Nx-4Q; Tue, 28 Sep 2021 02:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197361.350385; Tue, 28 Sep 2021 02:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV3Ky-0007LR-Vq; Tue, 28 Sep 2021 02:59:20 +0000
Received: by outflank-mailman (input) for mailman id 197361;
 Tue, 28 Sep 2021 02:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0YX1=OS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mV3Ky-0007LJ-BM
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 02:59:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 121bc1aa-2008-11ec-bc63-12813bfff9fa;
 Tue, 28 Sep 2021 02:59:18 +0000 (UTC)
Received: from DB6PR1001CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::14)
 by DBBPR08MB5945.eurprd08.prod.outlook.com (2603:10a6:10:1f7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 02:59:16 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::86) by DB6PR1001CA0028.outlook.office365.com
 (2603:10a6:4:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 02:59:16 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 02:59:16 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Tue, 28 Sep 2021 02:59:16 +0000
Received: from ab48ca72af33.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B877F9A8-4119-421A-AE6A-EF9E19D38DB6.1; 
 Tue, 28 Sep 2021 02:59:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab48ca72af33.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 02:59:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 02:59:01 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 02:59:01 +0000
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
X-Inumbo-ID: 121bc1aa-2008-11ec-bc63-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YznWpNLGBTTBslejc45Z5WNnZBZJnNh3kX1oxPRNQE0=;
 b=JoFAiDbvREDC6LTVhivbd9CcyWCkgJmk3UzkBydTJpoEtvJwdofhTgMAghaEi+KJbXzBegBkN3nJLC8xNKklk5rQHKyhqDezyukzoRkMCgK+qQp+NYbIs3zMVBv47v/vipg52IB/ykTk4JePFYiPWH3g7UEvNhYX/AaB5bn3bUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFa6BQblO5XPD/aRsZQxLKrb/2VoQdy2rz1ty4Ja4Cx3hzgN2GAYTzytlEAirCp32p+DDwpgquNwsYuMV9VKMWvzfe0fBThAg3Otn8UxeKVuGVRd6sxHZRe1nCFPwVTc2dpwXFYhQ92WFmK03YQZ+YQy9oxPFfR0QL3JoQAyUzVpOIfqgEJb//0cTtQy36bk+gwdG1GidUh67yIl/7tEPGsTf4iveMgBwOj2KMH2LApRuzGslAW/BCEXdSUOVut0vp2OjrxLlzk0BY2RK0ucUpbANhYuC8ShO2SbVuJjBU6e2c3hWjBG+ybZc0sF0bQNLN5tH/LMjoqRw3pl49T+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YznWpNLGBTTBslejc45Z5WNnZBZJnNh3kX1oxPRNQE0=;
 b=f5B28R6Atoqx/SEazwJwAVvWIJiCa0Y/IaaYOkNY2fvUHN7734be/9QjSIhrXK3uXgOrzUWwN0h7y7zDsUbzKUcL9eDJXzxt1O3C6xWU1+UnDBVH4AmwsZAFF1rPyAkyoyr4WZxXh4m0b1wPVe9v8Fbvl+/Fqm8zhOKcUxK15EANjBIL33BRXxRmYqIn+wjvunSb+T28iWPFmzXXJI5Erj7XBR3EdqWC7BPF3R+oUgo0d/dT63pzrnBs0HIW5u3yCe1cWxXrRMkhuEjMz2pztcn4jGIbh4zoUMSRq6Tyt9y2OV/NYa5va1eOIbjVMhPeeNE35QGLC+g1nMK5yimIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YznWpNLGBTTBslejc45Z5WNnZBZJnNh3kX1oxPRNQE0=;
 b=JoFAiDbvREDC6LTVhivbd9CcyWCkgJmk3UzkBydTJpoEtvJwdofhTgMAghaEi+KJbXzBegBkN3nJLC8xNKklk5rQHKyhqDezyukzoRkMCgK+qQp+NYbIs3zMVBv47v/vipg52IB/ykTk4JePFYiPWH3g7UEvNhYX/AaB5bn3bUU=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Julien Grall <julien.grall.oss@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
Thread-Topic: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
Thread-Index:
 AQHXsHM4CZyvsR6BnEO/IHEJe48InquyiHQAgABwPACAAJ4wgIAD/P8AgAADRwCAAAjPgIAAhjmAgACh/HA=
Date: Tue, 28 Sep 2021 02:59:01 +0000
Message-ID:
 <DB9PR08MB6857EB6600193CCB7B77ECC39EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
 <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
 <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
 <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com>
 <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com>
 <42eb1303-1b45-5489-eac3-855f4ab35eb5@suse.com>
 <alpine.DEB.2.21.2109271006480.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109271006480.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B9306C586C15294FA7A6F5EE81DC5DCA.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b5bf9a4b-237c-4a66-c496-08d9822bf584
x-ms-traffictypediagnostic: DBAPR08MB5559:|DBBPR08MB5945:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5945E74933E43F6B530486FD9EA89@DBBPR08MB5945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7xyDVYhRROI6i29Rk57QzingHBhWsXSp0xYLlPcwycUsPN9OQS/kGgBCI16cCLJw2iiKV1zPY0yCodXphJakxs5xCYMjqKCgu2f0tVQGD9EP584s7IzUaDYhgjQi/X+yJhFmAT97bUEk15IeTntqO5JqfoefwSy4B1TKgc1D1MEY42VnYEZ1l4cKG2zNJl6veZ99iB6eNBo6+90YMC5oUPspeQKI0aLroLeJDvDvnla4j5Hzg8l5ADsCnNQaoP7NYXfQxKqsF9p74SZz7YizTS948BolTZD/0eM15z65RndS5igBTwdsycB2osHDXxllPssuDQxtjydmgvBuMDVZ+xl62XmyyAJZ5Xt0pVS8ql5vjbR72mMgb6VCYK9WP7mtN/Lx3qouq+H9atY2H5+Ss8/+T46VC43U97aGSZrTf/54ujEg0O0D7evSZb3x3qP0PqkjeJl9osuMLseIHZ4a4atRRFXJquVwPBnAB6L0j6jVYAF48+KcgMEoyxrhAZ5dlNw3wh0kpnL4cDYJwoKSIyYZWP1Z1yI5ScwS8ip0E1OfXD2IoR9Pna9H0CqgrBkKl4q5I8/S3W3F/7CdFOPSp1DTmvQZ0J6fv9v3ffbLRhlnHY3jfttnrX2V0kfh3+/4zvGcZLTyN8rIxLrjjW5Pw6WadSIn+JXSR5NK+MLTPnK8FB2y3S0vyWCnE7Yev2z4q2X1/QE1qctPxPm+qgrZTtzPniQagr8/TcTuayn+ubM9uk0gFM30f/qF/2oT77XNpiIbDpA0GhMVeQguRsbbmk6NCYeLfLfs9gyRuR8KK1o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(26005)(9686003)(186003)(55016002)(8676002)(8936002)(54906003)(86362001)(38070700005)(33656002)(122000001)(83380400001)(38100700002)(316002)(53546011)(66476007)(508600001)(66446008)(66946007)(66556008)(76116006)(7696005)(966005)(110136005)(6506007)(64756008)(71200400001)(2906002)(4326008)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	208a95a9-8294-4a1d-ad0c-08d9822becdc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+6d8YT3a5PAYjXjf3OcHIDKHC/GaUgllVdxYTe6GXIWOsFjKF+H5wIqJ1J7peFfUCWew6sB5OisBPzKW/hd2kKiKlPOx74p3Bjbv+6JZnnTQZX2hapMvgaIctYFCcVgI5NHx+wLgSiP9I4HOgssoL5F0xxsqOKQhxDXUHQfKAozx9UcYK9Z0BVo67HNhabfY77cy5bJ0Ijlmaocm7RZJgpqmvCjyWrUBUtYLh5np9f9HcGGZNgi+gifXnZFaDEL7HAKyAh6mnLz96M8P11gr8Ev+WVdAVxRMXejWk4GpQ34dR99wRxWeYT3gk7j4frJDx2MU2zWsZEfdyWULtTXqXoP6Q16JDRFV+N39GNhV8jl+DdvFhip+ViIKbDsfUlbVQyhrKqDkjcGctELYV/nRGrBUoJBYxSkzMNrJP7SlxkuFOwCFu08UjRJQceMctsdzy+jR16GpCCUFiPnq5tGxKfgiD5a1cFHq+FZjWQsmpnKT/hOuUEKLELIMdlM8AYp3+lwS4TQ6WY9lB0pQKvvJus/vM6uAHHmxWcf/EOko9i7Eod37w01yAKuDJAB9pkDxVq94d1bLcS+yua2nZd5IbzEUB9eQBMWr7Ayvo4LKt+skuBuhIFNxNzXbT/CaMUOVopr2dL/JavR2vDX7Hco+QSVyaQeVC7ncpHD2gUYh00ujhWRj6qSdFHfuxJ3akAkAau0N6DvAdKZmZAC8XzIgvICSDEnmDvECPT4phHqo/pHwzZrpnd6qaiBxl56Bm06HLUQKOjiAWepMf0Q6i2kje2bWC/ZPIddM2qqT3kJFc34=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(4326008)(6506007)(54906003)(83380400001)(336012)(86362001)(356005)(186003)(26005)(81166007)(52536014)(7696005)(55016002)(9686003)(47076005)(110136005)(53546011)(8676002)(5660300002)(2906002)(36860700001)(70586007)(508600001)(316002)(70206006)(82310400003)(966005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 02:59:16.3899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf9a4b-237c-4a66-c496-08d9822bf584
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI4yNUgMToxNw0KPiBUbzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0u
Y29tPjsgeGVuLWRldmVsIDx4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDM2LzM3XSB4ZW4vYXJtOiBQcm92aWRlIEtjb25maWcgb3B0aW9ucyBmb3IgQXJtIHRv
DQo+IGVuYWJsZSBOVU1BDQo+IA0KPiBPbiBNb24sIDI3IFNlcCAyMDIxLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPiBPbiAyNy4wOS4yMDIxIDEwOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4g
PiBPbiBNb24sIDI3IFNlcCAyMDIxLCAxMDozMyBKYW4gQmV1bGljaCwgPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPj4gT24gMjQuMDkuMjAyMSAyMTozOSwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPiA+ID4+PiBPbiBGcmksIDI0IFNlcCAyMDIxLCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiA+Pj4+IE9uIDIwMjEvOS8yNCAxMTozMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiA+ID4+Pj4+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
ID4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ID4+Pj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vS2NvbmZpZw0KPiA+ID4+Pj4+PiBAQCAtMzQsNiArMzQsMTcgQEAgY29uZmlnIEFD
UEkNCj4gPiA+Pj4+Pj4gICAgICBBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRl
cmZhY2UgKEFDUEkpIHN1cHBvcnQNCj4gZm9yDQo+ID4gPj4gWGVuIGlzDQo+ID4gPj4+Pj4+ICAg
ICAgYW4gYWx0ZXJuYXRpdmUgdG8gZGV2aWNlIHRyZWUgb24gQVJNNjQuDQo+ID4gPj4+Pj4+ICAg
KyBjb25maWcgREVWSUNFX1RSRUVfTlVNQQ0KPiA+ID4+Pj4+PiArICBkZWZfYm9vbCBuDQo+ID4g
Pj4+Pj4+ICsgIHNlbGVjdCBOVU1BDQo+ID4gPj4+Pj4+ICsNCj4gPiA+Pj4+Pj4gK2NvbmZpZyBB
Uk1fTlVNQQ0KPiA+ID4+Pj4+PiArICBib29sICJBcm0gTlVNQSAoTm9uLVVuaWZvcm0gTWVtb3J5
IEFjY2VzcykgU3VwcG9ydA0KPiAoVU5TVVBQT1JURUQpIg0KPiA+ID4+IGlmDQo+ID4gPj4+Pj4+
IFVOU1VQUE9SVEVEDQo+ID4gPj4+Pj4+ICsgIHNlbGVjdCBERVZJQ0VfVFJFRV9OVU1BIGlmIEhB
U19ERVZJQ0VfVFJFRQ0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gU2hvdWxkIGl0IGJlOiBkZXBlbmRz
IG9uIEhBU19ERVZJQ0VfVFJFRSA/DQo+ID4gPj4+Pj4gKEFuZCBldmVudHVhbGx5IGRlcGVuZHMg
b24gSEFTX0RFVklDRV9UUkVFIHx8IEFDUEkpDQo+ID4gPj4+Pj4NCj4gPiA+Pj4+DQo+ID4gPj4+
PiBBcyB0aGUgZGlzY3Vzc2lvbiBpbiBSRkMgWzFdLiBXZSB3YW50IHRvIG1ha2UgQVJNX05VTUEg
YXMgYSBnZW5lcmljDQo+ID4gPj4+PiBvcHRpb24gY2FuIGJlIHNlbGVjdGVkIGJ5IHVzZXJzLiBB
bmQgZGVwZW5kcyBvbiBoYXNfZGV2aWNlX3RyZWUNCj4gPiA+Pj4+IG9yIEFDUEkgdG8gc2VsZWN0
IERFVklDRV9UUkVFX05VTUEgb3IgQUNQSV9OVU1BLg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IElmIHdl
IGFkZCBIQVNfREVWSUNFX1RSRUUgfHwgQUNQSSBhcyBkZXBlbmRlbmNpZXMgZm9yIEFSTV9OVU1B
LA0KPiA+ID4+Pj4gZG9lcyBpdCBiZWNvbWUgYSBsb29wIGRlcGVuZGVuY3k/DQo+ID4gPj4+Pg0K
PiA+ID4+Pj4NCj4gPiA+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMjEtDQo+IDA4L21zZzAwODg4Lmh0bWwNCj4gPiA+Pj4NCj4gPiA+Pj4g
T0ssIEkgYW0gZmluZSB3aXRoIHRoYXQuIEkgd2FzIGp1c3QgdHJ5aW5nIHRvIGNhdGNoIHRoZSBj
YXNlIHdoZXJlIGENCj4gPiA+Pj4gdXNlciBzZWxlY3RzICJBUk1fTlVNQSIgYnV0IGFjdHVhbGx5
IG5laXRoZXIgQUNQSSBub3INCj4gSEFTX0RFVklDRV9UUkVFDQo+ID4gPj4+IGFyZSBzZWxlY3Rl
ZCBzbyBub3RoaW5nIGhhcHBlbnMuIEkgd2FzIHRyeWluZyB0byBtYWtlIGl0IGNsZWFyIHRoYXQN
Cj4gPiA+Pj4gQVJNX05VTUEgZGVwZW5kcyBvbiBoYXZpbmcgYXQgbGVhc3Qgb25lIGJldHdlZW4g
SEFTX0RFVklDRV9UUkVFIG9yDQo+IEFDUEkNCj4gPiA+Pj4gYmVjYXVzZSBvdGhlcndpc2UgaXQg
aXMgbm90IGdvaW5nIHRvIHdvcmsuDQo+ID4gPj4+DQo+ID4gPj4+IFRoYXQgc2FpZCwgSSBkb24n
dCB0aGluayB0aGlzIGlzIGltcG9ydGFudCBiZWNhdXNlIEhBU19ERVZJQ0VfVFJFRQ0KPiA+ID4+
PiBjYW5ub3QgYmUgdW5zZWxlY3RlZC4gU28gaWYgd2UgY2Fubm90IGZpbmQgYSB3YXkgdG8gZXhw
cmVzcyB0aGUNCj4gPiA+Pj4gZGVwZW5kZW5jeSwgSSB0aGluayBpdCBpcyBmaW5lIHRvIGtlZXAg
dGhlIHBhdGNoIGFzIGlzLg0KPiA+ID4+DQo+ID4gPj4gU28gaG93IGFib3V0IGRvaW5nIHRoaW5n
cyB0aGUgb3RoZXIgd2F5IGFyb3VuZDogQVJNX05VTUEgaGFzIG5vDQo+IHByb21wdA0KPiA+ID4+
IGFuZCBkZWZhdWx0cyB0byBBQ1BJX05VTUEgfHwgRFRfTlVNQSwgYW5kIERUX05VTUEgZ2FpbnMg
YSBwcm9tcHQNCj4gaW5zdGVhZA0KPiA+ID4+IChhbmQsIGZvciBBcm0gYXQgbGVhc3QsIEFDUElf
TlVNQSBhcyB3ZWxsOyB0aGlzIG1pZ2h0IGV2ZW4gYmUNCj4gd29ydGh3aGlsZQ0KPiA+ID4+IHRv
IGhhdmUgb24geDg2IGRvd24gdGhlIHJvYWQpLg0KPiA+ID4+DQo+ID4gPg0KPiA+ID4gQXMgSSB3
cm90ZSBiZWZvcmUsIEkgZG9uJ3QgdGhpbmsgdGhlIHVzZXIgc2hvdWxkIHNheSAiSSB3YW50IHRv
IGVuYWJsZQ0KPiBOVU1BDQo+ID4gPiB3aXRoIERldmljZS1UcmVlIG9yIEFDUEkiLiBJbnN0ZWFk
LCB0aGV5IHNheSB3aGV0aGVyIHRoZXkgd2FudCB0byB1c2UNCj4gTlVNQQ0KPiA+ID4gYW5kIGxl
dCBYZW4gZGVjaWRlIHRvIGVuYWJsZSB0aGUgRFQvQUNQSSBzdXBwb3J0Lg0KPiA+ID4NCj4gPiA+
IEluIG90aGVyIHdvcmQsIHRoZSBwcm9tcHQgc2hvdWxkIHN0YXkgb24gQVJNX05VTUEuDQo+ID4N
Cj4gPiBPa2F5LiBJbiB3aGljaCBjYXNlIEknbSBjb25mdXNlZCBieSBTdGVmYW5vJ3MgcXVlc3Rp
b24uDQo+IA0KPiBMZXQgbWUgY2xhcmlmeTogSSB0aGluayBpdCBpcyBmaW5lIHRvIGhhdmUgYSBz
aW5nbGUgcHJvbXB0IGZvciBOVU1BIGluDQo+IEtjb25maWcuIEhvd2V2ZXIsIEkgYW0ganVzdCBw
b2ludGluZyBvdXQgdGhhdCBpdCBpcyB0aGVvcmV0aWNhbGx5DQo+IHBvc3NpYmxlIHdpdGggdGhl
IGN1cnJlbnQgY29kZSB0byBwcmVzZW50IGFuIEFSTV9OVU1BIHByb21wdCB0byB0aGUgdXNlcg0K
PiBidXQgYWN0dWFsbHkgaGF2ZSBubyBOVU1BIGVuYWJsZWQgYXQgdGhlIGVuZCBiZWNhdXNlIGJv
dGggREVWSUNFIFRSRUUNCj4gYW5kIEFDUEkgYXJlIGRpc2FibGVkLiBUaGlzIGlzIG9ubHkgYSB0
aGVvcmV0aWNhbCBwcm9ibGVtIGJlY2F1c2UgREVWSUNFDQo+IFRSRUUgc3VwcG9ydCAoSEFTX0RF
VklDRV9UUkVFKSBjYW5ub3QgYmUgZGlzYWJsZWQgdG9kYXkuIEFsc28gSSBjYW5ub3QNCj4gaW1h
Z2luZSBob3cgYSBjb25maWd1cmF0aW9uIHdpdGggbmVpdGhlciBERVZJQ0UgVFJFRSBub3IgQUNQ
SSBjYW4gYmUNCj4gY29ycmVjdC4gU28gSSBkb24ndCB0aGluayBpdCBpcyBhIGNyaXRpY2FsIGNv
bmNlcm4uDQo+IA0KPiBUaGF0IHNhaWQsIHlvdSBjYW4gc2VlIHRoYXQsIGF0IGxlYXN0IHRoZW9y
ZXRpY2FsbHksIEFSTV9OVU1BIGRlcGVuZHMgb24NCj4gZWl0aGVyIEhBU19ERVZJQ0VfVFJFRSBv
ciBBQ1BJLCBzbyBJIHN1Z2dlc3RlZCB0byBhZGQ6DQo+IA0KPiBkZXBlbmRzIG9uIEhBU19ERVZJ
Q0VfVFJFRSB8fCBBQ1BJDQo+IA0KPiBXZWkgYW5zd2VyZWQgdGhhdCBpdCBtaWdodCBpbnRyb2R1
Y2UgYSBjaXJjdWxhciBkZXBlbmRlbmN5LCBidXQgSSBkaWQNCj4gdHJ5IHRoZSBhZGRpdGlvbiBv
ZiAiZGVwZW5kcyBvbiBIQVNfREVWSUNFX1RSRUUgfHwgQUNQSSIgdW5kZXIgQVJNX05VTUENCj4g
aW4gS2NvbmZpZyBhbmQgZXZlcnl0aGluZyBidWlsdCBmaW5lIGhlcmUuDQoNCk9rLCBJIHdpbGwg
YWRkICJkZXBlbmRzIG9uIEhBU19ERVZJQ0VfVFJFRSIgaW4gbmV4dCB2ZXJzaW9uLCBidXQgInx8
IEFDUEkiDQp3aWxsIGJlIGxhdGVyIHdoZW4gd2UgaGF2ZSBBQ1BJIE5VTUEgZm9yIEFybSA6ICkN
Cg0K

