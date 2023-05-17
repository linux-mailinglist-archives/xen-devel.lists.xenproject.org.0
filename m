Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE070654B
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 12:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535847.833897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzERf-0002Ve-Ld; Wed, 17 May 2023 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535847.833897; Wed, 17 May 2023 10:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzERf-0002So-ID; Wed, 17 May 2023 10:31:47 +0000
Received: by outflank-mailman (input) for mailman id 535847;
 Wed, 17 May 2023 10:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMB/=BG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzERe-0002Sa-3w
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 10:31:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f827fe-f49e-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 12:31:44 +0200 (CEST)
Received: from DU2PR04CA0289.eurprd04.prod.outlook.com (2603:10a6:10:28c::24)
 by GV1PR08MB7682.eurprd08.prod.outlook.com (2603:10a6:150:61::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 10:31:41 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::60) by DU2PR04CA0289.outlook.office365.com
 (2603:10a6:10:28c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Wed, 17 May 2023 10:31:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17 via Frontend Transport; Wed, 17 May 2023 10:31:40 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Wed, 17 May 2023 10:31:40 +0000
Received: from 8ee269bb859f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEBDE5C0-E84B-4A77-8FEE-01E33163475F.1; 
 Wed, 17 May 2023 10:31:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ee269bb859f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 May 2023 10:31:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 10:31:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%6]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 10:31:31 +0000
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
X-Inumbo-ID: 04f827fe-f49e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6znffPVqR9NmWxnKAD9FJRV42x1Y5ng492Dynk2du0c=;
 b=YXJVCFOrTiPhtHECELcIYdkhN60dGFS8CRyOyNoP0QRRLrxSYRZ6LBBr98SVgQqTRXU80+cqbEJrl4/C1QYzoH5DCuM/a5zCIBRUDarLWhxFOZuWu3yB6ba02bRk/exlkdYR6/6E5MyG4mWACimNq8ZSqMZ7JE8YHxBTgAU0b4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46005cd57f16f872
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNxAsaEWRC4wo1eMRxDD+relLPzJhKLn2f5TF5RAsNzT56NFvkVSR3IV0pRepDJFb7zrul14vVQV+lTK5aVEnW6qdHhB+yI9jtbqD4gKJIpatOZRnjqDUap7V/G9avmohPxz+n0ULuQIREhzU/xqC4aXUwnG+3avbjLSVqsfEU0f09Uh/Ek0JXfIRLHGZ3ZeEYzjcDXjMxDOc+ojDCbCR68P55yaapqOk0VZpFDuL5XCeajt8/sH5cG+OnQ1hcNhsVs1kACauNNKNGM5Bu3dVByWavtAUBgKU7gLMr9qeS2nS0POOVoKlVl56aVqiv+TKreu15gQ0r6mJFTuFUgpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6znffPVqR9NmWxnKAD9FJRV42x1Y5ng492Dynk2du0c=;
 b=PiuzufHlJWddZNVn3Yy4h26PKwbWKeczJ/C8KzosYl6KHYYtHntdr1DUkFWGyuYvVaYdGicQyC7g+mHymNUeNpvQmk/YHK4RlLnUZvlDtiB/T5AIf3ktqX8KASbcKhEe3+H2P3KqbXOmupAKjotT4e9oqQbJhDKymrDZIo+aadUpIpD+B53fBjjbsUCr10d3O8l75G58ncBcEVHyQQqOVI5pIlum8AvXhPtU1V5Sg/UUBlwN/uW2DRRZJXBg2+m7x6PNoo9kXujNz6BYFxLEJ+B2YTEFkZ2ubDEtW9bUaukPFPqhQVYaJrNTpkiAMA3CKjjwoGNmUuG9H6DQ8PIX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6znffPVqR9NmWxnKAD9FJRV42x1Y5ng492Dynk2du0c=;
 b=YXJVCFOrTiPhtHECELcIYdkhN60dGFS8CRyOyNoP0QRRLrxSYRZ6LBBr98SVgQqTRXU80+cqbEJrl4/C1QYzoH5DCuM/a5zCIBRUDarLWhxFOZuWu3yB6ba02bRk/exlkdYR6/6E5MyG4mWACimNq8ZSqMZ7JE8YHxBTgAU0b4k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Topic: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Index: AQHZfpRdAeUKdaL5DEawBEGR+YhUoK9dwh0AgACWKYA=
Date: Wed, 17 May 2023 10:31:30 +0000
Message-ID: <3A4E52B2-B33D-46FC-A1DB-4935AF06CC49@arm.com>
References: <20230504142523.2989306-1-luca.fancellu@arm.com>
 <20230504142523.2989306-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305161827050.128889@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2305161827050.128889@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB7929:EE_|DBAEUR03FT058:EE_|GV1PR08MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b5a4f4-10c4-440c-e9df-08db56c1e6b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KNKAuGy0sw1x1uR96WqAAvteNNbZmqZkoVd8cr71FGRO7SgmuDg1VioWTJpjiZsjPT7Lnp4e+6Tgj+Ql+IMmBY6dGjjUeLFcsIfOP55+uEk8JvNKIV0rEerVnYgCCGGIPl3EsBlWLwLy4jqtaZiMkwLW7IAWxiN+2wvWiiTFXcKnPWS3dkb4bih5cINqz++WjhK3kSmd4ranUSBlryr0cro7z8KZx6ZXRK3yXLojJIaHLAlnF/k/EzQv0gF9DLsHSd3IHrM2V7UPX2FZiA+XweG8n1cCZxxNmmxCOjNLUy4y9mJhDEdS8ANhtEQZ5/S6tDdpRVSBQIQyEppj6GYKUsyTSFJxmyTThOq1xfMqK219F1piF76D/Yat3S7+qY6mVJ1B8AZIaL7/3AEw6+PM1zaLOEwSq+8qjNUZZuxAeZd8KLOFWzbrW0qGc42YmiryuvQ4FNJ350+xm0Y/ZHHaQoTWmovtnr7Uf4HpqyeWMR2t/uLoiclmhwhIqhcxIeSEHCzN2xw8Ap4t63N0GNjjK0NvtO+8elUI4txpjhPmhN/DqbJx02xTlIYdrUrFyZ4n1MwJOkXGUlbEET4FyKg4uTvMe4ZNtLq/uNPoIWCRwfutSKW594a8ArIsEv6XVDoVpv1yAvvR9eEdul8pD2F7FA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(6506007)(6512007)(38070700005)(53546011)(2906002)(186003)(86362001)(26005)(83380400001)(2616005)(36756003)(38100700002)(33656002)(122000001)(71200400001)(41300700001)(6486002)(4326008)(6916009)(76116006)(66946007)(66446008)(66476007)(66556008)(64756008)(316002)(91956017)(54906003)(478600001)(5660300002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <66CE121E50BCB14C84B9938ADA893F1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	577f6b67-aeca-4fc1-147f-08db56c1e0b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LrskEluYhuhatyJwlBPJx4owPqU36aKBRoO1oZK0ThRpoX6+UuMDCRgDjqM4NFKolPkj5hRQWC4t+me2WrD9QJ2AO6tDt8wo5r42ajslsxoOvmYuLxaQcvt6UxA2QvBU8JOzMCGMLOKwelglNn8aTldSeYJrUI1aTud9uGcYJGpEasA7UmK46cLTBryxSRHRpT+h5mVr8TVJ4nEZg0egpiGiuudejULitn3Cshg7oU69a8qAOb3DRVBCTUKtnq+ViWVrVucF1zM6RhIOwRONbZposb+HEtJyI0lsCJLiIAo/pU60i6WFpqG6TFYPCz61e6cZ+oTL/U22WQyHneFDAyfyPMYMCNYFoIjZWyA+9x1T3OXhrvOJMjcNMNVlp4DKxX+mHTrDAgSPL+A3l9/Rab5c7IlVqp9BAf0bRXoShGKSp/1QOn+HgIpVaO52mAUuQZaQR5ksYL6HozCn85KE8Fx3AHA7+ZfL6dXVs+MmKXjaPwVLSu10PdWCpMIgjqiq4SUz1ZecRkD11UNeoNLYpXbpT3n6UIJm3YH0CdSNs9ztXf3qHED0U2F4caOlHe7fcT1/G+TQAbkVzCMRQl4/rYBxGHmFudiPtLUqTC30gPY/6IwbOvNbjU/xwGFRrrH+VDWHL+QYA4yYN9xWjOSm5CJMV681x3GqrBydcDgIcofHC6QzilTWzuF2NEnWrjbZql/Q+5T0wnPDfp2tSp5f9frYhYTIEIEZ9Y05aRbu1+IkfwHcPLUhYYkG6G7nCcS7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(4326008)(356005)(6862004)(8676002)(82740400003)(316002)(40480700001)(41300700001)(70586007)(478600001)(81166007)(70206006)(54906003)(8936002)(40460700003)(6506007)(186003)(36756003)(2616005)(82310400005)(53546011)(6512007)(83380400001)(2906002)(26005)(47076005)(33656002)(86362001)(336012)(36860700001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 10:31:40.2259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b5a4f4-10c4-440c-e9df-08db56c1e6b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7682

DQoNCj4gT24gMTcgTWF5IDIwMjMsIGF0IDAyOjMzLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCA0IE1heSAyMDIzLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4gQWRkIGEgZmVhdHVyZSB0byB0aGUgZGlmZi1yZXBvcnQucHkg
c2NyaXB0IHRoYXQgaW1wcm92ZXMgdGhlIGNvbXBhcmlzb24NCj4+IGJldHdlZW4gdHdvIGFuYWx5
c2lzIHJlcG9ydCwgb25lIGZyb20gYSBiYXNlbGluZSBjb2RlYmFzZSBhbmQgdGhlIG90aGVyDQo+
PiBmcm9tIHRoZSBjaGFuZ2VzIGFwcGxpZWQgdG8gdGhlIGJhc2VsaW5lLg0KPj4gDQo+PiBUaGUg
Y29tcGFyaXNvbiBiZXR3ZWVuIHJlcG9ydHMgb2YgZGlmZmVyZW50IGNvZGViYXNlIGlzIGFuIGlz
c3VlIGJlY2F1c2UNCj4+IGVudHJpZXMgaW4gdGhlIGJhc2VsaW5lIGNvdWxkIGhhdmUgYmVlbiBt
b3ZlZCBpbiBwb3NpdGlvbiBkdWUgdG8gYWRkaXRpb24NCj4+IG9yIGRlbGV0aW9uIG9mIHVucmVs
YXRlZCBsaW5lcyBvciBjYW4gZGlzYXBwZWFyIGJlY2F1c2Ugb2YgZGVsZXRpb24gb2YNCj4+IHRo
ZSBpbnRlcmVzdGVkIGxpbmUsIG1ha2luZyB0aGUgY29tcGFyaXNvbiBiZXR3ZWVuIHR3byByZXZp
c2lvbnMgb2YgdGhlDQo+PiBjb2RlIGhhcmRlci4NCj4+IA0KPj4gSGF2aW5nIGEgYmFzZWxpbmUg
cmVwb3J0LCBhIHJlcG9ydCBvZiB0aGUgY29kZWJhc2Ugd2l0aCB0aGUgY2hhbmdlcw0KPj4gY2Fs
bGVkICJuZXcgcmVwb3J0IiBhbmQgYSBnaXQgZGlmZiBmb3JtYXQgZmlsZSB0aGF0IGRlc2NyaWJl
cyB0aGUNCj4+IGNoYW5nZXMgaGFwcGVuZWQgdG8gdGhlIGNvZGUgZnJvbSB0aGUgYmFzZWxpbmUs
IHRoaXMgZmVhdHVyZSBjYW4NCj4+IHVuZGVyc3RhbmQgd2hpY2ggZW50cmllcyBmcm9tIHRoZSBi
YXNlbGluZSByZXBvcnQgYXJlIGRlbGV0ZWQgb3Igc2hpZnRlZA0KPj4gaW4gcG9zaXRpb24gZHVl
IHRvIGNoYW5nZXMgdG8gdW5yZWxhdGVkIGxpbmVzIGFuZCBjYW4gbW9kaWZ5IHRoZW0gYXMNCj4+
IHRoZXkgd2lsbCBhcHBlYXIgaW4gdGhlICJuZXcgcmVwb3J0Ii4NCj4+IA0KPj4gSGF2aW5nIHRo
ZSAicGF0Y2hlZCBiYXNlbGluZSIgYW5kIHRoZSAibmV3IHJlcG9ydCIsIG5vdyBpdCdzIHNpbXBs
ZQ0KPj4gdG8gbWFrZSB0aGUgZGlmZiBiZXR3ZWVuIHRoZW0gYW5kIHByaW50IG9ubHkgdGhlIGVu
dHJ5IHRoYXQgYXJlIG5ldy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8
bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiANCj4gVGhpcyBpcyBhbiBhbWF6aW5nIHdvcmshISBU
aGFua3MgTHVjYSENCj4gDQo+IEkgYW0gaGF2aW5nIGlzc3VlcyB0cnlpbmcgdGhlIG5ldyBwYXRj
aCBmZWF0dXJlLiBBZnRlciBhcHBseWluZyB0aGlzDQo+IHBhdGNoIEkgZ2V0Og0KPiANCj4gc3N0
YWJlbGxpbmlAdWJ1bnR1LWxpbnV4LTIwLTA0LWRlc2t0b3A6L2xvY2FsL3JlcG9zL3hlbi11cHN0
cmVhbS94ZW4kIC4vc2NyaXB0cy9kaWZmLXJlcG9ydC5weQ0KPiBUcmFjZWJhY2sgKG1vc3QgcmVj
ZW50IGNhbGwgbGFzdCk6DQo+ICBGaWxlICIuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkiLCBsaW5l
IDUsIGluIDxtb2R1bGU+DQo+ICAgIGZyb20geGVuX2FuYWx5c2lzLmRpZmZfdG9vbC5kZWJ1ZyBp
bXBvcnQgRGVidWcNCj4gIEZpbGUgIi9sb2NhbC9yZXBvcy94ZW4tdXBzdHJlYW0veGVuL3Njcmlw
dHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9kZWJ1Zy5weSIsIGxpbmUgNCwgaW4gPG1vZHVsZT4N
Cj4gICAgZnJvbSAucmVwb3J0IGltcG9ydCBSZXBvcnQNCj4gIEZpbGUgIi9sb2NhbC9yZXBvcy94
ZW4tdXBzdHJlYW0veGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9yZXBvcnQucHki
LCBsaW5lIDQsIGluIDxtb2R1bGU+DQo+ICAgIGZyb20gLnVuaWZpZWRfZm9ybWF0X3BhcnNlciBp
bXBvcnQgVW5pZmllZEZvcm1hdFBhcnNlciwgQ2hhbmdlU2V0DQo+ICBGaWxlICIvbG9jYWwvcmVw
b3MveGVuLXVwc3RyZWFtL3hlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvdW5pZmll
ZF9mb3JtYXRfcGFyc2VyLnB5IiwgbGluZSA1NiwgaW4gPG1vZHVsZT4NCj4gICAgY2xhc3MgVW5p
ZmllZEZvcm1hdFBhcnNlcjoNCj4gIEZpbGUgIi9sb2NhbC9yZXBvcy94ZW4tdXBzdHJlYW0veGVu
L3NjcmlwdHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC91bmlmaWVkX2Zvcm1hdF9wYXJzZXIucHki
LCBsaW5lIDU3LCBpbiBVbmlmaWVkRm9ybWF0UGFyc2VyDQo+ICAgIGRlZiBfX2luaXRfXyhzZWxm
LCBhcmdzOiBzdHIgfCBsaXN0KSAtPiBOb25lOg0KPiBUeXBlRXJyb3I6IHVuc3VwcG9ydGVkIG9w
ZXJhbmQgdHlwZShzKSBmb3IgfDogJ3R5cGUnIGFuZCAndHlwZScNCj4gDQo+IEFsc28gZ290IGEg
c2ltaWxhciBlcnJvciBlbHNld2hlcmU6DQo+IA0KPiBzc3RhYmVsbGluaUB1YnVudHUtbGludXgt
MjAtMDQtZGVza3RvcDovbG9jYWwvcmVwb3MveGVuLXVwc3RyZWFtL3hlbiQgLi9zY3JpcHRzL2Rp
ZmYtcmVwb3J0LnB5IC0tcGF0Y2ggfi9wLzEgLWIgL3RtcC8xIC1yIC90bXAvMQ0KPiBUcmFjZWJh
Y2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICBGaWxlICIuL3NjcmlwdHMvZGlmZi1yZXBv
cnQucHkiLCBsaW5lIDEyNywgaW4gPG1vZHVsZT4NCj4gICAgbWFpbihzeXMuYXJndlsxOl0pDQo+
ICBGaWxlICIuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkiLCBsaW5lIDEwMiwgaW4gbWFpbg0KPiAg
ICBkaWZmcyA9IFVuaWZpZWRGb3JtYXRQYXJzZXIoZGlmZl9zb3VyY2UpDQo+ICBGaWxlICIvbG9j
YWwvcmVwb3MveGVuLXVwc3RyZWFtL3hlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wv
dW5pZmllZF9mb3JtYXRfcGFyc2VyLnB5IiwgbGluZSA3OSwgaW4gX19pbml0X18NCj4gICAgc2Vs
Zi5fX3BhcnNlKCkNCj4gIEZpbGUgIi9sb2NhbC9yZXBvcy94ZW4tdXBzdHJlYW0veGVuL3Njcmlw
dHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC91bmlmaWVkX2Zvcm1hdF9wYXJzZXIucHkiLCBsaW5l
IDk0LCBpbiBfX3BhcnNlDQo+ICAgIGRlZiBwYXJzZV9kaWZmX2hlYWRlcihsaW5lOiBzdHIpIC0+
IENoYW5nZVNldCB8IE5vbmU6DQo+IFR5cGVFcnJvcjogdW5zdXBwb3J0ZWQgb3BlcmFuZCB0eXBl
KHMpIGZvciB8OiAndHlwZScgYW5kICdOb25lVHlwZScNCj4gDQo+IE15IFB5dGhvbiBpcyAyLjcu
MTgNCj4gDQo+IA0KPiBBbSBJIHVuZGVyc3RhbmRpbmcgY29ycmVjdGx5IHRoYXQgb25lIHNob3Vs
ZCBydW4gdGhlIHNjYW4gZm9yIHRoZQ0KPiBiYXNlbGluZSAoc2F2aW5nIHRoZSByZXN1bHQgc29t
ZXdoZXJlKSwgdGhlbiBhcHBseSB0aGUgcGF0Y2gsIHJ1biB0aGUNCj4gc2NhbiBhZ2Fpbi4gRmlu
YWxseSwgb25lIHNob3VsZCBjYWxsIGRpZmYtcmVwb3J0LnB5IHBhc3NpbmcgLWINCj4gYmFzZWxp
bmUtcmVwb3J0IC1yIG5ldy1yZXBvcnQgLS1wYXRjaCB0aGUtcGF0Y2gtYXBwbGllZD8NCg0KSGkg
U3RlZmFubywNCg0KWWVzIGluZGVlZCwgdGhhdCBwcm9jZWR1cmUgaXMgY29ycmVjdCwgSSB0aGlu
ayB0aGUgZXJyb3IgeW91IGFyZSBzZWVpbmcgY29tZXMgZnJvbSB0aGUgcHl0aG9uIHZlcnNpb24s
DQpJIGFtIHVzaW5nIHB5dGhvbiAzLCB2ZXJzaW9uIDMuMTAuNi4NCg0KVGhlIGVycm9yIHNlZW1z
IHRvIGNvbWUgZnJvbSBweXRob24gYW5ub3RhdGlvbnMsIEnigJltIHN1cnByaXNlZCB5b3UgZGlk
buKAmXQgaGl0IGl0IHdoZW4gdGVzdGluZyB0aGUgZmlyc3QgcGF0Y2gsDQpkaWQgeW91IHVzZSBw
eXRob24yIGZvciB0aGF0Pw0KDQpJcyBpdCBhIHByb2JsZW0gaWYgSSBkZXZlbG9wZWQgdGhlIHRv
b2wgaGF2aW5nIGluIG1pbmQgaXRzIHVzYWdlIHdpdGggcHl0aG9uMz8NCg0KQ2hlZXJzLA0KTHVj
YQ0KDQo=

