Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DD6EEEF1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526507.818306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZHF-0000ej-Ud; Wed, 26 Apr 2023 07:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526507.818306; Wed, 26 Apr 2023 07:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZHF-0000bL-Rg; Wed, 26 Apr 2023 07:09:21 +0000
Received: by outflank-mailman (input) for mailman id 526507;
 Wed, 26 Apr 2023 07:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prZHE-0008Td-D5
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:09:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 423e1730-e401-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 09:09:17 +0200 (CEST)
Received: from AM6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::15)
 by AS4PR08MB8166.eurprd08.prod.outlook.com (2603:10a6:20b:58d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 07:09:12 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::9a) by AM6P191CA0002.outlook.office365.com
 (2603:10a6:209:8b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 07:09:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 07:09:12 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 26 Apr 2023 07:09:11 +0000
Received: from 74e3fce50081.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1058206B-7833-4093-BD0E-DBAA7E87E022.1; 
 Wed, 26 Apr 2023 07:09:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74e3fce50081.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 07:09:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10361.eurprd08.prod.outlook.com (2603:10a6:20b:56d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 07:08:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 07:08:56 +0000
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
X-Inumbo-ID: 423e1730-e401-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GUU/m+xsfVYzT9TWT2PAJ1kjugLJkqjWPwsCs1aqwg=;
 b=hS4rh9OWjW7bxwtxiiQLmMR5qVdKVxrIvhkQqn8yWGK5t8BLgITKyyViy+24xsutJp1n/5rfKtRHkSulnw7WBEFGhWj7SiuM9Lf+e0PzrvypUeqGt8rU5uoRWi5p22R6FZLghoQGSq8BbOP67R1wXOSmaoKuAs/Fg7F8/4CAWX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgv+dYJvbU94aOUiAG4ycwk0vTZfSzsvfKxEhC4vxKCVyCblzsvp7mUGmg5UOoVf4P122jk8yHRgQZJW09IjsTt0tKhhjBFitHyDDfXtt8+FFBlioExPFfmXcKLzFQpSPwj397r3C8VsNjF/a5r7bVdaZjmW/SkizCJ2Xtp7WWlwAuyTuYCut+/y9Xl4ZyTMMyG6FKPVLW6iSIquk2gBDSBXo0et2DxNeTjG49wrgp5enZMxVj+aw2MdgwpXE30YmNksDcTilm+tB88DsX6iUtJafbRBxTTQvJ0xneTV9hQpoA/J2SAruU/tMIOoJgTesHBkbAzlestvVua1SdK/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GUU/m+xsfVYzT9TWT2PAJ1kjugLJkqjWPwsCs1aqwg=;
 b=eRoZDKIo+CO0FFxzGGgWZ4wVTRT5VbVoJWvmfKaTI8b/Ha98boqcXHKbGl9hdysNA3CgTcFHwlBiUTUcLvOiw1sxZPfNIZdJaY9MntYy/Pa78dk/NBbcn/LVwrBS60HY50gTKbv7/y2tNBPLYSXtpsORzy6PlXdoseola9VCPpre8LDragVsmawcR5kBuFKL1CoqJ7EDYZP/YemChHJC87J3c35pOLiPCLiCBAErAL+fHdvzTLOCzpE466ZOiqn6i3yhgPKOfhSa2u0a1b/HNHirahH/WmFDQUT7muGnzgCk4lFQ0QtkkQGx8uLR8KkQYmVcI315Ip6nqGH+grz43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GUU/m+xsfVYzT9TWT2PAJ1kjugLJkqjWPwsCs1aqwg=;
 b=hS4rh9OWjW7bxwtxiiQLmMR5qVdKVxrIvhkQqn8yWGK5t8BLgITKyyViy+24xsutJp1n/5rfKtRHkSulnw7WBEFGhWj7SiuM9Lf+e0PzrvypUeqGt8rU5uoRWi5p22R6FZLghoQGSq8BbOP67R1wXOSmaoKuAs/Fg7F8/4CAWX8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index: AQHZd0ulMpqFICe/LUiDVq6+aDsW9687sveAgAFTkCCAACNagIAAAPgg
Date: Wed, 26 Apr 2023 07:08:56 +0000
Message-ID:
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
In-Reply-To: <13635377-e296-370d-121b-5b617dc210bc@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CA862ADAAD63DD47A292997B3D788A4E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10361:EE_|AM7EUR03FT015:EE_|AS4PR08MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 79533882-192a-44fd-04ec-08db4625232e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 baedVpBxtfAzfCqe9mAqyWLt9Cjna7ki1rbFYPYEZ9o5iJSkIjSgDJDJiNIIT2osubXj6wzJPVnzeTZgvCDK28qr4USy7/0eQfideRbxxIF4ffPLgj5hQy/7/kPukMTM/opF3XDwmvoS1DKumfhzqjPvDBiTEQngs43fVEXKoPWhxYYijhMgpHqXb2b/2BSR2XczSdFIpYTI0sxGq1+XSjUcoSbvu4Cu5zYnPF8m3bhhMBy7XPnntth+uYWRSoNWbEMZb6DLYMk7KxjX2B1sUMZqsKg8v90/jzl+xGqLJ/EB8wsE74YJVddJddYOOEt3FLxwwEcR2kz17DPeCT/oymmNGLgBd5HtBxaDPUvIMTYbL5qsXepOBwTfRH2kUnWhnEAJUu1Y6yzENViEFrdlTz1aD/3djEr70orBT9SoBXFh8+0uWBJXtymJsCGYsBvOATND3NQ3EYIl0yG9Jwjxqko1eekSYfJOL0pn/er+aHRGEUMb0ecTsQirPRwy5znmfdtzAOU+5BeXbMwioyvFlg0VdLI4nzbBUvbhdHKf4qJun0C6BFsfe/lUgAYfxlKExaO1tuzxQiqJyId3fgBJIzfVCq7FELFfznfxNjU1mC0TORxuPS/awrcSLk/5xz9Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(86362001)(38070700005)(33656002)(2906002)(55016003)(71200400001)(186003)(53546011)(83380400001)(7696005)(6506007)(9686003)(26005)(66946007)(6636002)(478600001)(66476007)(76116006)(110136005)(41300700001)(122000001)(52536014)(316002)(66446008)(8676002)(5660300002)(66556008)(4326008)(54906003)(64756008)(8936002)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10361
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3511d7f4-0ce7-48ca-e59c-08db462519a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ilhFoR/ds4jEKJ75T6LASHNG/B+DEeSNDYBpOBFxT7Knx1t4k9ozvAQkP4cidD3gu2BpeES10xairOtQBYOw5tp2x2uyxPTqi8GtVMBoX/Ng4HzXgJoyV0SoYdvZ2sPDehtxK5yd+g+Zbrl1RBdXYZYxLS3WbbjLjLP6bMj9zKku3iRS0t3GTU70cwev9F9uFYxi4+5Cnxk0zulOqnRt60/bWL8IkidtaE5p0ui85ybpr3CULRSUoaIfAo5cq1tG3TTONlKhOv4Q7UTMuPbaYgALBTQKDvGMRVUAxauLVWLJ+Yd0kbgsunzdgbrbpkJ/OKbhy/Zx6C/K4i4nCk8Sr0kBxomNTUjVHv5btgX5z8gNyoz0dNk80WNz99TIoZ8kieHxDdFN282ro+IYSCSwrQAPmbGFxY9c6x9fYssAc6qs3/GHtHtORCLQ8ur0h9XN0zrM0xD0oeq0LmnrKOtKeDnDKQkEUADNtJvpHkLYI+22Sr6aPaODlkc4JFaf7YG/4f2jrTiMHC8sXrPb3rOM4VNCKphf92FxXh+2loZWef1qhzVnMe6F6gooG/niRxr5rGWYNtoLmbPotz8MQSRMi8Yoeh2XePgKwfVbjN356YjS8HS0Nja9K2W/khIyOF7Vnf71DVRcrP2EaMW/uSPG6mpurp5QZftwzppmSprR7krRJddA4rcWaWDoAL1x6ZB7ujFJ8L7Vu8LWkb8VtBnNfQ15u/yypE2KGzPtQbe9uI8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(70586007)(70206006)(82740400003)(83380400001)(36860700001)(2906002)(6506007)(55016003)(40480700001)(33656002)(26005)(9686003)(82310400005)(316002)(4326008)(47076005)(52536014)(356005)(336012)(8676002)(81166007)(41300700001)(5660300002)(8936002)(7696005)(110136005)(6636002)(54906003)(86362001)(478600001)(40460700003)(186003)(53546011)(34070700002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:09:12.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79533882-192a-44fd-04ec-08db4625232e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8166

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOS8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIE5VTUEg
ZGlzdGFuY2UgbWFwDQo+IA0KPiBPbiAyNi4wNC4yMDIzIDA3OjMzLCBIZW5yeSBXYW5nIHdyb3Rl
Og0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+DQo+ID4+PiArICAgICAgICAvKiBHZXQgb3Bwb3Np
dGUgd2F5IGRpc3RhbmNlICovDQo+ID4+PiArICAgICAgICBvcHBvc2l0ZSA9IF9fbm9kZV9kaXN0
YW5jZSh0bywgZnJvbSk7DQo+ID4+PiArICAgICAgICAvKiBUaGUgZGVmYXVsdCB2YWx1ZSBpbiBu
b2RlX2Rpc3RhbmNlX21hcCBpcw0KPiBOVU1BX05PX0RJU1RBTkNFDQo+ID4+ICovDQo+ID4+PiAr
ICAgICAgICBpZiAoIG9wcG9zaXRlID09IE5VTUFfTk9fRElTVEFOQ0UgKQ0KPiA+Pg0KPiA+PiBB
bmQgdGhlIG1hdHJpeCB5b3UncmUgcmVhZGluZyBmcm9tIGNhbid0IGhvbGQgTlVNQV9OT19ESVNU
QU5DRQ0KPiBlbnRyaWVzPw0KPiA+PiBJIGFzayBiZWNhdXNlIHlvdSBkb24ndCBjaGVjayB0aGlz
IGFib3ZlOyB5b3Ugb25seSBjaGVjayBhZ2FpbnN0DQo+ID4+IE5VTUFfTE9DQUxfRElTVEFOQ0Uu
DQo+ID4NCj4gPiBNeSB1bmRlcnN0YW5kaW5nIGZvciB0aGUgcHVycG9zZSBvZiB0aGlzIHBhcnQg
b2YgY29kZSBpcyB0byBjaGVjayBpZiB0aGUNCj4gb3Bwb3NpdGUNCj4gPiB3YXkgZGlzdGFuY2Ug
aGFzIGFscmVhZHkgYmVlbiBzZXQsIHNvIHdlIG5lZWQgdG8gY29tcGFyZSB0aGUgb3Bwb3NpdGUN
Cj4gd2F5DQo+ID4gZGlzdGFuY2Ugd2l0aCB0aGUgZGVmYXVsdCB2YWx1ZSBOVU1BX05PX0RJU1RB
TkNFIGhlcmUuDQo+ID4NCj4gPiBCYWNrIHRvIHlvdXIgcXVlc3Rpb24sIEkgY2FuIHNlZSB5b3Vy
IHBvaW50IG9mIHRoZSBxdWVzdGlvbi4gSG93ZXZlciBJIGRvbid0DQo+IHRoaW5rDQo+ID4gTlVN
QV9OT19ESVNUQU5DRSBpcyBhIHZhbGlkIHZhbHVlIHRvIGRlc2NyaWJlIHRoZSBub2RlIGRpc3Rh
bmNlIGluIHRoZQ0KPiBkZXZpY2UNCj4gPiB0cmVlLiBUaGlzIGlzIGJlY2F1c2UgSSBodW50ZWQg
ZG93biB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYW5kIGZvdW5kIFsyXQ0KPiBhYm91dA0KPiA+
IHdlIHNob3VsZCB0cnkgdG8ga2VlcCBjb25zaXN0ZW50IGJldHdlZW4gdGhlIHZhbHVlIHVzZWQg
aW4gZGV2aWNlIHRyZWUgYW5kDQo+IEFDUEkNCj4gPiB0YWJsZXMuIEZyb20gdGhlIEFDUEkgc3Bl
YywgMHhGRiwgaS5lLiBOVU1BX05PX0RJU1RBTkNFIG1lYW5zDQo+IHVucmVhY2hhYmxlLg0KPiA+
IEkgdGhpbmsgdGhpcyBpcyBhbHNvIHRoZSByZWFzb24gd2h5IE5VTUFfTk9fRElTVEFOQ0UgY2Fu
IGJlIHVzZWQgYXMgdGhlDQo+IGRlZmF1bHQNCj4gPiB2YWx1ZSBvZiB0aGUgZGlzdGFuY2UgbWFw
LCBvdGhlcndpc2Ugd2Ugd29uJ3QgaGF2ZSBhbnkgdmFsdWUgdG8gdXNlLg0KPiANCj4gVGhlIFsy
XSBsaW5rIHlvdSBwcm92aWRlZCBkaXNjdXNzZXMgTlVNQV9MT0NBTF9ESVNUQU5DRS4NCg0KSSBp
bmZlcnJlZCB0aGUgZGlzY3Vzc2lvbiBhcyAid2Ugc2hvdWxkIHRyeSB0byBrZWVwIGNvbnNpc3Rl
bnQgYmV0d2VlbiB0aGUgdmFsdWUNCnVzZWQgaW4gZGV2aWNlIHRyZWUgYW5kIEFDUEkgdGFibGVz
Ii4gTWF5YmUgbXkgaW5mZXJlbmNlIGlzIHdyb25nLg0KDQo+IExvb2tpbmcgYXQNCj4gTGludXgn
ZXMgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL251bWEudHh0LCB0aGVyZSdzIG5vIG1lbnRpb24g
b2YgYW4NCj4gdXBwZXIgYm91bmQgb24gdGhlIGRpc3RhbmNlIHZhbHVlcy4gSXQgb25seSBzYXlz
IHRoYXQgb24gdGhlIGRpYWdvbmFsDQo+IGVudHJpZXMgc2hvdWxkIGJlIDEwIChpLmUuIG1hdGNo
aW5nIEFDUEksIHdpdGhvdXQgcmVhbGx5IHNheWluZyBzbykuDQoNCkkgYWdyZWUgdGhhdCB0aGUg
TlVNQSBkZXZpY2UgdHJlZSBiaW5kaW5nIGlzIGEgbGl0dGxlIGJpdCB2YWd1ZS4gU28gSSBjYW5u
b3QNCnNheSB0aGUgY2FzZSB0aGF0IHlvdSBwcm92aWRlZCBpcyBub3QgdmFsaWQuIEkgd291bGQg
bGlrZSB0byBhc2sgQXJtIG1haW50YWluZXJzDQoocHV0dGluZyB0aGVtIGludG8gVG86KSBvcGlu
aW9uIG9uIHRoaXMgYXMgSSB0aGluayBJIGFtIG5vdCB0aGUgb25lIHRvIGRlY2lkZSB0aGUNCmV4
cGVjdGVkIGJlaGF2aW9yIG9uIEFybS4NCg0KQmVydHJhbmQvSnVsaWVuL1N0ZWZhbm86IFdvdWxk
IHlvdSBwbGVhc2Uga2luZGx5IHNoYXJlIHlvdXIgb3BpbmlvbiBvbiB3aGljaA0KdmFsdWUgc2hv
dWxkIGJlIHVzZWQgYXMgdGhlIGRlZmF1bHQgdmFsdWUgb2YgdGhlIG5vZGUgZGlzdGFuY2UgbWFw
PyBEbyB5b3UNCnRoaW5rIHJldXNpbmcgdGhlICJ1bnJlYWNoYWJsZSIgZGlzdGFuY2UsIGkuZS4g
MHhGRiwgYXMgdGhlIGRlZmF1bHQgbm9kZSBkaXN0YW5jZQ0KaXMgYWNjZXB0YWJsZSBoZXJlPyBU
aGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

