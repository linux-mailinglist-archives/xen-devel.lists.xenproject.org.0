Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E87BF454
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 09:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614578.955769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7BT-0001VC-4E; Tue, 10 Oct 2023 07:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614578.955769; Tue, 10 Oct 2023 07:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7BT-0001SL-0f; Tue, 10 Oct 2023 07:29:39 +0000
Received: by outflank-mailman (input) for mailman id 614578;
 Tue, 10 Oct 2023 07:29:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBiT=FY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qq7BR-0001SF-4p
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 07:29:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26b6499-673e-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 09:29:34 +0200 (CEST)
Received: from DU2PR04CA0336.eurprd04.prod.outlook.com (2603:10a6:10:2b4::15)
 by DB9PR08MB7820.eurprd08.prod.outlook.com (2603:10a6:10:39c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 07:29:21 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::90) by DU2PR04CA0336.outlook.office365.com
 (2603:10a6:10:2b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 07:29:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.23 via Frontend Transport; Tue, 10 Oct 2023 07:29:20 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Tue, 10 Oct 2023 07:29:20 +0000
Received: from a71be2fdc350.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BE6E833-63B0-4192-BC6D-6609BD46FB5C.1; 
 Tue, 10 Oct 2023 07:29:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a71be2fdc350.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Oct 2023 07:29:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7370.eurprd08.prod.outlook.com (2603:10a6:20b:446::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 07:29:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 07:29:01 +0000
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
X-Inumbo-ID: c26b6499-673e-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84emrquxgtm2KwJ6ssXPajqSXWUJXQ3I7jVMGIR44zI=;
 b=Yk4uwDsf1f8rasnTLhYtnAiDN7F6OKeGGi/NCGWIZ1WBLb77xc+rEMcs/GDLzs7fQSDoUDvRCU9fFOHK67/D3Uaasq7tHBzHIF5Yu+2XguxxFIpqwMgV5ne9fwnJf1Kaxi31KqzXKxnFtxvoG3bDfhnZBq3gpOEjhR3vIIzQrqA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 069a9f37057d44da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFHk00e4iHorZlhaIbzdNSoePXZhnYr2VDwehVJlWaA1wZMZPg1dkgJJF3dLFLFI2sxOAjIVwmMwdkTyW+2AUTYJ6nIysD8B/MI1ay+TGctGZ1A8E7ot+tGnNyVY12Auevm8OneRoPH4GZwSHmRviDOMjMvVaFggkPumGcyle1p/fjIzYM50W1yoxc0SaQfbWlTbpr2ARmfBRmcPePmbdkPlE26WzNjmQGHLzZzJRoULTjOtunbOP+Pz5GXHxYrdj6xjilxkhsZlZgSIrIeCN1RTnMuSXNzpdBxVH1rYixqSq56yVzqeJdsKRmf5y1xqhLydyjfMdhqUzugQV/8pVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84emrquxgtm2KwJ6ssXPajqSXWUJXQ3I7jVMGIR44zI=;
 b=nBQ0iQpVIUGrGker9vXtEoSbihGlbiSZaPf4+2w8rrC7nQHQskNLq4cMjBzMkqGbnFMK76lJ27w2IuvqqzFzzAeEx11p8JmxzR+ScBi7kYfyDUF0ThyWvQROdOFwKCUzri9UuNyFaV9V3zSzwAxlr8+JMRL9yq33NtlfiuDFGsuk25g+zx9o6r4U/6LoX7/jgd2nhgWYOHop6iCuGIX6Kh3ooHGnDbYYOBJbGLM2U5uReJuj6suDJVrFGIdOfCxK79rZMfcVdveG79s1VWumTbkli7dM99uJD/4ureeP/HKsVsDj4TLTGZPIHYvu2H4/UdGnc9YXStd28K9oGGGI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84emrquxgtm2KwJ6ssXPajqSXWUJXQ3I7jVMGIR44zI=;
 b=Yk4uwDsf1f8rasnTLhYtnAiDN7F6OKeGGi/NCGWIZ1WBLb77xc+rEMcs/GDLzs7fQSDoUDvRCU9fFOHK67/D3Uaasq7tHBzHIF5Yu+2XguxxFIpqwMgV5ne9fwnJf1Kaxi31KqzXKxnFtxvoG3bDfhnZBq3gpOEjhR3vIIzQrqA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index:
 AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAA1KIAgACGqQCAASTEgIAAdASAgAEY6ICAA60ogIAA4ZaAgACZhgA=
Date: Tue, 10 Oct 2023 07:29:00 +0000
Message-ID: <2AC05F6B-477A-45C3-A865-E0917692EE12@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
 <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7370:EE_|DBAEUR03FT010:EE_|DB9PR08MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b143df-6876-4614-2727-08dbc9629eb6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aNKuu0gXxOSDEz1u3+ZZeKcVUMKl+KxoEo7QIALuMsCwrYlZx7ksPj/OSKg6Rudie+DI6VPSkdfbttdulGtFUkZjbDT0xsidHdda92oDpR/WQKkWkWmdHkmQbkkZJDUVlyW2NnNp+WP0cfZlikeYB8DnSVpbqUCrl2pTqJ25jTCO5w+hhs1m4mjLwDBU5AsuGOoKasa0RP45tW7kn7Gsr7DrPPsbC7brKyIWH/8nOxdVayv5yAK8QYnp1L4U+43iTclDuQqMKOznKgiqWKP7HWjne0HIvFcVxOldfBjdURLjf8NMSAVsdR3T9STyzxd+VJfLqkRMs2r2Kx8+VQOCHlexyouqFq045KjPncniSi/ZgpG3NcrSKIw4b1ke4bwG1Uq02IrtCzj0iuW5i4dT1rEVUJdIhXubw/Mr12M5MaHQWZ2jfYItMsH2MbmlViwLAtvNnnxKovHis2d3Q3dl3dJT1PTIZHhL/UjoUc0F3EjGudp5Kh5XjXOjbH80udw7Qn7NApx79vHyVAB2nFfjZcQSzgZCu4vHPGhTVqZ2Tvzb7lugCDO/pUdIXaeYaTb/6R7X2OzNvRN2aDIpfPCD1t/7VpUoqwslfYOXDI58ZKjvEAbGjCQkqOuvsJTYRQOlKCQGYgDla/cn0fO1qncVeg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6506007)(6512007)(2616005)(86362001)(33656002)(36756003)(38070700005)(122000001)(38100700002)(83380400001)(6486002)(7416002)(2906002)(71200400001)(478600001)(41300700001)(4326008)(8676002)(8936002)(26005)(5660300002)(64756008)(76116006)(316002)(66556008)(66476007)(6916009)(91956017)(54906003)(66446008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <80E614921261334186BD461393F918B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35df6cca-e811-4fd0-e3f8-08dbc96292ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwn5D2xJV8pbirhk2aRLOrlo837pN79T4xa4N37IeTSs0+9cBcXHYzbuCPjkO2IzzOY/1o3tfa/HFHD0fJ9ENRSW4SO6M2GvN/+iHMe2/Pt4KwOpuJFZlUTPNk8wBAyVEw2LtPa44OQ03YUEUdgtjPcgMxF2wCVO0Wyb0vEytbx+si/cdt1E+XMlF6HzU8+PyYba8trljWOuxIvXYVTNKEB8FrJJNv9pTv2FEqu1ZXgOsjIToKIvJeBPlSR/4kemvb64pEypEw/QNbZ7QBpkNVCCmi8NoVJEkNRfD4PHeBUjJ+cViJetdlHjjKK0EOTsxZm6W9WSezKMJngdJ3YmCi3664MJQvC/kNULRSK1dqedQLpSWfTEy/VrYknWZvsW8ZndncYsI0Oh7GhN45IporGiRfQsjoDIDxv5CVUh4Qmn5bUyP25ZMjs/8J7SrKCZEMir5PsG9deoono1v4Gn7xWSmnn4h4FUVVFa7vpN4cn2glEZ5b/05Di1fAcCHDDesHmZxPiHuvA5VpFVX+0wHyOt//3aVbI8noFjJrcCYa7fhRIyZSh1ii0bkFRFT1WHdsosiq/Pr0jL5ba4m1UPa33qgheXPs6lMH8YYTcxzhEpb3TcjiBZfzIqcChy9ks7nZxLIfDALYVU82/3S+JN6wIvvtk8Fb3N+5FPXoL2m2JkD/4IJgjrhnp1TwrW7KcHFb8EzshLxwZ9j7RVaQmODjKkhYGz0IRtMvDgFPxJVyOQnCY9NvjBGxQmM7jVg/FN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(107886003)(6512007)(40460700003)(33656002)(36756003)(86362001)(40480700001)(356005)(82740400003)(36860700001)(81166007)(26005)(47076005)(336012)(83380400001)(2906002)(6486002)(2616005)(6506007)(478600001)(8936002)(8676002)(6862004)(4326008)(316002)(41300700001)(5660300002)(70586007)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 07:29:20.9460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b143df-6876-4614-2727-08dbc9629eb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7820

PiANCj4+PiAvKiBTQUYteC1zYWZlICovDQo+Pj4gaWYgKCBtb2RybV9tb2QgPT0gTUFTS19FWFRS
KGluc3RyX21vZHJtLCAwMzAwKSAmJiAobW9kcm1fcmVnICYgNykgPT0NCj4+PiBNQVNLX0VYVFIo
aW5zdHJfbW9kcm0sIDAwNzApICYmIChtb2RybV9ybSAmIDcpICA9PSBNQVNLX0VYVFIoaW5zdHJf
bW9kcm0sDQo+Pj4gMDAwNykgKQ0KPj4+IA0KPj4+IEFueSBvdGhlciBpZGVhcz8NCj4+IA0KPj4g
Q291bGQgd2UgaGF2ZSBhIG51bWJlciBpbiB0aGUgY29tbWVudCB0byBpbmRpY2F0ZSB0aGUgbnVt
YmVyIG9mIGxpbmVzIHRoZQ0KPj4gY29tbWVudCBhcHBsaWVzIHRvPw0KPiANCj4gTHVjYSBjYW4g
Y29uZmlybSB0aGF0IHdoYXQgSSBhbSBhYm91dCB0byB3cml0ZSBpcyBjb3JyZWN0OyBteQ0KPiB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgRUNMQUlSIHN1cHBvcnRzIGl0LCBidXQgY3BwY2hlY2sgZG9l
cyBub3QuIFdoaWNoDQo+IG1lYW5zIGZvciBjcHBjaGVjayB3ZSB3b3VsZCBoYXZlIHRvIHRyYW5z
bGF0ZSB0aGUgU0FGIHRhZyB3aXRoDQo+IHhlbl9hbmFseWl6ZSB0bzoNCj4gDQo+IC8qIGNwcGNo
ZWNrIHRhZyAqLw0KPiBsaW5lMQ0KPiAvKiBjcHBjaGVjayB0YWcgKi8NCj4gbGluZTINCj4gLyog
Y3BwY2hlY2sgdGFnICovDQo+IGxpbmUzDQo+IA0KPiBhbmQgdGhhdCB3b3VsZCBlbmQgdXAgY2hh
bmdpbmcgdGhlIGxpbmUgbnVtYmVycyBpbiB0aGUgc291cmNlIGZpbGVzIHNvDQo+IHRoZSBjcHBj
aGVjayByZXBvcnQgd291bGRuJ3QgbWF0Y2ggd2l0aCB0aGUgb3JpZ2luYWwgbGluZSBudW1iZXJz
IGFueQ0KPiBsb25nZXINCg0KWWVzLCBidXQgaXTigJlzIG5vdCBvbmx5IENwcGNoZWNrLCBpdOKA
mXMgYWxzbyBDb3Zlcml0eSB0aGF0IHN1cHBvcnRzIG9ubHkgdGhlIGFib3ZlIG5vdGF0aW9uLg0K
DQpGb3IgQ3BwY2hlY2sgd2UgY291bGQgZG8gc29tZXRoaW5nLCBidXQgZm9yIENvdmVyaXR5IHdl
IGNhbuKAmXQuDQoNCkFueXdheSwgU3RlZmFubyBvciBOaWNvbGEsIEkgd291bGQgbGlrZSB0byB1
bmRlcnN0YW5kIHdoZXJlIEVjbGFpciByZXBvcnRzIHRoZSB2aW9sYXRpb24NCmluIHRoZSBjYXNl
IG9mICNkZWZpbmUsIGRvZXMgaXQgcmVwb3J0IGF0IHRoZSB1c2FnZSBvciBhdCB0aGUgZGVmaW5p
dGlvbj8NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

