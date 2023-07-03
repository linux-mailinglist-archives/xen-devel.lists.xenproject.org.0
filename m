Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32E74571B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 10:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558031.871799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGEjA-0005tZ-HP; Mon, 03 Jul 2023 08:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558031.871799; Mon, 03 Jul 2023 08:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGEjA-0005r4-Dh; Mon, 03 Jul 2023 08:16:08 +0000
Received: by outflank-mailman (input) for mailman id 558031;
 Mon, 03 Jul 2023 08:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H7X=CV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qGEj8-0005qw-TK
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 08:16:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da408494-1979-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 10:16:04 +0200 (CEST)
Received: from AS9PR05CA0245.eurprd05.prod.outlook.com (2603:10a6:20b:493::22)
 by PAVPR08MB8941.eurprd08.prod.outlook.com (2603:10a6:102:328::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 08:16:00 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:493:cafe::b1) by AS9PR05CA0245.outlook.office365.com
 (2603:10a6:20b:493::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 08:15:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 08:15:59 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Mon, 03 Jul 2023 08:15:58 +0000
Received: from 7315607ad8e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8863286A-F5D9-49AE-8CDD-1C1AF73EC2BC.1; 
 Mon, 03 Jul 2023 08:15:52 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7315607ad8e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Jul 2023 08:15:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 08:15:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 08:15:48 +0000
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
X-Inumbo-ID: da408494-1979-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQGw7rf6uFTnPj1oTS9nWq0sXkAP5wIfN0+eV5YWRJc=;
 b=m91PnriyNBTQiPg1sDRsBh4A3Iza0uyfo076aq6HcniInd6X1J+lr4q8V3NVsWzO1U8Txq5brEEwDgQ7F9r4gAGCypXyJMx48Uba7AO+ioCT4jdWinuWPMODgYB6De0Gmc1GPOZ7N1ynTVoNX16EYXr3ty++GIjUPcaZtjf1e2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dee57a5134de968
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHkog/xOZi7+D7XW0uFg3V0ooJvBWVY+hW+reHS6t5O0Q3BaxLvVNB3i0ZUNn8TLnkIae4HGFXIcS14AtYxgnvaOa7819sD88jPlvYYPMhs+JS9q7mhBiwTFNWN3n4Kvxa7JFp0lZZx9rqQ4h+i1GW11y0qWUq5Hbeq+FkDusifQeiqdMVfq28RkZL4/JkIY/127wwQu72s/4yXS5PvMju3ovle0dIweDQ/dT+s3Udjwz2/U1O6PO0a+RH3K1JSQP2AuA/uaKkUU5sBU6m/VsNPLBWZ2xcoa1b7cKmOY/Qr5lUae+EckQnV9K23WTdrePGnT8PGPcYoUtoneH6Te5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQGw7rf6uFTnPj1oTS9nWq0sXkAP5wIfN0+eV5YWRJc=;
 b=QKft5aUhpq3NuO6DIZBv8UjEBqOPjdmYCxk0n1LZUfmmtaz+xQVEV6X6i02z2LYlHNQUNq6PWzluItPKJEy107zXNE5/bRxQuwK5kZdQAVVcBizO9J+TDFPG+gHt/R0BLvMSd46jjoXxLq2PVv4uK3k7N9WsqEo1+JaEod1u7wRfLufQSuSh66nGit2MNanmoIuy3j6/TLJs8uINnjfTlpT+XsLREjWNP+UltAthmlmF1HOAF86Dg+H5dHn5WD5yh0Is9kTg99i0HnLWPlAilWPPkyuADclZo3aMTIo23FX+h/2791eFIQHE9IcyK0Q9X8VFnrgGLMqj8jrVSjLu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQGw7rf6uFTnPj1oTS9nWq0sXkAP5wIfN0+eV5YWRJc=;
 b=m91PnriyNBTQiPg1sDRsBh4A3Iza0uyfo076aq6HcniInd6X1J+lr4q8V3NVsWzO1U8Txq5brEEwDgQ7F9r4gAGCypXyJMx48Uba7AO+ioCT4jdWinuWPMODgYB6De0Gmc1GPOZ7N1ynTVoNX16EYXr3ty++GIjUPcaZtjf1e2s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Rich Persaud <persaur@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Daniel DeGraaf <dgdegra@tycho.nsa.gov>,
	"openxt@googlegroups.com" <openxt@googlegroups.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index: AQHZqzMUKP6yBnvUfEC1egkdxmuozK+koJSAgAMWHYA=
Date: Mon, 3 Jul 2023 08:15:48 +0000
Message-ID: <BA3F1695-F893-46A9-9159-F0A98EAC05D8@arm.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
 <B954806C-5D31-483C-964B-17F1EFDB20BD@gmail.com>
In-Reply-To: <B954806C-5D31-483C-964B-17F1EFDB20BD@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB5981:EE_|AM7EUR03FT022:EE_|PAVPR08MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 4684282c-3199-49ce-5d76-08db7b9dbbaa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0rHn1lfTxPV8DQCttSSAGBrzz68luYyOJRi5GDNsWDZfyWJIEbeTEuJzsfx5iJCeN6lQWku3lSk+kkaV5L1wZPYGKlyUOLb+BI1WJCxFYEh0ZbCXI6ArLp01g7bZ5XUj9v7IpW3he7LxqGnXSYsfax2o8g221rphG1q/HWi3U4pat5dAY+WBUTRpvDYlsPTVSukoZPXQA/eP3mQiNyybvuKz5IFetMElkisdpLVOZWhg+6o0ksmVhZhMWAe2a/fUUYB+KiXECtEYNeJMnYqbN9dUPRkgW4/oO43KtaxYomGM+CCsKFt38eT+L15R4jZmm44n8ufU+mjPn+fwUwbwd727R8L1+Xgavq8JWSXejspwqbD4ZBmQi+bKU06dsQGgzHDNkQW8pho/jbskoiDvZlCd8AevnvovL+HwLuPCU+ceLPcU5yeynWy3bmQu/m4gWI4K2gI93iDAqS35crltFhVA3Ej+hjB2/PBxC4fxexg8/i5tMNrLeSbycVVKVmIzsJtsznoTcydMz1AixnBqHy+fjMb9LfPT9O5yXvuO4EryT/bMkwnij7lweDmaz9Y32ER4HMOAwDwA146nj8xeuZzkI8MFtXO99S7MUJPMM22PTQetg0fyTntgXMGaXHzak+tonpZnmekAaQqGfI90beErOE5F4FLa1mNJoi21wMg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(6512007)(91956017)(6506007)(53546011)(316002)(66556008)(38070700005)(76116006)(66476007)(66446008)(64756008)(6916009)(66946007)(4326008)(38100700002)(122000001)(2616005)(83380400001)(186003)(26005)(478600001)(54906003)(8936002)(8676002)(2906002)(5660300002)(966005)(6486002)(71200400001)(7416002)(86362001)(41300700001)(36756003)(33656002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7537DE30C3B784EB1F8653824ED0E75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a329b11b-64cf-4ea1-2c7b-08db7b9db519
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zQVZ4kCwcUCUTDoGX/po7b7qYe4VKWey/yQ1C1IiSGfOQuyRbTjVnkaMsf8ZqU+j5lA4sPvP60SWnSbCYlLUoFAXMH+WPe2oQkG4ow0mQSKsZ6XjkfIVF4f/iQOb2rTMADSms42vLktclBXQtxlqkyWGDDxoY5cnzPa94jOm3kzJ5s0q2vxpdYfMkjDG5s6cWkXlFFTGwhbbWk0S92qUTOGhrUEqAstWAhnL3jifsRs+blNVy3lSjfRiVUPRRml10UF6NaQfKvlYNx3NpgzsZJvggd6Ms2V/fWJWUAnrWqmruOLDBo0WfVbuswWiUru7yoHr4JrR4R2nxdE3J187Ppyqon3MrGLOwUHOcdQDbcBEQ+NODeyPqrdhQZIY3vD/xHaeW693KnatTGwUqMlTsziAkOHtB3hfzrW3G1YzonKjVS2FBskPdRD3yZQeYOkC8MI+GFXQQcFd2vUVJdNfuRQE5lAj2lWHXIPnOvlsyGLiTbMimZ/ajD+Ynn+WWq/u4saE3jiNh8mIOLMU8VK6+LtfYTjrLYLNTWC9cvTYVyhz0Rs7b7b6dxSyPcpslL/i+DXvmb7YpOErZiFhP5dirgxKttHNeADk6RYooVO6RCtP66f3zy1j2ryzDPjB4DBhuQ8WiYn5LL9xA3N7NTN5ecgEaLzamnNw4mPOs0L6rKkQ2p47YO8k7e2yVXE+njc1sgRVtUNM2GKM4p/gmBf0JbLLqRqS0DN5r8uT4cCpVNHf7x5RGuCZ5kke/FHzWjq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(6862004)(26005)(6512007)(966005)(53546011)(186003)(33656002)(8936002)(36756003)(86362001)(8676002)(2906002)(6486002)(5660300002)(41300700001)(40460700003)(478600001)(107886003)(6506007)(81166007)(40480700001)(70586007)(356005)(82740400003)(4326008)(70206006)(47076005)(2616005)(336012)(82310400005)(83380400001)(316002)(36860700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 08:15:59.1018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4684282c-3199-49ce-5d76-08db7b9dbbaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8941

DQoNCj4gT24gMSBKdWwgMjAyMywgYXQgMTA6MDcsIFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIEp1biAzMCwgMjAyMywgYXQg
MDU6MTIsIEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IA0KPj4gDQo+PiDvu79UaGUgImRvbTBsZXNzIiBmZWF0dXJlIHdhcyBpbnRlbmRlZCB0byBi
ZSB0aGUgZmVhdHVyZSB3aGVyZSBhIGRvbVUNCj4+IGRvbWFpbiBjb3VsZCBiZSBsYXVuY2hlZCB3
aXRob3V0IHRoZSBjb250cm9sIGRvbWFpbiAoRG9tMCkNCj4+IGludGVydmVudGlvbiwgaG93ZXZl
ciB0aGUgbmFtZSBzZWVtcyB0byBzdWdnZXN0IHRoYXQgRG9tMCBjYW5ub3QNCj4+IGJlIHBhcnQg
b2YgdGhlIGNvbmZpZ3VyYXRpb24sIHdoaWxlIGluc3RlYWQgaXQncyBhIHBvc3NpYmxlIHVzZSBj
YXNlLg0KDQpIaSBSaWNoLA0KDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgaW50ZXJlc3QgaW4gWGVu
IGJvb3QgaW50ZWdyaXR5LiBQbGVhc2Ugc2VlIHRoZSAyMDE4IGRvbUIgUkZDOg0KPiBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDYvbXNn
MDEzMDYuaHRtbA0KPiANCj4gQXQgWGVuIFN1bW1pdCAyMDE4IChOYW5qaW5nKSBhbmQgWGVuIFN1
bW1pdCAyMDE5IChDaGljYWdvKSwgT3BlblhUIGNvbnRyaWJ1dG9ycyBtYWRlIGEgY2FzZSB0byBY
ZW4tb24tQXJtIGNvbnRyaWJ1dG9ycyBmb3IgdGhlIGFyY2hpdGVjdHVyYWwgdW5pZmljYXRpb24g
b2YgaW5jdW1iZW50IGRvbTBsZXNzIChBcm0pIGFuZCB0aGUgZG9tQiAoeDg2KSBwcm9wb3NhbCBm
b3IgaW1wcm92aW5nIFhlbiBib290IGludGVncml0eS4NCj4gDQo+PiBUbyBhdm9pZCB0aGF0LCBy
ZW5hbWUgdGhlICJkb20wbGVzcyIgY29uZmlndXJhdGlvbiB3aXRoIHRoZSBuYW1lDQo+PiAiaHlw
ZXJsYXVuY2giLCB0aGF0IGlzIGxlc3MgbWlzbGVhZGluZy4NCj4gDQo+IDIwMTgtMjAyMiB3b3Jr
IG9uIFhlbiBsYXVuY2ggaW50ZWdyaXR5LCB0aGFua3MgdG8gQXBlcnR1cyBhbmQgU3RhciBMYWI6
IA0KPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9IeXBlcmxhdW5jaA0KPiBodHRw
czovL3d3dy50aGVyZWdpc3Rlci5jb20vMjAyMi8xMi8xNi94ZW5fNF8xN19oeXBlcmxhdW5jaC8N
Cj4gDQo+IDIwMjMgSHlwZXJsYXVuY2ggZGVzaWduIHNlc3Npb24gbGFzdCB3ZWVrLCB0aGFua3Mg
dG8gQXBlcnR1cyBhbmQgQU1EOg0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjMtMDYvbXNnMDE4NzAuaHRtbA0KDQpUaGFuayB5b3UgZm9y
IHBvaW50aW5nIG91dCB0aGUgaGlzdG9yeSBvZiB0aGlzIGh1Z2Ugd29yaywgaXQgaXMgdmVyeSBp
bnRlcmVzdGluZw0KDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5m
YW5jZWxsdUBhcm0uY29tPg0KPiANCj4gSWYgQXJtIGlzIG5vdyByZWFkeSB0byBpbnZlc3QgZW5n
aW5lZXJpbmcgcmVzb3VyY2VzIGludG8gbmV3IFhlbiBsYXVuY2ggaW50ZWdyaXR5IGZlYXR1cmVz
IGZvciBzZWN1cml0eSBhbmQgc2FmZXR5LWNyaXRpY2FsIHVzZSBjYXNlcywgdGhhdCBpcyBleGNp
dGluZyBuZXdzLCA1IHllYXJzIGludG8gdGhlIG9uLWFnYWluLW9mZi1hZ2FpbiBib290c3RyYXBw
ZWQgSHlwZXJsYXVuY2ggcHJvamVjdCEgVGhlIHJvYWRtYXAgd291bGQgYmVuZWZpdCBmcm9tIG5l
dyBmdW5kaW5nLg0KDQpJ4oCZbSBhZnJhaWQgdGhhdCB0aGlzIHBhdGNoIGlzIG5vdCBhIGNvbW1p
dG1lbnQgZnJvbSBBcm0gaW50byB0aGF0LCB0aGF0IGdvZXMgYWJvdmUgbXkgbGV2ZWwgSeKAmW0g
YWZyYWlkLCBidXQgYXMgcGFydCBvZiBvdXIgY29tbXVuaXR5IHdvcmsgd2UgbG9vayBjbG9zZWx5
IHRvIHRoYXQgYW5kIEnigJltIHBlcnNvbmFsbHkgaW50ZXJlc3RlZCBvbiB0aGUgcGF0aA0KdGFr
ZW4gYnkgdGhpcyBwcm9qZWN0Lg0KDQo+IA0KPiBXb3VsZCB5b3UgbGlrZSB0byBhdHRlbmQgdGhl
IG5leHQgWGVuIHdvcmtpbmcgZ3JvdXAgY2FsbCBmb3IgSHlwZXJsYXVuY2g/DQoNCkkgdGhpbmsg
QmVydHJhbmQgaXMgYWxyZWFkeSBpbnZvbHZlZCBpbnRvIGl0LCBldmVuIGlmIHVuZm9ydHVuYXRl
bHkgc29tZSBoaWdoIHByaW9yaXR5IHdvcmsgc29tZSB0aW1lcyB0YWtlIHByZWNlZGVuY2UuDQoN
Ck9uIG15IHNpZGUgSSBmb2xsb3cgdGhlIHdvcmsgb24gdGhlIE1MLCBzcGVjaWZpY2FsbHkgdGhl
IG9uZSByZWxhdGVkIHRvIHRoZSBBcm0gc2lkZS4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo+IA0KPiBS
aWNoDQoNCg0K

