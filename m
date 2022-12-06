Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6AF64433B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 13:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454796.712340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XC3-0006Ra-B0; Tue, 06 Dec 2022 12:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454796.712340; Tue, 06 Dec 2022 12:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XC3-0006P3-7y; Tue, 06 Dec 2022 12:37:03 +0000
Received: by outflank-mailman (input) for mailman id 454796;
 Tue, 06 Dec 2022 12:37:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYNa=4E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p2XC1-0006Ov-H0
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 12:37:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a414c6fa-7562-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 13:36:44 +0100 (CET)
Received: from FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::8) by
 AS8PR08MB6197.eurprd08.prod.outlook.com (2603:10a6:20b:294::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 12:36:56 +0000
Received: from VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::97) by FR3P281CA0190.outlook.office365.com
 (2603:10a6:d10:a4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Tue, 6 Dec 2022 12:36:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT048.mail.protection.outlook.com (100.127.144.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Tue, 6 Dec 2022 12:36:55 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 06 Dec 2022 12:36:55 +0000
Received: from 9fca5d255827.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 636B1791-33BC-4B71-8459-D44817D941A1.1; 
 Tue, 06 Dec 2022 12:36:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fca5d255827.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Dec 2022 12:36:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB5891.eurprd08.prod.outlook.com (2603:10a6:20b:2da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 12:36:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Tue, 6 Dec 2022
 12:36:42 +0000
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
X-Inumbo-ID: a414c6fa-7562-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuujFdJHmxkOO2QXwGOMXKNJTrnAflI5gRLPmamlQY=;
 b=otiVuzPq58LaGV485coucYP59CtrVGcMP4bPqaGlYW17Y3DJZEd3/4JL0mIxEssSwYKfQd4biEe3xHiJNUyLTGy7AEhQ00Hu3YuKtPY1ul+GO5D5iy7IwAAO81K1W/K8fHiGCZ67+E4OZqVxc7CJRqGuFTAOw04hLEmXjtKwt34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bdded2db3b63076f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP0UzH7s/HulhiCELiTFFEg+9klvjkq1ip7x+CAvnB+x9LeTWGi6Ze9GHAx+V+3dxXHEqR39dibD6seDSUu7gglIP7CmDEeqshof+z/o0GJGk7Xk9Dj8gxTRj5dOzBvlfSdNtH503z7AdjmV1w5y2zUYiac/6GxzBWxs6fibHCYma3ucCTDletofxXB7Jv/Z2bY6Hecz/M7eB7mIG6wTRJp/Djgfeu+Wrj3oKYeGQ5D9JBJBcvctlztBrE7nFxC7QATw+KfRxTqi+5KaztA/b+5R0giSWYQvOJIHwMQ8ODT4WFcE/xf8Em8DuM3BoUITdj8WOgRrWvL+n2QXdW0lgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmuujFdJHmxkOO2QXwGOMXKNJTrnAflI5gRLPmamlQY=;
 b=oJrSiwQCZAgZEOv9jFi39WyfOeiq88QqKhy1dKKPUjPKBo+WwoW8AVSJ8aNHrwboqFoSJ11jFzDyFq/zwXYjOKJUR3NHESbUsg+GZb54DnR+sJkmfIZRi93rfHwCjIyQJhR3evRMkws8We9usGQXmXg+m0Q7uJzSgZ7qRfCbb3GHvZu8VKQTWOoyIv91VizbTO4dT2+cUIXxJn0inXXjwJXbSLrhTPOUqcLTZ3rGFcy1Uj84oS01iHEtzYHjV7CQRUrudgshjvQ+6sVrE+gQbajBvnuxJjGucWsjw8jaJJ496w3Zgk5J99O3poROmCx/OFC7/tHh8mchKb2GcSzBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuujFdJHmxkOO2QXwGOMXKNJTrnAflI5gRLPmamlQY=;
 b=otiVuzPq58LaGV485coucYP59CtrVGcMP4bPqaGlYW17Y3DJZEd3/4JL0mIxEssSwYKfQd4biEe3xHiJNUyLTGy7AEhQ00Hu3YuKtPY1ul+GO5D5iy7IwAAO81K1W/K8fHiGCZ67+E4OZqVxc7CJRqGuFTAOw04hLEmXjtKwt34=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/5] xen/Makefile: remove Cppcheck invocation from the
 Makefile
Thread-Topic: [PATCH v2 3/5] xen/Makefile: remove Cppcheck invocation from the
 Makefile
Thread-Index: AQHZCMAWOgBUls/3J0ScrSjGl4ZC6a5fcz2AgAFZ8IA=
Date: Tue, 6 Dec 2022 12:36:42 +0000
Message-ID: <A07F7DB8-6237-47D6-A643-C96FB371C1C2@arm.com>
References: <20221205154052.14191-1-luca.fancellu@arm.com>
 <20221205154052.14191-4-luca.fancellu@arm.com>
 <45f4cef6-99ba-a37c-3e57-27b270d16f6f@suse.com>
In-Reply-To: <45f4cef6-99ba-a37c-3e57-27b270d16f6f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB5891:EE_|VI1EUR03FT048:EE_|AS8PR08MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a42c35-2dd4-4395-c9aa-08dad7868f98
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TAQN0GPEfd1XhKUDAFxsQ2bLP6236RYtfn46QkKknUpqw7epIB3Rs/PY9mfHOQB504TMMnID4gZFXqFuLF24+UkJQfWDuKlYSSUspf7cPWnCZLiyuJ3wB4TFP0jYtXSbVVXtF/xmhK8zDP0y6KBfIAhVLsStnhM9NaY1M6giarKIzmFzTILYu7mf0RK1uU3JgLFiN//iuh2EIoKPSJTfr1FyogpaLbHCWxJX9oFIj4TtOVHKfSwzatmGAa6DYV2Bowi+edhuMlKmZKVHmQ6lJb6y42Dvr2EKtV5ux/vsRHQMbIVxVRnFqmj6RLjTe2wmviOX7hk1Q2W9IaZd0B05B7oZoZX+JOCIW6PsAMxBjw+6iWFJaae+qhJq+0mOqMnesLYU8yEAgi1DscloSQaig1x3Rul9sXmVj98+9RE3p00FOxTKGHi31Bs40PqOq3BqczA2yG/U0FB2wDONcZymTLcz95/gYCHMOPbsZMSTjprnvtekTCJdlJ/tMe7Eei5hhJVSaOQg6CruHp+AJLKzuGsFXKxK/jHWxpSgL3QPt3B0LkvsQH3nzeE0JVDZlRDalVOe50PVR/uTrPB7wFy6aGMk83nofMLD+bjjeSzRaI8ynqc5gtLBtAG37fBj36b2eonLPDNf/ScUC+SgPYwVWh+wgazG11l6+AcCLki22fw0UnCculLYLkuJLZRjPvV0630NU8S4Y9RR/8E5/F0zTUTabpvB5kIeGsQwZ+EjbuU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(2906002)(83380400001)(36756003)(66946007)(33656002)(76116006)(41300700001)(186003)(86362001)(66556008)(91956017)(38100700002)(6512007)(26005)(38070700005)(4744005)(2616005)(4326008)(8936002)(122000001)(66446008)(66476007)(64756008)(71200400001)(8676002)(6916009)(478600001)(316002)(54906003)(6486002)(6506007)(5660300002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA71E69343D1254D8B473641E19359B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5891
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b866d1a-5d91-45e5-6578-08dad786879e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fIMaYebA+LdHye2qzo6TM62EdhwC2VqtnbUmKc6WgrYtGerkC4gF4sLuao+1sXSfWLzV9F0IkineN5vt36jYJIXKJfTaz652LHTNHSwiqsS0rW0i6Gm+4wfV392WTwjuBS8zINs6rEhQlv9NPyUI0W6LjPhNizpFe3q9rhUEt9iR1Avdec/2EhVJ2l6PydiPVGLNUwyrRv1cDeHg1kfM8pvmPDuGuOHmbhLhQBNCU5E5FVi163oO4qI2LeGFxAfj6M8QM4JMs2dIX38fXofMh39nj24dOmaThX6UVOx8UKH9l6/Dkk62+xFINgVE+owbnTnx6u2vBez1IZm0euaW8oNUVPCo7amfGywiJCMSjrNWSsS8oLQljXCUQTyLaqltrXa3zVwWh9X8Tx46hG31jMIbJI4cIKEiRNiYTuUdL7KliCPnbYgneJTcx21kY5IRz5+5i8AoRRzmbrmz/Uw5n0a21739Trj7qFaROlKtPLVWHjfOOJg4WtIGgn2017KIngHUYt28NyAv5r+a8lXAjDemj7qAGAs70HazMpVqQQtN6qzueaGPilr0aFB+gTvGEAMvWaioh7KO++mkkJccOfD+V8VnnOWdcQeSGHWB41Gpu7VonKqy0x4D7K1BDADRJBRJC2IU3A+3XH5q+oTt0zlkwnG6KH3X5+dC4ZotJD93C5RLt7wMvY49Uu76gq/JZSZG7PxQJTaYUjE9mQIhuw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(83380400001)(36860700001)(36756003)(186003)(40480700001)(41300700001)(70206006)(33656002)(336012)(70586007)(86362001)(40460700003)(6512007)(5660300002)(26005)(356005)(82740400003)(82310400005)(81166007)(8676002)(2616005)(4326008)(6862004)(8936002)(54906003)(316002)(478600001)(53546011)(47076005)(6506007)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 12:36:55.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a42c35-2dd4-4395-c9aa-08dad7868f98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6197

DQoNCj4gT24gNSBEZWMgMjAyMiwgYXQgMTU6NTgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNS4xMi4yMDIyIDE2OjQwLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gVGhlIHNjcmlwdCB4ZW4tYW5hbHlzaXMucHkgaXMgZ29pbmcgdG8gYmUgdXNlZCBm
b3IgdGhlIGFuYWx5c2lzIHdpdGgNCj4+IGNwcGNoZWNrLCBzbyByZW1vdmUgdGhlIHJ1bGVzIGZy
b20gdGhlIE1ha2VmaWxlDQo+PiANCj4+IFRoZSBweXRob24gc2NyaXB0IHhlbi90b29scy9tZXJn
ZV9jcHBjaGVja19yZXBvcnRzLnB5IHdhcyB1c2VkIGJ5IHRoZQ0KPj4gbWFrZWZpbGUgcnVsZXMs
IGJ1dCBpdHMgZnVuY3Rpb25hbGl0eSBpcyBpbnRlZ3JhdGVkIGluIHRoZQ0KPj4geGVuLWFuYWx5
c2lzLnB5IHNjcmlwdCBub3csIHNvIGl0IGNhbiBiZSByZW1vdmVkLg0KPj4gDQo+PiBSZW1vdmUg
c29tZSBlbnRyeSBmcm9tIHRoZSAuZ2l0aWdub3JlIHJlbGF0ZWQgdG8gQ3BwY2hlY2sgaW52b2Nh
dGlvbg0KPj4gZnJvbSBNYWtlZmlsZQ0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNl
bGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCkhpIEphbiwNCg0KPiANCj4gSXMgdGhpcyBh
IHByb3BlciByZXZlcnQgb2Ygb25lIG9yIG1vcmUgZWFybGllciBwYXRjaGVzPyBJZiBzbywgeW91
IHdhbnQNCj4gdG8gc2F5IHNvLCBmb3IgYmVpbmcgcG90ZW50aWFsbHkgcmVsZXZhbnQgZm9yIChh
dCBsZWFzdCkgcmV2aWV3IHB1cnBvc2VzLg0KPiBJZiBub3QsIGl0IHdvdWxkIGFsc28gaGVscCBz
YXlpbmcgc28gdG8gY2xhcmlmeSB3aGF0IGlzIGJlaW5nIGtlcHQuDQoNCkl0IGlzIGEgcGFydGlh
bCByZXZlcnQgb2YgY29tbWl0cyA1N2NhYTUzNzUzMjEyIGFuZCA0M2FhM2Y2ZTcyZDM0LCBJ4oCZ
dmUNCnJldmVydGVkIG9ubHkgdGhlIE1ha2VmaWxlIGNoYW5nZXMsIHRoZSB4ZW4vdG9vbHMvbWVy
Z2VfY3BwY2hlY2tfcmVwb3J0cy5weQ0Kc2NyaXB0IGFuZCBzb21lIGVudHJpZXMgaW4gLmdpdGln
bm9yZS4NCg0KU2hvdWxkIEkgcHV0IHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPw0KDQoNCj4g
DQo+IEphbg0KDQo=

