Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A57B54E4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 16:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611590.951095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJuS-0002yv-5v; Mon, 02 Oct 2023 14:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611590.951095; Mon, 02 Oct 2023 14:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnJuS-0002vb-30; Mon, 02 Oct 2023 14:28:32 +0000
Received: by outflank-mailman (input) for mailman id 611590;
 Mon, 02 Oct 2023 14:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4SN=FQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qnJuP-0002vF-Vz
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 14:28:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c7186b-612f-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 16:28:27 +0200 (CEST)
Received: from AM6P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::37)
 by GV2PR08MB8486.eurprd08.prod.outlook.com (2603:10a6:150:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 14:28:21 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::d4) by AM6P195CA0024.outlook.office365.com
 (2603:10a6:209:81::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Mon, 2 Oct 2023 14:28:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.20 via Frontend Transport; Mon, 2 Oct 2023 14:28:20 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Mon, 02 Oct 2023 14:28:20 +0000
Received: from e19e14142179.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62886CDA-B63B-41C8-8534-1D85ED823F69.1; 
 Mon, 02 Oct 2023 14:28:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e19e14142179.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Oct 2023 14:28:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB5906.eurprd08.prod.outlook.com (2603:10a6:20b:285::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Mon, 2 Oct
 2023 14:28:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 14:28:04 +0000
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
X-Inumbo-ID: f1c7186b-612f-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZvVHCnGwfnju72DCKji/LHCa5GX+jiSNB4VYsCrE+c=;
 b=BfaWdYcH/4RXFMYByQZQrfA2zEGFF2NAS6m13qXij/VQdapRjh3+mhr6gtWDIVZ4+EN5JL4uqio8XWBsUxXSB9F/52WRM69G3V1x9JDeR6FT6GfbRPl3humWxA2Kmd+mtuhh4CXNch/6lDAa3Mo5b6O+swBU/wLsRpzUire67CE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69a0c6b328d11ebb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqHLt5b4aYjHH687KXerWly8XT6JZLa70t9wvLhQFt/JqVX0yzoMuwbizh9MLQhTw4kRR4ga1vPFGktdb/g399745vZ5cwgyP+sxknKolW//12XITDmeI0FWrj2O0niSMyCEDMnd9RkrkGoZwB0CZhjgc4f78x90lem+2z6GeQNBX4DEq6kkGhuXWLxwPbY6qrC/XkmNKEjU7R4GTp3AO+F3JaoL9nyI1qriJuXJiVMkzW+p5F96yGuPbGgh0fTUZ9LdHdJh5ZhyYsEgMEGym3gDZwdq7YSg9VWvRkMQuL9Qt66Wbv4sZee2ZGcuxzI99V9UJ70hVR2IpW06lvg9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZvVHCnGwfnju72DCKji/LHCa5GX+jiSNB4VYsCrE+c=;
 b=fi8I1nQRY5+lUeLwdFMWfDEM/DbafZWX0vaILGVOkKCKSbP9cSGIQrbQWawvDNEO+w7WWgJ+MBNLhv0BCrz+M+PoBqJiiJcAjXIxHJaSuQYmKpvN8NhW+5JxsKKJSp1Csm9XH7CpLGk6pT3hOhZfLB9n0rVa+H/vE34vsQn1LLaeJdvNMyPxWDorhROfXyxFKl+ccRHL9o3+iP+iz5pVDQLHm+rDJ11xKwSSnNyA6j6O1fKu1AAnktBhgUzJtmIRKPGuri0cgd2m7/RWM+IG1iaRh+vHJI3WJWv5mfH7btSulB8m8cTp4iD/T/EyPe3ELfyWpS+SFBj9BJacgZ60WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZvVHCnGwfnju72DCKji/LHCa5GX+jiSNB4VYsCrE+c=;
 b=BfaWdYcH/4RXFMYByQZQrfA2zEGFF2NAS6m13qXij/VQdapRjh3+mhr6gtWDIVZ4+EN5JL4uqio8XWBsUxXSB9F/52WRM69G3V1x9JDeR6FT6GfbRPl3humWxA2Kmd+mtuhh4CXNch/6lDAa3Mo5b6O+swBU/wLsRpzUire67CE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHZ8UtDYO4d/ZAlGU2swEp9/t1GiLAw9peAgABwXACAANJugIAD+GkAgABk4YA=
Date: Mon, 2 Oct 2023 14:28:04 +0000
Message-ID: <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
 <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
 <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org>
In-Reply-To: <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB5906:EE_|AM7EUR03FT025:EE_|GV2PR08MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a342b87-1720-4770-d86e-08dbc353d3d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xKEv+xXzV5GBnXBrnZQJpvr+4U63zGuByMl+2Zs/7HC9W0BJfFhcWwG2TZx7ZXNByeHFxegWkl7OR2H5D44d8Rss9ArubyvFl9D/UovDxaFfJLGDLPkxnG59mP76KLGMAkn1RyZTFKYusIlmyhm3yp2yP8IHEjdgSG0Sc/q4YQMJQeZDsFWyImVAA5pvjKqB2kJfseqGU54P3V9gaEUqklnhGimEJtoFlTSb2jnONt6xu4D5ZhWeLCq6+LClv63YsJN8y/y7Wx6chFXAkanS1i1jcKXHSBSaQxbT1XspM1VBo7I9bL+l/9kw+gNa9vW1MSVyLBDww+Qc/lHl527gIf5MxGHdna5rd98w7NVYt7aznsjGjunK+RvsJZXbmaiiwfDktxmtuyM5zAU46bO6u39QCsHz42Enn62ZLFCC6SkK7gjhwKdK185B3wOI8OO1vnwukORanjvBHu7/RGE6yppiz4BqSrzJ8W+R5i9IWt02Ng1QnEEzZGwbRi7wrMiXyCOUw9X9+yg8XRHyHiA5lcgbR9HLdDHOBK3UAyQ6hgJ0RDqOfnizoF0Vo+8ZV64O9dsKfXkzaLLQG0yRklAv6phoU4csf3alT1zfx1ok2WbhKeR+Vp4ETRZihRM/CJX34XS37sd8xKtHz9JIbs/YKSQh7jxUaSmEfj/CJWdp3sg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(53546011)(55236004)(8676002)(2906002)(8936002)(66446008)(4326008)(316002)(41300700001)(33656002)(5660300002)(36756003)(54906003)(76116006)(86362001)(91956017)(6512007)(6506007)(66946007)(71200400001)(38070700005)(2616005)(38100700002)(478600001)(83380400001)(64756008)(6916009)(26005)(122000001)(66476007)(66556008)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <26252C525C6F5947ADD3255BEDCBD0D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5906
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3cbb7bdc-ba27-4034-92fc-08dbc353ca49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evFhHzkO4m7SrWkWc5UWO9ed45X9sadvoHmEFOkkTM2JJC790VJRBamZkWWXtja97GY299SzGr1CvDXYPeFqTOfloGUhtJc9aOqc19vhbQsokCEVDsyDNlcEN1dwRMmLjuLSe71uZ0xhnjc4xStAG1pFR+432uwPD+NMNjyzS6qA5p5pUtMgk6ZzKTUZMXL4GXY6pVmTsNhuneiK4TeVotvWorDmI/SX0hEEohis6MaJBgoCxGBRmXsO1Xi1TkSHfSOK2V3WgdUHeWHK1tLJtCHsNrtetLL6tyuqF0b6rUIMPoYyElrzAc1SRHn+UnurAjVpIdMOSrr0+fIVwHNAzV/HQuI8E7oauLO8h5BzvyQ5bSW1iVTvjYI28ztqsTwREEj7J+vPxvcxCHkYCJ1vLmL3dguP3n9r6fDs8odd/PnXvJ3f0v78jncBRh5CnuD0DTXNqp8PeHeuUAUJsxTLfbnCJGw3jCLEB9Vz2W94aMsY/q6/7KWKQYzUOSaLHz68/VWVxvP7YnhJ6QLwR383U4qQpGwomfE6eCRs+d47w+vX731EIpKdo2uR2Hs53/RdxwBDUR8/4NvWZWvqj88tJdC5X5YLn5Na8T2g8n7+5Wo58bHQnNkxWEn2l+00isnrKiFh8FgUvcNkqzuHiTG7EvcG71uUbsYK9uA7AZVVpsROSroS8V0Yss390bsoG7AIm6jwGor5hPW/XWajBc9kkJyXT3MFBTHTAGAxVFA/IP997LJ8ZubRI4rSHI23U44z6mATRDlxzLsVBPvQByjYOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(8676002)(40460700003)(4326008)(36756003)(6862004)(33656002)(47076005)(2906002)(6512007)(107886003)(2616005)(53546011)(26005)(6506007)(6486002)(478600001)(336012)(81166007)(36860700001)(356005)(83380400001)(82740400003)(86362001)(40480700001)(8936002)(54906003)(70206006)(70586007)(316002)(5660300002)(41300700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 14:28:20.5788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a342b87-1720-4770-d86e-08dbc353d3d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8486

SGksDQoNCj4gT24gMiBPY3QgMjAyMywgYXQgMTA6MjYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgU3RlZmFubywNCj4gDQo+IE9uIDI5LzA5LzIwMjMgMjA6
NDgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIEZyaSwgMjkgU2VwIDIwMjMsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IE9uIDI5IFNlcCAyMDIzLCBhdCAwMTozMywgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+
IE9uIFdlZCwgMjcgU2VwIDIwMjMsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBDdXJyZW50
bHkgdGhlIGRvbTBsZXNzIGZlYXR1cmUgY29kZSBpcyBtb3N0bHkgaW5zaWRlIGRvbWFpbl9idWls
ZC5jDQo+Pj4+PiBhbmQgc2V0dXAuYywgaXQgaXMgYSBmZWF0dXJlIHRoYXQgbWF5IG5vdCBiZSB1
c2VmdWwgdG8gZXZlcnlvbmUgc28NCj4+Pj4+IHB1dCB0aGUgY29kZSBpbiBhIGRpZmZlcmVudCBj
b21waWxhdGlvbiBtb2R1bGUgaW4gb3JkZXIgdG8gbWFrZSBpdA0KPj4+Pj4gZWFzaWVyIHRvIGRp
c2FibGUgdGhlIGZlYXR1cmUgaW4gdGhlIGZ1dHVyZS4NCj4+Pj4+IA0KPj4+Pj4gTW92ZSBnaWNf
aW50ZXJydXB0X3QgaW4gZG9tYWluX2J1aWxkLmggdG8gdXNlIGl0IHdpdGggdGhlIGZ1bmN0aW9u
DQo+Pj4+PiBkZWNsYXJhdGlvbiwgbW92ZSBpdHMgY29tbWVudCBhYm92ZSB0aGUgZGVjbGFyYXRp
b24uDQo+Pj4+PiANCj4+Pj4+IFRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zIGFyZSBub3cgdmlzaWJs
ZSBleHRlcm5hbGx5IGZyb20gZG9tYWluX2J1aWxkDQo+Pj4+PiBiZWNhdXNlIHRoZXkgYXJlIHVz
ZWQgYWxzbyBmcm9tIHRoZSBkb20wbGVzcy1idWlsZCBtb2R1bGU6DQo+Pj4+PiAtIGdldF9hbGxv
Y2F0aW9uX3NpemUNCj4+Pj4+IC0gc2V0X2ludGVycnVwdA0KPj4+Pj4gLSBkb21haW5fZmR0X2Jl
Z2luX25vZGUNCj4+Pj4+IC0gbWFrZV9tZW1vcnlfbm9kZQ0KPj4+Pj4gLSBtYWtlX3Jlc3ZfbWVt
b3J5X25vZGUNCj4+Pj4+IC0gbWFrZV9oeXBlcnZpc29yX25vZGUNCj4+Pj4+IC0gbWFrZV9wc2Np
X25vZGUNCj4+Pj4+IC0gbWFrZV9jcHVzX25vZGUNCj4+Pj4+IC0gbWFrZV90aW1lcl9ub2RlDQo+
Pj4+PiAtIGhhbmRsZV9kZXZpY2VfaW50ZXJydXB0cw0KPj4+Pj4gLSBjb25zdHJ1Y3RfZG9tYWlu
DQo+Pj4+PiAtIHByb2Nlc3Nfc2htDQo+Pj4+PiANCj4+Pj4+IFRoZSBmdW5jdGlvbnMgYWxsb2Nh
dGVfc3RhdGljX21lbW9yeSBhbmQgYXNzaWduX3N0YXRpY19tZW1vcnlfMTENCj4+Pj4+IGFyZSBu
b3cgZXh0ZXJuYWxseSB2aXNpYmxlLCBzbyBwdXQgdGhlaXIgZGVjbGFyYXRpb25zIGludG8NCj4+
Pj4+IGRvbWFpbl9idWlsZC5oIGFuZCBtb3ZlIHRoZSAjZWxzZSBhbmQgc3R1YiBkZWZpbml0aW9u
IGluIHRoZSBoZWFkZXINCj4+Pj4+IGFzIHdlbGwuDQo+Pj4+PiANCj4+Pj4+IE1vdmUgaXNfZG9t
MGxlc3NfbW9kZSBmcm9tIHNldHVwLmMgdG8gZG9tMGxlc3MtYnVpbGQuYyBhbmQgbWFrZSBpdA0K
Pj4+Pj4gZXh0ZXJuYWxseSB2aXNpYmxlLg0KPj4+Pj4gDQo+Pj4+PiBXaGVyZSBzcG90dGVkLCBm
aXggY29kZSBzdHlsZSBpc3N1ZXMuDQo+Pj4+PiANCj4+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGlzIGludGVuZGVkLg0KPj4+Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4+IA0KPj4+PiBUaGlzIGlzIGdyZWF0ISBBIGNv
dXBsZSBvZiBxdWVzdGlvbnMuDQo+Pj4+IA0KPj4+PiBXaHkgd2FzIGFsbG9jYXRlX3N0YXRpY19t
ZW1vcnkgbm90IG1vdmVkIHRvIGRvbTBsZXNzLWJ1aWxkLmMgPw0KPj4+IA0KPj4+IE15IGFpbSBp
cyB0byBkZWNvdXBsZSB0aGUgZmVhdHVyZXMsIHNvIGluIHBhdGNoIDQgd2UgbW92ZSAoanVzdCBv
bmNlIGFzIEp1bGllbiBzdWdnZXN0ZWQpDQo+Pj4gdGhlIHN0YXRpYyBtZW1vcnkgY29kZSBvbiBh
IG1vZHVsZSBvbiBpdHMgb3duLCBiZWNhdXNlIHdlIGNhbiBoYXZlIGEgZ3Vlc3QgYm9vdGVkIHdp
dGgNCj4+PiBkb20wbGVzcyBmZWF0dXJlIGJ1dCBoYXZpbmcgaXQgd2l0aCBzdGF0aWMgbWVtb3J5
IGlzIG9wdGlvbmFsLg0KPj4gT0sNCj4+Pj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBhbHNvIG1v
dmUgY29uc3RydWN0X2RvbTAgdG8gZG9tMGxlc3MtYnVpbGQuYw0KPj4+PiBnaXZlbiB0aGUgc2lt
aWxhcml0aWVzIHdpdGggY29uc3RydWN0X2RvbVU/IEkgYW0gbm90IHN1cmUgYWJvdXQgdGhpcy4N
Cj4+Pj4gDQo+Pj4gDQo+Pj4gV2UgY2Fu4oCZdCBkbyB0aGF0IGJlY2F1c2UgdGhlIGZpbmFsIGdv
YWwgb2YgdGhpcyBzZXJpZSBpcyB0byBoYXZlIGEgS2NvbmZpZyBkaXNhYmxpbmcgZG9tMGxlc3Ms
DQo+Pj4gc28gaW4gdGhhdCBjYXNlIHdlIHdpbGwgZW5kIHVwIHJlbW92aW5nIGZyb20gdGhlIGNv
bXBpbGF0aW9uIGFsc28gY29uc3RydWN0X2RvbTAuDQo+PiBPSy4gUHJvYmFibHkgd2UgY2FuJ3Qg
ZG8gbXVjaCBiZXR0ZXIgdGhhbiB0aGlzLg0KPj4gT25lIG1vcmUgcXVlc3Rpb24gb24gdGhlIGNv
ZGUgbW92ZW1lbnQsIGFuZCBJIHdvdWxkIGFsc28gbGlrZSBKdWxpZW4gYW5kDQo+PiBCZXJ0cmFu
ZCB0byBleHByZXNzIHRoZWlyIG9waW5pb25zIG9uIHRoaXMuDQo+PiBHaXZlbiB0aGF0IGNvZGUg
bW92ZW1lbnQgaXMgcGFpbmZ1bCBmcm9tIGEgZ2l0IGhpc3RvcnkgcGVyc3BlY3RpdmUsIGFuZA0K
Pj4gZ2l2ZW4gdGhhdCB3ZSBoYXZlIHRvIG1vdmUgZG9tMGxlc3MgY29kZSB0byB4ZW4vY29tbW9u
IGFueXdheSB0byBtYWtlDQo+PiBpdCBhdmFpbGFibGUgdG8gUklTQy1WIGFuZCBhbHNvIHg4Niwg
Y291bGQgd2UgZG8gaXQgaW4gb25lIHNob3QgaGVyZT8NCj4gDQo+IExvb2tpbmcgYXQgdGhlIG5h
bWUgb2YgdGhlIGZ1bmN0aW9ucywgSSB3b3VsZCBleHBlY3QgdGhhdCB3ZSB3b3VsZCBuZWVkIGFu
b3RoZXIgY29kZSBtb3ZlbWVudCBpbiB0aGUgZnV0dXJlIHRvIG1vdmUgYmFjayBBcm0gc3BlY2lm
aWMgZnVuY3Rpb24gdW5kZXIgYXJjaC9hcm0vLiBTbyB3ZSB3b3VsZCBlbmQgdXAgd2l0aCB0d28g
Y29kZSBtb3ZlbWVudCBhcyB3ZWxsLg0KPiANCj4gSSB3b3VsZCBwcmVmZXIgaWYgd2Ugd2FpdCB1
bnRpbCBSSVNDLVYveDg2IG5lZWRzIGl0IHNvIHdlIGRvbid0IHVubmVjZXNzYXJpbHkgbW92ZSBB
cm0gc3BlY2lmaWMgY29kZSBpbiBjb21tb24vLg0KDQpJIGFncmVlIHdpdGggSnVsaWVuIGhlcmUu
DQpNb3ZpbmcgdGhlIGNvZGUgbm93IHdpbGwgbWVhbiBtb3ZpbmcgcGFydCBvZiBpdCBiYWNrIGlu
IGFybSBpbiB0aGUgZnV0dXJlIG9uY2Ugd2UgaGF2ZSBhIHNlY29uZCB1c2VyIG9mIHRoaXMuDQpJ
IHdvdWxkIHJhdGhlciB3YWl0IGZvciB0aGUgbmVlZCB0byBjb21lIHNvIHRoYXQgd2UgZG8gdGhp
cyBjbGVhbmx5Lg0KDQpBbHNvIHVzaW5nIGh5cGVybGF1bmNoIG5hbWUgbm93IHdvdWxkIGJlIHdl
aXJkIGFzIHRoZXJlIHdhcyBubyBhZ3JlZW1lbnQgb24gdGhlIG5hbWluZyAoYXMgZmFyIGFzIEkg
a25vdykgc28gZmFyLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQo=

