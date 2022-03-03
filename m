Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07EE4CB4B9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 03:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282694.481501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPaxU-0008Hk-Ov; Thu, 03 Mar 2022 02:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282694.481501; Thu, 03 Mar 2022 02:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPaxU-0008Ed-LI; Thu, 03 Mar 2022 02:12:48 +0000
Received: by outflank-mailman (input) for mailman id 282694;
 Thu, 03 Mar 2022 02:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HbtR=TO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nPaxT-0008EP-ES
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 02:12:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69bdf03b-9a97-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 03:12:45 +0100 (CET)
Received: from AM6P193CA0128.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::33)
 by VI1PR08MB2799.eurprd08.prod.outlook.com (2603:10a6:802:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 02:12:30 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::11) by AM6P193CA0128.outlook.office365.com
 (2603:10a6:209:85::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 02:12:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 02:12:29 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 03 Mar 2022 02:12:28 +0000
Received: from ec8e0ad5cd7e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25B6611A-C7F6-4CAE-8669-1212A4B22BB3.1; 
 Thu, 03 Mar 2022 02:12:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec8e0ad5cd7e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 02:12:22 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB7006.eurprd08.prod.outlook.com (2603:10a6:10:2c7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 02:12:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 02:12:20 +0000
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
X-Inumbo-ID: 69bdf03b-9a97-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIf3DprJ7pAAnylsAjvRp7di/U2IiOMoLYRiDUKBxMY=;
 b=1ZMe/umpJEF1CsIDC8gfEiP0kilfxGmjTY4l+gKHbPozGhUuqos7K8GCFZ09TYcarkJl/fPkaZEVdkw8gSv3pkIAO8sLbb2FGCT2DNMFPOUyrcSoaiR5MsWrn8iKegKGS5MZy01EfUM+zA/ynQmVo4CoAGPGYe9t1lhj8p6Cg2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXAUcx0KwgHqps/OaslhDqJtkH0QtHIsDwUrao3sk97kiBTkY+Q/EQh516QzmXlWXibGfHf5hkqrM5EHC0QvlNVqlqaG4SI3jx9g72pC/myN40r0xm8xpbbEDQ8/u5bOH2DwmBMEg6Jnr83vgRM7nKy1ajfHe9eZGFysT1hdogL31Oo4HFEnxVssSxlXYaTUVqapb0F+fk9XzclzwIii1uKd8aNsdMOxysdxxfoR7EacaoDCMjzajrwkbwopUrMB0v5XRqd9bI3RUemjRWAr91nj0na9KnKj65gLN/AWIRGa+ZOYb5WXu7YKCQiwLu4V3z730SrTwK+WjsEiFN5nPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIf3DprJ7pAAnylsAjvRp7di/U2IiOMoLYRiDUKBxMY=;
 b=W/n5InJzJAaGsevCicPdmCOaiOy9huhz5KOSsie9YG84FW74BfOff5tA708PBl87AWei5lfAkQeiAlpizKc59OxyFPg7tiXJSsgH7M9/b+gzCfFed9ygf+DhoZl5My9QVDr9SOyCYqPrYK/1W57s0gbAds+xC5hg+aGjKUS3pDAhL+YlfHNuuaabsNosZ1fEaKJDZcoKIcTg0+ak3/x1OEuIUegHmLdIbEjCRF6WZrMR4plSxQzrpLhCwnX1F/xV0GK5uwzzhGxAfHAPAqUd4kANMiRm1kpX2iN8EuEXBmp80ZoCEiQ+GZqKKd/06WUgKLvjRMYzlaxKdgEzidm7zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIf3DprJ7pAAnylsAjvRp7di/U2IiOMoLYRiDUKBxMY=;
 b=1ZMe/umpJEF1CsIDC8gfEiP0kilfxGmjTY4l+gKHbPozGhUuqos7K8GCFZ09TYcarkJl/fPkaZEVdkw8gSv3pkIAO8sLbb2FGCT2DNMFPOUyrcSoaiR5MsWrn8iKegKGS5MZy01EfUM+zA/ynQmVo4CoAGPGYe9t1lhj8p6Cg2w=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, nd <nd@arm.com>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAHxozAACs/mTQABukuQAADud+gAAh4EYAAARjx9AAAiyhgAAAI+eQ
Date: Thu, 3 Mar 2022 02:12:19 +0000
Message-ID:
 <PAXPR08MB74201359DCAD8467EFDE24969E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202251214210.239973@ubuntu-linux-20-04-desktop>
 <PAXPR08MB742081D5E3C94801350C4A739E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203011455500.3261@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74201779FC92E734A5107B769E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203021454090.3261@ubuntu-linux-20-04-desktop>
 <PAXPR08MB742017360AAF65AC2CCB1DF49E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203021751222.3261@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203021751222.3261@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B81200423215694F95CEC5FA6F335A6A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 06bff5a4-147d-46e6-400e-08d9fcbb44bc
x-ms-traffictypediagnostic:
	DB9PR08MB7006:EE_|VE1EUR03FT023:EE_|VI1PR08MB2799:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB27999CA371F9F66B71B802499E049@VI1PR08MB2799.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A8qWI6crxEKmM9mHMMxo+NH+vtOVJKMkliQ9wJSMGfu8iAUUPHtNtFQhoO+k8m7pDLq/njh7H+Re3NsBnm5KZOitdif8VLpW2xh8XNPk6xFTlMYau5j93UuK9p6UBSDv+uneRDE+P9jVS69jbG1ceU878vDJ0JnJOnqs68/apwxG6Kr+pQetJr/1VMFFaCVj9J6J67WlmP4ioduLUk4R8O0/5Fq7aCD91f7XDz0S46oOuOQ8YDV+3EF3ZyKlc7M/wSV5L+nNAOqBMcHMTvpLcwyn5PrsMqNHsp2Q2xWrFoSrtg+HVfhj1qI0pyeCT0YetIrGftTkFgyfACayhMp9VpUAzgunhES4pZ9JAD8W6TdEIrBlZBuOQqXi9D7sZvqRBMFu1Aq5Do8qDM/xrImKzijvWeW5zLLNIOcVvB/Jr1iQK9/ig+zaZKDLOCDdcl2Xnh4tgI8bFmvYd3BXEIUnGECyUj02q9etK5hIFY5wSCMMgcF56iEUSBi4Hv0QJAocVkIsziCqBzXIDw9fiOosiVrfeA6VhQ/LQlNpUYfv8EZXiAXKqXVKd+zKyrX5tx28Z3XB22FPGTTlmJOkirKOEMpJ2tplSoG/qpVSXeTTfQUGvZmoWyQzIxhjM/x0DseBrzg7z5nfVoB1CDYfp/xL27RXIUaVxWzsHi3AEJ2oEbJQl+YmnnfGvrBEACc74I+y2AFryGvAIsXnbYQB7DOesdbeyBQPsqWtxZDro3ox+y4ldmdHgPrh3QKGW07VFJFh35Zowvhd4uSxqk441VBoAwE61ClDfXN04b6GTfyUHSTMPshRIQL+BQDk3JxSNUnt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(38070700005)(5660300002)(66946007)(4326008)(76116006)(508600001)(30864003)(966005)(52536014)(7696005)(186003)(26005)(33656002)(38100700002)(122000001)(64756008)(8676002)(66476007)(66446008)(6506007)(2906002)(55016003)(66556008)(53546011)(9686003)(71200400001)(316002)(6916009)(86362001)(54906003)(83380400001)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dec5d061-a3ff-4e2c-4757-08d9fcbb3f5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	prc0oQOt6wBlYybQ9r+kNmQOYe0ko8Sap937+3TXhz/J5QeDHcpr/RhJFq2RDFgtB0xz7bhY1GT4hFN62wTauLcDNiKP14PH1E/KTlChMUbmxRgZawWWkzKoCKEvGAkSRzUuUxSyjTjs7bpOd6TmfqZoGGEZoJwUoD/f6zD+A/Kdhwarmr/QCi6Rfp0m2JhtqrIdTjLtEVoP7njVBiwTYF7nwZ+qH0jUU+ztYd+cjD5EBqF+Q9Zvg+nRBdEtBOOUgk4Cnsl9xpm07+DSQFJ1iTF/PZKaCiCVbsRwZkpKsG4yZTB6MIFUMmCag0S+gq5BB6Zh+4bFPyFXg+HFgTSaaIKIdyiB7triv0eo1XajhmMk03vB8rjtTg3T8n+aEhTUbh3GHpw6kxfuGlk+1X7bPDIx4fj3uoh6GnRQLBmhmuSqbpaSytguI6+PHOeif+FxL+bKNrtE79aXuYbHdcHzb7rRTkNQYGE4zmQtXu0nHr1n1H40gV5pRbfrEDqGzMTD6ob9bUpTg6cuMB827z2VoDA+NH0CdMDjQrlp8BtIf7zrwhmgNaIrf22bZTj/FI3Sh8q1dBxPFC76ksDFH4sriugfWfORk8XRETkwyraOVj/1eOTtKa/rcNffSEAF8STbWYklS1K+WhxXjQARLB1+dJ0Oc3XeNqDArb7n6dkJ1nSaIkyT13pfghLKQJ4nIEVkFLyA5MrIBI5ScAoFl9mSjCvL7dOhKmCDJIJUy019HG4oJn/hbOL1b5veBCb6wvXHP789Ta2uZAId4NLTqsjGzAb0s/n60MLpgZPcIjGQS+M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6862004)(8676002)(33656002)(4326008)(36860700001)(966005)(81166007)(70206006)(2906002)(82310400004)(70586007)(53546011)(356005)(6506007)(7696005)(9686003)(107886003)(52536014)(508600001)(83380400001)(336012)(8936002)(86362001)(54906003)(30864003)(26005)(186003)(5660300002)(40460700003)(316002)(47076005)(55016003)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 02:12:29.0501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bff5a4-147d-46e6-400e-08d9fcbb44bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2799

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz
5pyIM+aXpSAxMDowNA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQgTWFycXVpcw0K
PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFy
bS5jb20+OyBIZW5yeSBXYW5nDQo+IDxIZW5yeS5XYW5nQGFybS5jb20+OyBuZCA8bmRAYXJtLmNv
bT47IEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbQ0KPiBTdWJqZWN0OiBSRTogUHJvcG9zYWwgZm9y
IFBvcnRpbmcgWGVuIHRvIEFybXY4LVI2NCAtIERyYWZ0QQ0KPiANCj4gT24gVGh1LCAzIE1hciAy
MDIyLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgMiBNYXIgMjAyMiwgV2VpIENoZW4g
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBJZiBub3QsIGFuZCBjb25zaWRlcmluZyB0aGF0IHdl
IGhhdmUgdG8gZ2VuZXJhdGUNCj4gPiA+ID4gPiA+ID4gPiA+IEFSTV9NUFVfKl9NRU1PUllfU1RB
UlQvRU5EIGFueXdheSBhdCBidWlsZCB0aW1lLCB3b3VsZCBpdA0KPiBtYWtlDQo+ID4gPiA+ID4g
c2Vuc2UNCj4gPiA+ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiA+ID4gPiA+IGFsc28gZ2VuZXJhdGUg
bXB1LGd1ZXN0LW1lbW9yeS1zZWN0aW9uLCB4ZW4sc3RhdGljLW1lbSwNCj4gZXRjLg0KPiA+ID4g
YXQNCj4gPiA+ID4gPiBidWlsZA0KPiA+ID4gPiA+ID4gPiA+ID4gdGltZSByYXRoZXIgdGhhbiBw
YXNzaW5nIGl0IHZpYSBkZXZpY2UgdHJlZSB0byBYZW4gYXQNCj4gcnVudGltZT8NCj4gPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBEaWQgeW91IG1lYW4g
d2Ugc3RpbGwgYWRkIHRoZXNlIGluZm9ybWF0aW9uIGluIGRldmljZSB0cmVlLA0KPiBidXQNCj4g
PiA+IGZvcg0KPiA+ID4gPiA+ID4gPiBidWlsZA0KPiA+ID4gPiA+ID4gPiA+IHRpbWUgb25seS4g
SW4gcnVudGltZSB3ZSBkb24ndCBwYXJzZSB0aGVtPw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiBZZXMsIHNvbWV0aGluZyBsaWtlIHRoYXQsIGJ1dCBzZWUgYmVsb3cuDQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBXaGF0J3MgdGhlIHZhbHVlIG9m
IGRvaW5nIEFSTV9NUFVfKl9NRU1PUllfU1RBUlQvRU5EIGF0DQo+IGJ1aWxkDQo+ID4gPiB0aW1l
DQo+ID4gPiA+ID4gYW5kDQo+ID4gPiA+ID4gPiA+ID4gPiBldmVyeXRoaW5nIGVsc2UgYXQgcnVu
dGltZT8NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEFSTV9NUFVfKl9NRU1PUllf
U1RBUlQvRU5EIGlzIGRlZmluZWQgYnkgcGxhdGZvcm0uIEJ1dCBvdGhlcg0KPiA+ID4gdGhpbmdz
DQo+ID4gPiA+ID4gYXJlDQo+ID4gPiA+ID4gPiA+ID4gdXNlcnMgY3VzdG9taXplZC4gVGhleSBj
YW4gY2hhbmdlIHRoZWlyIHVzYWdlIHdpdGhvdXQNCj4gcmVidWlsZA0KPiA+ID4gdGhlDQo+ID4g
PiA+ID4gaW1hZ2UuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEdvb2QgcG9pbnQuDQo+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdlIGRvbid0IHdhbnQgdG8gaGF2ZSB0byByZWJ1
aWxkIFhlbiBpZiB0aGUgdXNlciB1cGRhdGVkIGENCj4gZ3Vlc3QNCj4gPiA+ID4gPiBrZXJuZWws
DQo+ID4gPiA+ID4gPiA+IHJlc3VsdGluZyBpbiBhIGxhcmdlciBib290LW1vZHVsZS1zZWN0aW9u
Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTbyBJIHRoaW5rIGl0IG1ha2VzIHNlbnNl
IHRoYXQgIm1wdSxib290LW1vZHVsZS1zZWN0aW9uIiBpcw0KPiA+ID4gZ2VuZXJhdGVkDQo+ID4g
PiA+ID4gYnkNCj4gPiA+ID4gPiA+ID4gdGhlIHNjcmlwdHMgKGUuZy4gSW1hZ2VCdWlsZGVyKSBh
dCBidWlsZCB0aW1lLCBhbmQgWGVuIHJlYWRzDQo+IHRoZQ0KPiA+ID4gPiA+ID4gPiBwcm9wZXJ0
eSBhdCBib290IGZyb20gdGhlIHJ1bnRpbWUgZGV2aWNlIHRyZWUuDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IEkgdGhpbmsgd2UgbmVlZCB0byBkaXZpZGUgdGhlIGluZm9ybWF0aW9uIGlu
dG8gdHdvIGdyb3VwczoNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gIyBHcm91cDE6IGJvYXJkIGluZm8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhp
cyBpbmZvcm1hdGlvbiBpcyBwbGF0Zm9ybSBzcGVjaWZpYyBhbmQgaXQgaXMgbm90IG1lYW50IHRv
DQo+ID4gPiBjaGFuZ2UNCj4gPiA+ID4gPiA+ID4gZGVwZW5kaW5nIG9uIHRoZSBWTSBjb25maWd1
cmF0aW9uLiBJZGVhbGx5LCB3ZSBidWlsZCBYZW4gZm9yIGENCj4gPiA+ID4gPiBwbGF0Zm9ybQ0K
PiA+ID4gPiA+ID4gPiBvbmNlLCB0aGVuIHdlIGNhbiB1c2UgdGhlIHNhbWUgWGVuIGJpbmFyeSB0
b2dldGhlciB3aXRoIGFueQ0KPiA+ID4gPiA+IGNvbWJpbmF0aW9uDQo+ID4gPiA+ID4gPiA+IG9m
IGRvbTAvZG9tVSBrZXJuZWxzIGFuZCByYW1kaXNrcy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gVGhpcyBraW5kIG9mIGluZm9ybWF0aW9uIGRvZXNuJ3QgbmVlZCB0byBiZSBleHBvc2Vk
IHRvIHRoZQ0KPiBydW50aW1lDQo+ID4gPiA+ID4gPiA+IGRldmljZSB0cmVlLiBCdXQgd2UgY2Fu
IHN0aWxsIHVzZSBhIGJ1aWxkLXRpbWUgZGV2aWNlIHRyZWUgdG8NCj4gPiA+IGdlbmVyYXRlDQo+
ID4gPiA+ID4gPiA+IHRoZSBhZGRyZXNzZXMgaWYgaXQgaXMgY29udmVuaWVudC4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gWEVOX1NUQVJUX0FERFJFU1MsIEFSTV9NUFVfREVWSUNFX01F
TU9SWV8qLCBhbmQNCj4gPiA+ID4gPiBBUk1fTVBVX05PUk1BTF9NRU1PUllfKg0KPiA+ID4gPiA+
ID4gPiBzZWVtIHRvIGJlIHBhcnQgb2YgdGhpcyBncm91cC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBZZXMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiAjIEdyb3VwMjogYm9vdCBjb25maWd1cmF0aW9uDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgYWJvdXQgdGhlIHNwZWNpZmljIHNldCBv
ZiBiaW5hcmllcyBhbmQgVk1zDQo+ID4gPiB0aGF0IHdlDQo+ID4gPiA+ID4gPiA+IG5lZWQgdG8g
Ym9vdC4gSXQgaXMgY29uY2VwdHVhbGx5IHNpbWlsYXIgdG8gdGhlIGRvbTBsZXNzDQo+IGRldmlj
ZQ0KPiA+ID4gdHJlZQ0KPiA+ID4gPiA+ID4gPiBub2RlcyB0aGF0IHdlIGFscmVhZHkgaGF2ZS4g
SWYgd2UgY2hhbmdlIG9uZSBvZiB0aGUgVk0NCj4gYmluYXJpZXMsDQo+ID4gPiB3ZQ0KPiA+ID4g
PiA+ID4gPiBsaWtlbHkgaGF2ZSB0byByZWZyZXNoIHRoZSBpbmZvcm1hdGlvbiBoZXJlLg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAibXB1LGJvb3QtbW9kdWxlLXNlY3Rpb24iIHByb2Jh
Ymx5IGJlbG9uZ3MgdG8gdGhpcyBncm91cA0KPiAodW5sZXNzDQo+ID4gPiB3ZQ0KPiA+ID4gPiA+
IGZpbmQNCj4gPiA+ID4gPiA+ID4gYSB3YXkgdG8gZGVmaW5lICJtcHUsYm9vdC1tb2R1bGUtc2Vj
dGlvbiIgZ2VuZXJpY2FsbHkgc28gdGhhdA0KPiB3ZQ0KPiA+ID4gZG9uJ3QNCj4gPiA+ID4gPiA+
ID4gbmVlZCB0byBjaGFuZ2UgaXQgYW55IHRpbWUgdGhlIHNldCBvZiBib290IG1vZHVsZXMgY2hh
bmdlLikNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJIGFncmVlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IEl0IGxvb2tzIGxp
a2Ugd2UgYXJlIGZvcmNlZCB0byBoYXZlIHRoZSBzZWN0aW9ucw0KPiBkZWZpbml0aW9ucw0KPiA+
ID4gYXQNCj4gPiA+ID4gPiBidWlsZA0KPiA+ID4gPiA+ID4gPiA+ID4gdGltZSBiZWNhdXNlIHdl
IG5lZWQgdGhlbSBiZWZvcmUgd2UgY2FuIHBhcnNlIGRldmljZSB0cmVlLg0KPiBJbg0KPiA+ID4g
dGhhdA0KPiA+ID4gPiA+ID4gPiBjYXNlLA0KPiA+ID4gPiA+ID4gPiA+ID4gd2UgbWlnaHQgYXMg
d2VsbCBkZWZpbmUgYWxsIHRoZSBzZWN0aW9ucyBhdCBidWlsZCB0aW1lLg0KPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IEJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGV2ZW4gYmV0
dGVyIGlmIFhlbiBjb3VsZA0KPiBhdXRvbWF0aWNhbGx5DQo+ID4gPiA+ID4gY2hvb3NlDQo+ID4g
PiA+ID4gPiA+ID4gPiB4ZW4sc3RhdGljLW1lbSwgbXB1LGd1ZXN0LW1lbW9yeS1zZWN0aW9uLCBl
dGMuIG9uIGl0cyBvd24NCj4gPiA+IGJhc2VkIG9uDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4g
PiA+ID4gPiByZWd1bGFyIGRldmljZSB0cmVlIGluZm9ybWF0aW9uICgvbWVtb3J5LCAvYW1iYSwg
ZXRjLiksDQo+ID4gPiB3aXRob3V0DQo+ID4gPiA+ID4gYW55DQo+ID4gPiA+ID4gPiA+IG5lZWQN
Cj4gPiA+ID4gPiA+ID4gPiA+IGZvciBleHBsaWNpdGx5IGRlc2NyaWJpbmcgZWFjaCByYW5nZSB3
aXRoIHRoZXNlIG5ldw0KPiBwcm9wZXJ0aWVzLg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IGZvciBtcHUsZ3Vlc3QtbWVtb3J5LXNlY3Rpb24sIHdp
dGggdGhlIGxpbWl0YXRpb25zOiBubyBvdGhlcg0KPiA+ID4gdXNhZ2UNCj4gPiA+ID4gPiA+ID4g
YmV0d2Vlbg0KPiA+ID4gPiA+ID4gPiA+IGRpZmZlcmVudCBndWVzdCcgbWVtb3J5IG5vZGVzLCB0
aGlzIGlzIE9LLiBCdXQgZm9yDQo+IHhlbixzdGF0aWMtDQo+ID4gPiBtZW0NCj4gPiA+ID4gPiAo
aGVhcCksDQo+ID4gPiA+ID4gPiA+ID4gd2UganVzdCB3YW50IGV2ZXJ5dGhpbmcgb24gYSBNUFUg
c3lzdGVtIGlzIGRlcnRlcm1pc3RpYy4gQnV0LA0KPiBvZg0KPiA+ID4gPiA+IGNvdXJzZQ0KPiA+
ID4gPiA+ID4gPiBYZW4NCj4gPiA+ID4gPiA+ID4gPiBjYW4gc2VsZWN0IGxlZnQgbWVtb3J5IGZv
ciBoZWFwIHdpdGhvdXQgc3RhdGljLW1lbS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
SXQgaXMgZ29vZCB0aGF0IHlvdSB0aGluayB0aGV5IGNhbiBiZSBjaG9zZW4gYnkgWGVuLg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBEaWZmZXJlbnRseSBmcm9tICJib290LW1vZHVsZS1z
ZWN0aW9uIiwgd2hpY2ggaGFzIHRvIGRvIHdpdGgNCj4gdGhlDQo+ID4gPiBib290DQo+ID4gPiA+
ID4gPiA+IG1vZHVsZXMgc2VsZWN0ZWQgYnkgdGhlIHVzZXIgZm9yIGEgc3BlY2lmaWMgZXhlY3V0
aW9uLA0KPiA+ID4gPiA+ID4gPiBndWVzdC1tZW1vcnktc2VjdGlvbiBhbmQgc3RhdGljLW1lbSBh
cmUgWGVuIHNwZWNpZmljIG1lbW9yeQ0KPiA+ID4gPiA+ID4gPiBwb2xpY2llcy9hbGxvY2F0aW9u
cy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQSB1c2VyIHdvdWxkbid0IGtub3cgaG93
IHRvIGZpbGwgdGhlbSBpbi4gQW5kIEkgd29ycnkgdGhhdA0KPiBldmVuIGENCj4gPiA+ID4gPiBz
Y3JpcHQNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBCdXQgdXNlcnMgc2hvdWxkIGtub3cgaXQs
IGJlY2F1c2Ugc3RhdGljLW1lbSBmb3IgZ3Vlc3QgbXVzdCBiZQ0KPiA+ID4gYWxsb2NhdGVkDQo+
ID4gPiA+ID4gPiBpbiB0aGlzIHJhbmdlLiBBbmQgdXNlcnMgdGFrZSB0aGUgcmVzcG9uc2liaWxp
dHkgdG8gc2V0IHRoZQ0KPiBEb21VJ3MNCj4gPiA+ID4gPiA+IHN0YXRpYyBhbGxvY2F0ZSBtZW1v
cnkgcmFuZ2VzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTGV0IG1lIHByZW1pc2UgdGhhdCBteSBn
b2FsIGlzIHRvIGF2b2lkIGhhdmluZyBtYW55IHVzZXJzDQo+IHJlcG9ydGluZw0KPiA+ID4gPiA+
IGVycm9ycyB0byB4ZW4tZGV2ZWwgYW5kIHhlbi11c2VycyB3aGVuIGFjdHVhbGx5IGl0IGlzIGp1
c3QgYSB3cm9uZw0KPiA+ID4gPiA+IGNob2ljZSBvZiBhZGRyZXNzZXMuDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBhIGRpc3RpbmN0aW9uIGJldHdlZW4gYWRk
cmVzc2VzIGZvciB0aGUNCj4gYm9vdA0KPiA+ID4gPiA+IG1vZHVsZXMsIGUuZy4gYWRkcmVzc2Vz
IHdoZXJlIHRvIGxvYWQgeGVuLCB0aGUgZG9tMC9VIGtlcm5lbCwNCj4gZG9tMC9VDQo+ID4gPiA+
ID4gcmFtZGlzayBpbiBtZW1vcnkgYXQgYm9vdCB0aW1lLCBhbmQgVk0gc3RhdGljIG1lbW9yeSBh
ZGRyZXNzZXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUgYm9vdCBtb2R1bGVzIGFkZHJlc3Nl
cyBhcmUgcGFydGljdWxhcmx5IGRpZmZpY3VsdCB0byBmaWxsIGluDQo+ID4gPiBiZWNhdXNlDQo+
ID4gPiA+ID4gdGhleSBhcmUgbWFueSBhbmQgYSBzbWFsbCB1cGRhdGUgaW4gb25lIG9mIHRoZSBt
b2R1bGVzIGNvdWxkDQo+ID4gPiBpbnZhbGlkYXRlDQo+ID4gPiA+ID4gYWxsIHRoZSBvdGhlciBh
ZGRyZXNzZXMuIFRoaXMgaXMgd2h5IEkgZW5kZWQgdXAgd3JpdGluZw0KPiBJbWFnZUJ1aWxkZXIu
DQo+ID4gPiA+ID4gU2luY2UgdGhlbSwgSSByZWNlaXZlZCBzZXZlcmFsIGVtYWlscyBmcm9tIHVz
ZXJzIHRoYW5raW5nIG1lIGZvcg0KPiA+ID4gPiA+IEltYWdlQnVpbGRlciA6LSkNCj4gPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBUaGFua3MgKzk5OSDwn5iKDQo+ID4gPiA+DQo+ID4gPiA+DQo+
ID4gPiA+ID4gVGhlIHN0YXRpYyBWTSBtZW1vcnkgYWRkcmVzc2VzICh4ZW4sc3RhdGljLW1lbSkg
c2hvdWxkIGJlIGEgYml0DQo+IGVhc2llcg0KPiA+ID4gPiA+IHRvIGZpbGwgaW4gY29ycmVjdGx5
LiBUaGV5IGFyZSBtZWFudCB0byBiZSBjaG9zZW4gb25jZSwgYW5kIGl0DQo+ID4gPiBzaG91bGRu
J3QNCj4gPiA+ID4gPiBoYXBwZW4gdGhhdCBhbiB1cGRhdGUgb24gYSBrZXJuZWwgZm9yY2VzIHRo
ZSB1c2VyIHRvIGNoYW5nZSBhbGwNCj4gdGhlIFZNDQo+ID4gPiA+ID4gc3RhdGljIG1lbW9yeSBh
ZGRyZXNzZXMuIEFsc28sIEkga25vdyB0aGF0IHNvbWUgdXNlcnMgYWN0dWFsbHkNCj4gd2FudCB0
bw0KPiA+ID4gPiA+IGJlIGFibGUgdG8gY2hvb3NlIHRoZSBkb21VIGFkZHJlc3NlcyBieSBoYW5k
IGJlY2F1c2UgdGhleSBoYXZlDQo+ID4gPiBzcGVjaWZpYw0KPiA+ID4gPiA+IG5lZWRzLiBTbyBp
dCBpcyBnb29kIHRoYXQgd2UgY2FuIGxldCB0aGUgdXNlciBjaG9vc2UgdGhlIGFkZHJlc3Nlcw0K
PiBpZg0KPiA+ID4gPiA+IHRoZXkgd2FudCB0by4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4g
PiBZZXMuDQo+ID4gPiA+DQo+ID4gPiA+ID4gV2l0aCBhbGwgb2YgdGhhdCBzYWlkLCBJIGRvIHRo
aW5rIHRoYXQgbWFueSB1c2VycyB3b24ndCBoYXZlIGFuDQo+ID4gPiBvcGluaW9uDQo+ID4gPiA+
ID4gb24gdGhlIFZNIHN0YXRpYyBtZW1vcnkgYWRkcmVzc2VzIGFuZCB3b24ndCBrbm93IGhvdyB0
byBjaG9vc2UNCj4gdGhlbS4NCj4gPiA+ID4gPiBJdCB3b3VsZCBiZSBlcnJvciBwcm9uZSB0byBs
ZXQgdGhlbSB0cnkgdG8gZmlsbCB0aGVtIGluIGJ5IGhhbmQuDQo+IFNvIEkNCj4gPiA+ID4gPiB3
YXMgYWxyZWFkeSBwbGFubmluZyBvbiBhZGRpbmcgc3VwcG9ydCB0byBJbWFnZUJ1aWxkZXIgdG8N
Cj4gPiA+IGF1dG9tYXRpY2FsbHkNCj4gPiA+ID4gPiBnZW5lcmF0ZSB4ZW4sc3RhdGljLW1lbSBm
b3IgZG9tMGxlc3MgZG9tYWlucy4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBMZXQgbWUg
bWFrZSBzdXJlIHRoYXQncyB3aGF0IHlvdSBzYWlkOiBVc2VycyBnaXZlIGFuIFZNIG1lbW9yeSBz
aXplDQo+IHRvDQo+ID4gPiA+IEltYWdlQnVpbGRlciwgYW5kIEltYWdlQnVpbGRlciB3aWxsIGdl
bmVyYXRlIHhlbixzdGF0aWMtbWVtID0gPHN0YXJ0LA0KPiA+ID4gc2l6ZT4uDQo+ID4gPiA+IEZv
ciBzcGVjaWZpYyBWTSwgSW1hZ2VCdWlsZGVyIGFsc28gY2FuIGFjY2VwdCBzdGFydCBhbmQgc2l6
ZSBhcw0KPiBpbnB1dHM/DQo+ID4gPiA+DQo+ID4gPiA+IERvIEkgdW5kZXJzdGFuZCB0aGlzIGNv
cnJlY3RseT8NCj4gPiA+DQo+ID4gPiBZZXMsIGV4YWN0bHkNCj4gPiA+DQo+ID4gPg0KPiA+ID4g
PiA+IEdvaW5nIGJhY2sgdG8gdGhpcyBzcGVjaWZpYyBkaXNjdXNzaW9uIGFib3V0IGJvb3QtbW9k
dWxlLXNlY3Rpb246DQo+IEkNCj4gPiA+IGNhbg0KPiA+ID4gPiA+IHNlZSBub3cgdGhhdCwgZ2l2
ZW4geGVuLHN0YXRpYy1tZW0gaXMgY2hvc2VuIGJ5IEltYWdlQnVpbGRlciAob3INCj4gPiA+ID4N
Cj4gPiA+ID4gQnkgaGFuZCA6ICkNCj4gPiA+ID4NCj4gPiA+ID4gPiBzaW1pbGFyKSBhbmQgbm90
IFhlbiwgdGhlbiBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIEltYWdlQnVpbGRlciAob3INCj4gPiA+
ID4gPiBzaW1pbGFyKSBhbHNvIGdlbmVyYXRlIGJvb3QtbW9kdWxlLXNlY3Rpb24uDQo+ID4gPiA+
ID4NCj4gPiA+ID4NCj4gPiA+ID4gSWYgbXkgYWJvdmUgdW5kZXJzdGFuZGluZyBpcyByaWdodCwg
dGhlbiB5ZXMuDQo+ID4gPg0KPiA+ID4gWWVzLCBJIHRoaW5rIHdlIGFyZSBvbiB0aGUgc2FtZSBw
YWdlDQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4gPiA+ID4gbGlrZSBJbWFnZUJ1aWxkZXIgd291bGRu
J3QgYmUgdGhlIGJlc3QgcGxhY2UgdG8gcGljayB0aGVzZQ0KPiB2YWx1ZXMNCj4gPiA+IC0tDQo+
ID4gPiA+ID4gPiA+IHRoZXkgc2VlbSB0b28gImltcG9ydGFudCIgdG8gbGVhdmUgdG8gYSBzY3Jp
cHQuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEJ1dCBpdCBzZWVtcyBwb3NzaWJsZSB0
byBjaG9vc2UgdGhlIHZhbHVlcyBpbiBYZW46DQo+ID4gPiA+ID4gPiA+IC0gWGVuIGtub3dzIEFS
TV9NUFVfTk9STUFMX01FTU9SWV8qIGJlY2F1c2UgaXQgd2FzIGRlZmluZWQgYXQNCj4gPiA+IGJ1
aWxkDQo+ID4gPiA+ID4gdGltZQ0KPiA+ID4gPiA+ID4gPiAtIFhlbiByZWFkcyBib290LW1vZHVs
ZS1zZWN0aW9uIGZyb20gZGV2aWNlIHRyZWUNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
SXQgc2hvdWxkIGJlIHBvc3NpYmxlIGF0IHRoaXMgcG9pbnQgZm9yIFhlbiB0byBwaWNrIHRoZSBi
ZXN0DQo+ID4gPiB2YWx1ZXMNCj4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiA+ID4gZ3Vlc3QtbWVt
b3J5LXNlY3Rpb24gYW5kIHN0YXRpYy1tZW0gYmFzZWQgb24gdGhlIG1lbW9yeQ0KPiBhdmFpbGFi
bGUuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSG93IFhlbiB0byBw
aWNrPyBEb2VzIGl0IG1lYW4gaW4gc3RhdGljIGFsbG9jYXRpb24gRG9tVSBEVCBub2RlLA0KPiB3
ZQ0KPiA+ID4ganVzdA0KPiA+ID4gPiA+ID4gbmVlZCBhIHNpemUsIGJ1dCBkb24ndCByZXF1aXJl
IGEgc3RhcnQgYWRkcmVzcyBmb3Igc3RhdGljLW1lbT8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFll
cyB0aGUgaWRlYSB3YXMgdGhhdCB0aGUgdXNlciB3b3VsZCBvbmx5IHByb3ZpZGUgdGhlIHNpemUg
KGUuZy4NCj4gPiA+ID4gPiBET01VX1NUQVRJQ19NRU1bMV09MTAyNCkgYW5kIHRoZSBhZGRyZXNz
ZXMgd291bGQgYmUgYXV0b21hdGljYWxseQ0KPiA+ID4gPiA+IGNhbGN1bGF0ZWQuIEJ1dCBJIGRp
ZG4ndCBtZWFuIHRvIGNoYW5nZSB0aGUgZXhpc3RpbmcgeGVuLHN0YXRpYy0NCj4gbWVtDQo+ID4g
PiA+ID4gZGV2aWNlIHRyZWUgYmluZGluZ3MuIFNvIGl0IGlzIGJlc3QgaWYgdGhlIHhlbixzdGF0
aWMtbWVtDQo+IGFkZHJlc3Nlcw0KPiA+ID4gPiA+IGdlbmVyYXRpb24gaXMgZG9uZSBieSBJbWFn
ZUJ1aWxkZXIgKG9yIHNpbWlsYXIgdG9vbCkgaW5zdGVhZCBvZg0KPiBYZW4uDQo+ID4gPiA+ID4N
Cj4gPiA+ID4NCj4gPiA+ID4gSWYgd2Ugc3RpbGwga2VlcCB0aGUgb3B0aW9uIGZvciB1c2VyIHRv
IHNwZWNpZnkgdGhlIHN0YXJ0IGFuZCBzaXplDQo+ID4gPiA+IHBhcmFtZXRlcnMgZm9yIFZNIG1l
bW9yeSwgYmVjYXVzZSBpdCBtYXliZSB2ZXJ5IGltcG9ydGFudCBmb3IgYQ0KPiA+ID4gPiBkZXRl
cm1pbmlzdGljIHN5c3RlbSAoZnVsbHkgc3RhdGljIHN5c3RlbSksIEkgYWdyZWUgd2l0aCB5b3Uu
DQo+ID4gPiA+DQo+ID4gPiA+IEFuZCBpbiBjdXJyZW50IHN0YXRpYy1hbGxvY2F0aW9uLCBJIHRo
aW5rIFhlbiBkb2Vzbid0IGdlbmVyYXRlDQo+ID4gPiA+IHhlbixzdGF0aWMtbWVtIGFkZHJlc3Nl
cywgYWxsIGJ5IGhhbmRzLi4uDQo+ID4gPg0KPiA+ID4gWWVhaA0KPiA+ID4NCj4gPg0KPiA+IEkg
d2lsbCB1cGRhdGUgbXkgcHJvcG9zYWwgdG8gY292ZXIgb3VyIGFib3ZlIGRpc2N1c3Npb24sIGJ1
dCBJIGZvcmdvdA0KPiBvbmUNCj4gPiB0aGluZy4gQXMgdGhlIHBsYXRmb3JtIGhlYWRlciBmaWxl
cyB3aWxsIGJlIGdlbmVyYXRlZCBmcm9tIERUUywgZG9lcyBpdA0KPiA+IG1lYW4gd2UgaGF2ZSB0
byBtYWludGFpbiBwbGF0Zm9ybSBkdHMgZmlsZXMgaW4gWGVuIGxpa2Ugd2hhdCBaZXBoeXIgaGFz
DQo+ID4gZG9uZT8NCj4gDQo+IEkgd291bGQgcHJlZmVyIG5vdCB0byBoYXZlIHRvIG1haW50YWlu
IHBsYXRmb3JtIGR0cyBmaWxlcyBpbiBYZW4gbGlrZQ0KPiBaZXBoeXIgaXMgZG9pbmcuIElkZWFs
bHksIHRoZSB1c2VyIHNob3VsZCBiZSBhYmxlIHRvIHRha2UgYW55DQo+IHNwZWMtY29tcGxpYW50
IGRldmljZSB0cmVlIGZpbGUgYW5kIHVzZSBpdC4gSSB3b3VsZCBzYXk6IGxldCdzIHN0YXJ0DQo+
IHdpdGhvdXQgYWRkaW5nIHRoZSBkdHMgZmlsZXMgdG8gWGVuICh3ZSBtaWdodCBoYXZlIG9uZSB1
bmRlciBkb2NzLyBidXQNCj4ganVzdCBhcyBhbiBleGFtcGxlLikgV2UgY2FuIGFkZCB0aGVtIGxh
dGVyIGlmIHRoZSBuZWVkIGFyaXNlLg0KPiANCg0KQnV0IHdpdGhvdXQgYW55IGRlZmF1bHQgZHRz
LCB0aGF0IG1lYW5zIHdlIGNhbid0IHN0YXJ0IHRvIGJ1aWxkIFhlbiBmb3INCnY4Uj8gSXQgc2Vl
bXMgaW4gdGhpcyBjYXNlLCB3ZSBuZWVkIE1ha2VmaWxlIHRvIHByaW50IHNvbWUgbWVzc2FnZSB0
bw0KdGVsbCB1c2VycyB0byBzcGVjaWZpYyBoaXMvaGVyIGR0cyBwYXRoLg0KDQo+IA0KPiA+IEFu
ZCBkbyB5b3UgaGF2ZSBzb21lIGlkZWEgdG8gaW50ZWdyYXRlIHRoZSAiSW1hZ2VCdWlsZGVyIj8g
TWFrZSBpdA0KPiA+IGFzIGEgc3VibW9kdWxlIG9mIFhlbiBvciBpbnRlZ3JhdGUgdG8geGVuLXRv
b2xzPw0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IGlmIEltYWdlQnVpbGRlciB3YXMg
a2VwdCBhcyBhIHNlcGFyYXRlDQo+IHJlcG9zaXRvcnkgYmVjYXVzZSB0aGVyZSBzaG91bGQgYmUg
bm8gc3Ryb25nIHRpZXMgYmV0d2VlbiBJbWFnZUJ1aWxkZXINCj4gdmVyc2lvbnMgYW5kIFhlbiB2
ZXJzaW9ucy4gSXQgaXMgbW9yZSBjb252ZW5pZW50IHRvIGhhbmRsZSBpdCBpbiBhDQo+IHNlcGFy
YXRlIHJlcG9zaXRvcnksIGVzcGVjaWFsbHkgYXMgWW9jdG8gYW5kIG90aGVyIGJ1aWxkIHN5c3Rl
bXMgbWlnaHQNCj4gY2xvbmUgSW1hZ2VCdWlsZGVyIGR1cmluZyB0aGUgYnVpbGQgdG8gZ2VuZXJh
dGUgYm9vdC5zY3IgKGl0IGlzIGFscmVhZHkNCj4gdGhlIGNhc2UpLg0KPiANCj4gVGhhdCBzYWlk
LCBpdCBtaWdodCBiZSBnb29kIHRvIG1ha2UgaXQgbW9yZSAib2ZmaWNpYWwiIGJ1dCBtb3Zpbmcg
aXQgdG8NCj4gWGVuIFByb2plY3QuIEkgY2FuIHRhbGsgdG8gR2VvcmdlIGFib3V0IGNyZWF0aW5n
DQo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvaW1hZ2VidWlsZGVyLmdpdCBvcg0K
PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvaW1hZ2VidWlsZGVyLg0KDQpUaGF0J3Mg
Z29vZCA6ICkNCg0K

