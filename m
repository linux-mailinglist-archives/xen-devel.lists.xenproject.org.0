Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F4710966
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539502.840450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27n3-0004AV-Ny; Thu, 25 May 2023 10:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539502.840450; Thu, 25 May 2023 10:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27n3-00047m-L0; Thu, 25 May 2023 10:01:49 +0000
Received: by outflank-mailman (input) for mailman id 539502;
 Thu, 25 May 2023 10:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q27n1-000474-R4
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:01:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27bf86ec-fae3-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 12:01:45 +0200 (CEST)
Received: from AM6P192CA0104.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::45)
 by DU0PR08MB9201.eurprd08.prod.outlook.com (2603:10a6:10:415::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 10:01:39 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::66) by AM6P192CA0104.outlook.office365.com
 (2603:10a6:209:8d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 10:01:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 10:01:38 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 25 May 2023 10:01:37 +0000
Received: from 05b95d110bc8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 383CD494-7500-4087-B566-D27A0966BF93.1; 
 Thu, 25 May 2023 10:01:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05b95d110bc8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 10:01:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9533.eurprd08.prod.outlook.com (2603:10a6:10:44f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 10:01:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 10:01:22 +0000
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
X-Inumbo-ID: 27bf86ec-fae3-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBMy0hH57+9uBRGM1IIQjFWLs8eB6UAgJ0AIWOyiAAU=;
 b=HWvzGXW0EPrJa0bVjXLpxNFr/On9jB0NPs339JE4V5vZsmrNE8ZI696DzqyyI9bbXriMWwffCBL2NBdK+mvUu/Oyb5AqMfZtlrwVpBiUU4bmQkwwaJgflHEby7CQxLfGUT2zLOl7E78lTiCgqzcoLNobVH3BWl6vpRkoUwCnb+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 399fe5bfda899e67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7rB4KVwDBoxB49d7PqmXP6PYmj3AcFz0naZx6HVYcRQ2i08zAGd0j4+DzoIBIn/YCMH9w4qAfu0K3XJtMZ+x9dW4Dh5VfEcFIuGXKjHU6aL8a1tvol3oLxOdUJ1IxfCEy10KrEtM3UvxHPxMrZeYfKYpI02EWE8rVmJXHdpCBbVI9GYhsnluczJWzwX2EncXCE6grhJa+IdpfUhzvaJt3+SqVmQczhsCKNz1RyPC0YsACuhpO5NsGxpt9TkW9JViEVNmHqjB8kYwGwTVhR5Whur1HH5azKGQgmUHpOkn47E0LEWsV95zilajQdFbOI4QjKoBluy7GPKnbRgPPoG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBMy0hH57+9uBRGM1IIQjFWLs8eB6UAgJ0AIWOyiAAU=;
 b=iT40OFKaxeCL4EVXyX6ELt8gXiKMJwOyJMhCZzCLjp0RznaBfXf6MsIka6U3Of5HzuCyRtoMTtiAJWO/Nx65YsO+AUlw3V56/CVrTqegDHeKK/1cbwowDGK9p/VEIbj+TI1xjKv4rZZFUo/V8AGet+uPIR1iA520b806Kx4mgM0WZ7B03+FMA5LMPkrdx0xn5j9Pz21621tLOs3ykuKfzQFNaClx/Il35XSmucJo8A7PirV7SuGBRXWZgOF5ZlUuc2NhJIfoBNnMkdmzCo0Oi48c9cnCZgQlUPS4aOeFTaZbv5u33Hfvlo8+b/Jih6x2UPJlYPvVxs3H6OHkqq8jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBMy0hH57+9uBRGM1IIQjFWLs8eB6UAgJ0AIWOyiAAU=;
 b=HWvzGXW0EPrJa0bVjXLpxNFr/On9jB0NPs339JE4V5vZsmrNE8ZI696DzqyyI9bbXriMWwffCBL2NBdK+mvUu/Oyb5AqMfZtlrwVpBiUU4bmQkwwaJgflHEby7CQxLfGUT2zLOl7E78lTiCgqzcoLNobVH3BWl6vpRkoUwCnb+o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZjUpkSkVWSiVT2k+ILuaW20r/+q9qrj4AgAAKbYCAAAFlAIAACwWA
Date: Thu, 25 May 2023 10:01:22 +0000
Message-ID: <625F8843-47F5-4E60-8849-637DFFBA2AE7@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-10-luca.fancellu@arm.com> <ZG8evxN0mF8NDTPS@mail-itl>
 <2BCDFCFC-30F0-4D61-AE92-65046CDD5696@arm.com>
 <1D2A4448-D89C-458B-A2EB-C0368E6534C1@arm.com>
In-Reply-To: <1D2A4448-D89C-458B-A2EB-C0368E6534C1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9533:EE_|AM7EUR03FT033:EE_|DU0PR08MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: a82e4857-1372-44b9-68e5-08db5d0707dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 31/1z+LOj3ekbDINeJvlS8MbbkGMU2+kI5xqRDIu64dxNBzDG1MRrJbP+NLwPQ/JiAo6UpM0qHpD9uVTvsAmWzQEIcPMBuopaOz4EEe/UPdS7IAgzcCFouJLS/V1xJt9K/m4qq2fNYwXFVZ5mo9HlSTGVATny4Dp/jUqwOLCBDHBo8tYnzmASLr7LXEGwPSzziKI7XYy2QSTr2W7pJ/vUvGa8I3687G5HDLQfQThnYbuiP44cQVlGcB6GIeFzIt12xOBsRo9SZ4blN4p0psgMm550+pFo1+fFeCXSqtCpwZux8HS1V2Qyd7ExLINXNArspnbTSYg0zPCumo1NDGfpQaclCxEZfjPDHOuB9f53veKBCVHC9H8XPJe+LYCXNefQFBWvJUEUa8YorHi/vbarJVgJQFK1+UUOAeg2TQLNjKpQntI9c7/1ZXwmkM+U5n8nu69316GgvgLSQgoIRIxuAwv6ZY5QNHbW+6cn3zN6HfFe8wEq26xoP+T5j1hO1PYCwiGPPM9zw4tedYOEc7Sgi8TrA59GB6UKcOpUnCYDBUtehCElZqlvPGLngmGfOp0gj5ZtxEGQ1J74WkKgL1QaMETar5aD9rZ27Z8IYNe0wxInWAWgPwyPYuVdL+8VRKB/2OcfwmeDJYNLMNZpBwFiA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(38070700005)(33656002)(86362001)(36756003)(6486002)(6916009)(54906003)(4326008)(316002)(91956017)(66556008)(66446008)(64756008)(76116006)(66946007)(66476007)(478600001)(71200400001)(8676002)(8936002)(2906002)(7416002)(38100700002)(122000001)(41300700001)(2616005)(6506007)(26005)(53546011)(6512007)(186003)(66574015)(83380400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <550BE1B358D49848BABE896EF9E340D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9533
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b477ee12-acac-40f8-0a32-08db5d06fe99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMWNgI1oUND8N6vCpLyJYt6BIMTYlxn57Ygkce6wPWTGLUVLC1h9UC2uCwGTTJVX6YCibPljVs0KEycVFMHOXHRfNnoSsmjaWc8UJxSFTT8qNMF88VU2QW21sY0vTsPbaPWjHUs0DzBQ0HaeQozhjlBZBgFuIuJE5wJGTnmlmTs3dh+y4weEXGS1sbgXmAk/vv4uAMwwdiU7VtlsGjnKjERKj7pIGwdCPTYoTOXKz0IXhPhxgMGbenpbxD2kOuX97DDcWrn+l+KnO6bND6PjCE79qtqCSfXMgO2ZIo6+omrXuZ1F4XxqofDfihttkXDZhuiKLzujIzMY6OswT1ZYE7ZS0OLyQkJRuYEokvZ1u1j2q9bpC2O/LJURHRilpEf7y9+qQdcVJ0SSvag31TAFSNUlLeywpo9V7sCbd7LOGH2TE6bUB1DxqMQwamWHdZkEY9kvLbBVNCaB/016f9iKh6kL4MaFvVjYf7VAfh+7cEKJ6t73Wf3GDvkqskB88o0OJwYlprwumqZLaOQy3OSYOeafWAG+wwIEY3nssczecsn52T2gtIxvCdIWFLKX2/vKX1+R0Viej/eRWE3N9nZ3tW4USCqQaHXBrHuVMkQ82qJNnm+UA6NvpPlv4iJXWMC9BBInM3iUqrxIjSTspVi9XrSvDniF+f7Ft6HcSVOeJMghuNroZOIzaZ9YzPgr7Q28wJkiQHLezCYPUXhGm0Cc5kLcScESi/jWywG1EtU4IFarHOKHEWju4986kuuPfqOh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(4326008)(33656002)(36756003)(82310400005)(40480700001)(53546011)(6862004)(8676002)(8936002)(6506007)(41300700001)(6512007)(26005)(2616005)(186003)(336012)(107886003)(5660300002)(83380400001)(70206006)(54906003)(70586007)(316002)(478600001)(86362001)(82740400003)(81166007)(356005)(6486002)(36860700001)(66574015)(2906002)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 10:01:38.0315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82e4857-1372-44b9-68e5-08db5d0707dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9201

DQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDEwOjIxLCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4+PiANCj4+PiAoLi4uKQ0KPj4+IA0KPj4+PiBkaWZm
IC0tZ2l0IGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9u
L3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+Pj4+IGluZGV4IDk3MjhiMzQxODVhYy4uYjM2OTlmZGFj
NThlIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMN
Cj4+Pj4gKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+Pj4+IEBAIC0y
Miw2ICsyMiw3IEBADQo+Pj4+ICNpbmNsdWRlIDx4ZW4vaHZtL2h2bV9pbmZvX3RhYmxlLmg+DQo+
Pj4+ICNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFtcy5oPg0KPj4+PiANCj4+Pj4gKyNpbmNsdWRlIDx4
ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmg+DQo+Pj4+ICNpbmNsdWRlIDx4ZW4tdG9v
bHMvY29tbW9uLW1hY3Jvcy5oPg0KPj4+PiANCj4+Pj4gLyogTmVlZGVkIGZvciBQeXRob24gdmVy
c2lvbnMgZWFybGllciB0aGFuIDIuMy4gKi8NCj4+Pj4gQEAgLTg5Nyw3ICs4OTgsNyBAQCBzdGF0
aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNlbGYpDQo+Pj4+ICAgaWYgKCBw
ICE9IHZpcnRfY2FwcyApDQo+Pj4+ICAgICAqKHAtMSkgPSAnXDAnOw0KPj4+PiANCj4+Pj4gLSAg
ICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgie3M6aSxzOmksczppLHM6aSxzOmwsczpsLHM6bCxzOmks
czpzLHM6c30iLA0KPj4+PiArICAgIHJldHVybiBQeV9CdWlsZFZhbHVlKCJ7czppLHM6aSxzOmks
czppLHM6bCxzOmwsczpsLHM6aSxzOnMsczpzLHM6SX0iLA0KPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJucl9ub2RlcyIsICAgICAgICAgcGluZm8ubnJfbm9kZXMsDQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInRocmVhZHNfcGVyX2NvcmUiLCBwaW5mby50aHJlYWRzX3Bl
cl9jb3JlLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3Jlc19wZXJfc29ja2V0
IiwgcGluZm8uY29yZXNfcGVyX3NvY2tldCwNCj4+Pj4gQEAgLTkwNyw3ICs5MDgsMTAgQEAgc3Rh
dGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0ICpzZWxmKQ0KPj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJzY3J1Yl9tZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZv
LnNjcnViX3BhZ2VzKSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAiY3B1X2toeiIs
ICAgICAgICAgIHBpbmZvLmNwdV9raHosDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
Imh3X2NhcHMiLCAgICAgICAgICBjcHVfY2FwLA0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ2aXJ0X2NhcHMiLCAgICAgICAgdmlydF9jYXBzKTsNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAidmlydF9jYXBzIiwgICAgICAgIHZpcnRfY2FwcywNCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiYXJtX3N2ZV92bCIsDQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBhcmNoX2NhcGFiaWxpdGllc19hcm1fc3ZlKHBpbmZvLmFyY2hf
Y2FwYWJpbGl0aWVzKQ0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgKTsNCj4+PiANCj4+
PiBUaGlzIHNob3VsZCBiZSBhZGRlZCBvbmx5IHdoZW4gYnVpbGRpbmcgZm9yIEFSTSwgc2ltaWxh
ciBhcyBmb3Igb3RoZXINCj4+PiBiaW5kaW5ncy4NCj4+IA0KPj4gSGkgTWFyZWssDQo+PiANCj4+
IFRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGlzLCBhcmUgeW91IG9r
IGlmIEkgbWFrZSB0aGVzZSBjaGFuZ2VzIHRvIHRoZSBjb2RlPw0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9s
b3dsZXZlbC94Yy94Yy5jDQo+PiBpbmRleCBiMzY5OWZkYWM1OGUuLmM3ZjY5MDE4OTc3MCAxMDA2
NDQNCj4+IC0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPj4gKysrIGIv
dG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+PiBAQCAtODcyLDYgKzg3Miw4IEBA
IHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09iamVjdCAqc2VsZikNCj4+ICAgIGNv
bnN0IGNoYXIgKnZpcnRjYXBfbmFtZXNbXSA9IHsgImh2bSIsICJwdiIgfTsNCj4+ICAgIGNvbnN0
IHVuc2lnbmVkIHZpcnRjYXBzX2JpdHNbXSA9IHsgWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX1NZU0NUTF9QSFlTQ0FQ
X3B2IH07DQo+PiArICAgIFB5T2JqZWN0ICpvYmpyZXQ7DQo+PiArICAgIGludCByZXRjb2RlOw0K
Pj4gDQo+PiAgICBpZiAoIHhjX3BoeXNpbmZvKHNlbGYtPnhjX2hhbmRsZSwgJnBpbmZvKSAhPSAw
ICkNCj4+ICAgICAgICByZXR1cm4gcHl4Y19lcnJvcl90b19leGNlcHRpb24oc2VsZi0+eGNfaGFu
ZGxlKTsNCj4+IEBAIC04OTgsMjAgKzkwMCwzMSBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5
c2luZm8oWGNPYmplY3QgKnNlbGYpDQo+PiAgICBpZiAoIHAgIT0gdmlydF9jYXBzICkNCj4+ICAg
ICAgKihwLTEpID0gJ1wwJzsNCj4+IA0KPj4gLSAgICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgie3M6
aSxzOmksczppLHM6aSxzOmwsczpsLHM6bCxzOmksczpzLHM6cyxzOkl9IiwNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIm5yX25vZGVzIiwgICAgICAgICBwaW5mby5ucl9ub2RlcywN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgInRocmVhZHNfcGVyX2NvcmUiLCBwaW5m
by50aHJlYWRzX3Blcl9jb3JlLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29y
ZXNfcGVyX3NvY2tldCIsIHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQsDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJucl9jcHVzIiwgICAgICAgICAgcGluZm8ubnJfY3B1cywNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInRvdGFsX21lbW9yeSIsICAgICBwYWdlc190b19r
aWIocGluZm8udG90YWxfcGFnZXMpLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
ZnJlZV9tZW1vcnkiLCAgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5mcmVlX3BhZ2VzKSwNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInNjcnViX21lbW9yeSIsICAgICBwYWdlc190b19r
aWIocGluZm8uc2NydWJfcGFnZXMpLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Y3B1X2toeiIsICAgICAgICAgIHBpbmZvLmNwdV9raHosDQo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJod19jYXBzIiwgICAgICAgICAgY3B1X2NhcCwNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMsDQo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJhcm1fc3ZlX3ZsIiwNCj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBhcmNoX2NhcGFiaWxpdGllc19hcm1fc3ZlKHBpbmZvLmFyY2hfY2FwYWJp
bGl0aWVzKQ0KPj4gKyAgICBvYmpyZXQgPSBQeV9CdWlsZFZhbHVlKCJ7czppLHM6aSxzOmksczpp
LHM6bCxzOmwsczpsLHM6aSxzOnMsczpzfSIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIm5yX25vZGVzIiwgICAgICAgICBwaW5mby5ucl9ub2RlcywNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAidGhyZWFkc19wZXJfY29yZSIsIHBpbmZvLnRocmVhZHNfcGVyX2NvcmUs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvcmVzX3Blcl9zb2NrZXQiLCBwaW5m
by5jb3Jlc19wZXJfc29ja2V0LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJucl9j
cHVzIiwgICAgICAgICAgcGluZm8ubnJfY3B1cywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAidG90YWxfbWVtb3J5IiwgICAgIHBhZ2VzX3RvX2tpYihwaW5mby50b3RhbF9wYWdlcyks
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgImZyZWVfbWVtb3J5IiwgICAgICBwYWdl
c190b19raWIocGluZm8uZnJlZV9wYWdlcyksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgInNjcnViX21lbW9yeSIsICAgICBwYWdlc190b19raWIocGluZm8uc2NydWJfcGFnZXMpLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJjcHVfa2h6IiwgICAgICAgICAgcGluZm8u
Y3B1X2toeiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAiaHdfY2FwcyIsICAgICAg
ICAgIGNwdV9jYXAsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgInZpcnRfY2FwcyIs
ICAgICAgICB2aXJ0X2NhcHMNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgKTsNCj4+ICsNCj4+
ICsgICAgI2lmIGRlZmluZWQoX19hYXJjaDY0X18pDQo+PiArICAgICAgICBpZiAob2JqcmV0KSB7
DQo+PiArICAgICAgICAgICAgcmV0Y29kZSA9IFB5RGljdF9TZXRJdGVtU3RyaW5nKA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBvYmpyZXQsICJhcm1fc3ZlX3ZsIiwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2ZShwaW5mby5h
cmNoX2NhcGFiaWxpdGllcykNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICApOw0KPj4gKyAg
ICAgICAgICAgIGlmICggcmV0Y29kZSA8IDAgKQ0KPj4gKyAgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgI2VuZGlmDQo+PiArDQo+PiArICAgIHJldHVy
biBvYmpyZXQ7DQo+PiB9DQo+PiANCj4+IHN0YXRpYyBQeU9iamVjdCAqcHl4Y19nZXRjcHVpbmZv
KFhjT2JqZWN0ICpzZWxmLCBQeU9iamVjdCAqYXJncywgUHlPYmplY3QgKmt3ZHMpDQo+PiANCj4+
IA0KPj4gUGxlYXNlIG5vdGljZSB0aGF0IG5vdyB3ZSBjYW4gaGF2ZSBhIHBhdGggdGhhdCBjb3Vs
ZCByZXR1cm4gTlVMTCwgYXJlIHlvdSBvayBmb3INCj4+IEl0IG9yIHNob3VsZCBJIGp1c3QgaWdu
b3JlIHRoZSByZXR1cm4gY29kZSBmb3IgUHlEaWN0X1NldEl0ZW1TdHJpbmc/DQo+PiANCj4+IEFs
c28sIGRvIHlvdSB3YW50IG1lIHRvIHByb3RlY3QgdGhlIGluY2x1ZGUgdG8gPHhlbi10b29scy9h
cm0tYXJjaC1jYXBhYmlsaXRpZXMuaD4NCj4+IHdpdGggaWZkZWY/DQo+PiANCj4gDQo+IEVESVQ6
IEkgc2F3IHRoaXMgZG9lc27igJl0IGV2ZW4gY29tcGlsZSwgSSB3aWxsIGFzayBsYXRlciB3aGVu
IEkgd2lsbCBoYXZlIHNvbWV0aGluZyB3b3JraW5nLA0KPiBJIHNhdyBQeURpY3RfU2V0SXRlbVN0
cmluZyBpcyB1c2VkIHNvbWV3aGVyZSBlbHNlIHNvIEkgd2lsbCB1c2UgdGhhdCBhcHByb2FjaCBi
ZWZvcmUNCj4gUHJvcG9zaW5nIHlvdSBhIHNvbHV0aW9uDQo+IA0KPiANCg0KT2ssIHNvIHRoaXMg
aXMgbXkgcHJvcG9zZWQgc29sdXRpb246DQoNCmRpZmYgLS1naXQgYS90b29scy9weXRob24veGVu
L2xvd2xldmVsL3hjL3hjLmMgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMNCmlu
ZGV4IGIzNjk5ZmRhYzU4ZS4uZTUyYWE4OGYzYzVmIDEwMDY0NA0KLS0tIGEvdG9vbHMvcHl0aG9u
L3hlbi9sb3dsZXZlbC94Yy94Yy5jDQorKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hj
L3hjLmMNCkBAIC04NzIsNiArODcyLDcgQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZv
KFhjT2JqZWN0ICpzZWxmKQ0KICAgICBjb25zdCBjaGFyICp2aXJ0Y2FwX25hbWVzW10gPSB7ICJo
dm0iLCAicHYiIH07DQogICAgIGNvbnN0IHVuc2lnbmVkIHZpcnRjYXBzX2JpdHNbXSA9IHsgWEVO
X1NZU0NUTF9QSFlTQ0FQX2h2bSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBYRU5fU1lTQ1RMX1BIWVNDQVBfcHYgfTsNCisgICAgUHlPYmplY3QgKm9ianJldDsNCiAN
CiAgICAgaWYgKCB4Y19waHlzaW5mbyhzZWxmLT54Y19oYW5kbGUsICZwaW5mbykgIT0gMCApDQog
ICAgICAgICByZXR1cm4gcHl4Y19lcnJvcl90b19leGNlcHRpb24oc2VsZi0+eGNfaGFuZGxlKTsN
CkBAIC04OTgsMjAgKzg5OSwzNiBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNP
YmplY3QgKnNlbGYpDQogICAgIGlmICggcCAhPSB2aXJ0X2NhcHMgKQ0KICAgICAgICoocC0xKSA9
ICdcMCc7DQogDQotICAgIHJldHVybiBQeV9CdWlsZFZhbHVlKCJ7czppLHM6aSxzOmksczppLHM6
bCxzOmwsczpsLHM6aSxzOnMsczpzLHM6SX0iLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAibnJfbm9kZXMiLCAgICAgICAgIHBpbmZvLm5yX25vZGVzLA0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAidGhyZWFkc19wZXJfY29yZSIsIHBpbmZvLnRocmVhZHNfcGVyX2NvcmUsDQot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3Jlc19wZXJfc29ja2V0IiwgcGluZm8uY29y
ZXNfcGVyX3NvY2tldCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5yX2NwdXMiLCAg
ICAgICAgICBwaW5mby5ucl9jcHVzLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAidG90
YWxfbWVtb3J5IiwgICAgIHBhZ2VzX3RvX2tpYihwaW5mby50b3RhbF9wYWdlcyksDQotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJmcmVlX21lbW9yeSIsICAgICAgcGFnZXNfdG9fa2liKHBp
bmZvLmZyZWVfcGFnZXMpLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAic2NydWJfbWVt
b3J5IiwgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5zY3J1Yl9wYWdlcyksDQotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJjcHVfa2h6IiwgICAgICAgICAgcGluZm8uY3B1X2toeiwNCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImh3X2NhcHMiLCAgICAgICAgICBjcHVfY2FwLA0KLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAidmlydF9jYXBzIiwgICAgICAgIHZpcnRfY2FwcywN
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgImFybV9zdmVfdmwiLA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFyY2hfY2FwYWJpbGl0aWVzX2FybV9zdmUocGluZm8uYXJjaF9j
YXBhYmlsaXRpZXMpDQorICAgIG9ianJldCA9IFB5X0J1aWxkVmFsdWUoIntzOmksczppLHM6aSxz
OmksczpsLHM6bCxzOmwsczppLHM6cyxzOnN9IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAibnJfbm9kZXMiLCAgICAgICAgIHBpbmZvLm5yX25vZGVzLA0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFkc19wZXJfY29yZSwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiY29yZXNfcGVyX3NvY2tldCIsIHBpbmZvLmNvcmVz
X3Blcl9zb2NrZXQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5yX2NwdXMiLCAgICAg
ICAgICBwaW5mby5ucl9jcHVzLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3RhbF9t
ZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnRvdGFsX3BhZ2VzKSwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiZnJlZV9tZW1vcnkiLCAgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5m
cmVlX3BhZ2VzKSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAic2NydWJfbWVtb3J5Iiwg
ICAgIHBhZ2VzX3RvX2tpYihwaW5mby5zY3J1Yl9wYWdlcyksDQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImNwdV9raHoiLCAgICAgICAgICBwaW5mby5jcHVfa2h6LA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJod19jYXBzIiwgICAgICAgICAgY3B1X2NhcCwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAidmlydF9jYXBzIiwgICAgICAgIHZpcnRfY2Fwcw0KICAgICAgICAg
ICAgICAgICAgICAgICAgICk7DQorDQorICAgICNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KKyAg
ICAgICAgaWYgKCBvYmpyZXQgKSB7DQorICAgICAgICAgICAgdW5zaWduZWQgaW50IHN2ZV92bF9i
aXRzOw0KKyAgICAgICAgICAgIFB5T2JqZWN0ICpweV9hcm1fc3ZlX3ZsOw0KKw0KKyAgICAgICAg
ICAgIHN2ZV92bF9iaXRzID0gYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2ZShwaW5mby5hcmNoX2Nh
cGFiaWxpdGllcyk7DQorICAgICAgICAgICAgcHlfYXJtX3N2ZV92bCA9IFB5TG9uZ19Gcm9tVW5z
aWduZWRMb25nKHN2ZV92bF9iaXRzKTsNCisNCisgICAgICAgICAgICBpZiAoICFweV9hcm1fc3Zl
X3ZsICkNCisgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQorDQorICAgICAgICAgICAgaWYo
IFB5RGljdF9TZXRJdGVtU3RyaW5nKG9ianJldCwgImFybV9zdmVfdmwiLCBweV9hcm1fc3ZlX3Zs
KSApDQorICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KKyAgICAgICAgfQ0KKyAgICAjZW5k
aWYNCisNCisgICAgcmV0dXJuIG9ianJldDsNCiB9DQogDQogc3RhdGljIFB5T2JqZWN0ICpweXhj
X2dldGNwdWluZm8oWGNPYmplY3QgKnNlbGYsIFB5T2JqZWN0ICphcmdzLCBQeU9iamVjdCAqa3dk
cykNCg0KV291bGQgaXQgd29yayBmb3IgeW91Pw0KDQoNCg0KPiANCj4+PiANCj4+Pj4gfQ0KPj4+
PiANCj4+Pj4gc3RhdGljIFB5T2JqZWN0ICpweXhjX2dldGNwdWluZm8oWGNPYmplY3QgKnNlbGYs
IFB5T2JqZWN0ICphcmdzLCBQeU9iamVjdCAqa3dkcykNCj4+PiANCj4+PiAtLSANCj4+PiBCZXN0
IFJlZ2FyZHMsDQo+Pj4gTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+Pj4gSW52aXNpYmxl
IFRoaW5ncyBMYWINCg0KDQo=

