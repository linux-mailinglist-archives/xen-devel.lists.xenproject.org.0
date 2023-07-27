Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0869764CE3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570941.893572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwM3-0005qb-5z; Thu, 27 Jul 2023 08:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570941.893572; Thu, 27 Jul 2023 08:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwM3-0005nm-1q; Thu, 27 Jul 2023 08:28:15 +0000
Received: by outflank-mailman (input) for mailman id 570941;
 Thu, 27 Jul 2023 08:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LQce=DN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qOwM1-0005nV-Sa
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:28:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2041.outbound.protection.outlook.com [40.107.13.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e4444c-2c57-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:28:10 +0200 (CEST)
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:27:34 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d1:cafe::48) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Thu, 27 Jul 2023 08:27:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Thu, 27 Jul 2023 08:27:34 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Thu, 27 Jul 2023 08:27:33 +0000
Received: from ad388fb1f4ef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EE72499-661C-4BD7-802B-D83046ADFC0E.1; 
 Thu, 27 Jul 2023 08:27:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad388fb1f4ef.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jul 2023 08:27:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7364.eurprd08.prod.outlook.com (2603:10a6:150:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:27:23 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::845:4a4f:5c99:2788]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::845:4a4f:5c99:2788%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:27:22 +0000
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
X-Inumbo-ID: 84e4444c-2c57-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKxpga72nqPY4sgEjHuulPIqRAsInboxIb0rF9uA1/4=;
 b=M0PYPUY7yEOqU9lQLxMW5qFRr5O3phckIzZFWRhvGFeiwN+rz2EAfgq7i0nFfWQ1AHAbJ8UYuOyVXow3Ih8X6asyy88rB4lpuAa4kJ6zJ9iTHo9jeLaby6tV2I9WAOmaLYprPgUkd3pToka+ST9fZe6I9r6kDB954R6+mRY3JjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00da35aab5e9d6bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te6cPj1ISvk9W1LIClQYlvgzcs5Shk2rVQ+XuEeQ9Yfob9LoKR2vCPC6WSRE5LyC2Ytzsn8e0PLlqVmHfVGy6dVFXI3PV83Oxt0nWEQo3fOoNI4tySCidREH6poa4pJTdQ5M1aXMehtceSsYDEMv4QCiNTW1PipHnY4wcabhcN0Il1EFrABmgLZvcNNCQijMP6/+xoQ62MNWlZb8KVMjFB8QU32oweymAvkKR/x8qDz6sKyrItTGLvM021uBMctYnrkrDaMVqdMbwu4K2bD5STJby/Q82M/24WMHX0CGPq9KCDYMFK24MJB//b+V4l4i3jDQpgsDbsclhAmDttreFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKxpga72nqPY4sgEjHuulPIqRAsInboxIb0rF9uA1/4=;
 b=h7hFharNKOIgAjsPykpAH2SpFuSYAbeuUbhdlFMozmWclNMfDwxRD/rozUKmK6J4oHMim44u/ecnEyOzAWQ3xa7pp0euvKTUT7hr990MocGoCk84QYSkPAXK1mLZFQ768w+dKaTGObQRT3RvLzCbPrFcoX3sJSdhajundbH011ah1vlDz5qUWF0prZNsknta4zWXSaccbQEBA8rd6jYywRRARPWhi0uw6D0zmWdW3YTBXdAXXBnvSc5rMrFYOuqi93uwFeAYZ7vt7K0staQUZrBRUTam0eDVD7E05Hx8Az9EpbbW9UK3z6T5G4VhG6Ma8BNAH8DcFapTeOwViRJsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKxpga72nqPY4sgEjHuulPIqRAsInboxIb0rF9uA1/4=;
 b=M0PYPUY7yEOqU9lQLxMW5qFRr5O3phckIzZFWRhvGFeiwN+rz2EAfgq7i0nFfWQ1AHAbJ8UYuOyVXow3Ih8X6asyy88rB4lpuAa4kJ6zJ9iTHo9jeLaby6tV2I9WAOmaLYprPgUkd3pToka+ST9fZe6I9r6kDB954R6+mRY3JjU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Jane
 Malalane <jane.malalane@citrix.com>
Subject: Re: [PATCH v3] xen/evtchn: Introduce new IOCTL to bind static evtchn
Thread-Topic: [PATCH v3] xen/evtchn: Introduce new IOCTL to bind static evtchn
Thread-Index: AQHZuWtwf8IRAxHBCk+t/yOpmXpN2a/NKtwAgAAqfQA=
Date: Thu, 27 Jul 2023 08:27:22 +0000
Message-ID: <5EB0D195-8DEF-4817-89DC-62BAEB888720@arm.com>
References:
 <ae7329bf1713f83e4aad4f3fa0f316258c40a3e9.1689677042.git.rahul.singh@arm.com>
 <270ed8f7-c645-502e-39c5-c93823037b9c@suse.com>
In-Reply-To: <270ed8f7-c645-502e-39c5-c93823037b9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV1PR08MB7364:EE_|AM7EUR03FT007:EE_|AM9PR08MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 032d36ee-8285-48a5-d6ec-08db8e7b53d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P1zpJMGgpurO2DQUlna42pz++yajc5J5TyoQ3Sog1QoqTrAn5iKJB37MxmR0rZzZCo+1iC0oRBbjtxQHZWw9ua9S+kzrjwpVynphChJUQRLMLiPmFzFgPcSEUs/hJTgl3HeUS/98RHjsSAtl+xXSwxUKi7NSVeO+UB4A+VmWk76Z1r3/oVpzd/GiKuouCuXbUVAo/W4Mszufv4sxkwtNifIyJ5ynYiV3Jbpx+81jDYUlsIZpIn46GQzo3yLp7+xpgiFl4gWZZJ44aewZqhrtWprolar3TMxHk6/o3CUB13werLRb4/1exobqIoMuY6JdpcDDrjTXIkJz01xsCy6zjvqI+KatZebcvENlfFrIgtBNBWBeQhNkEBRuFvJeGZNmaavZEuOtjFci11mgvDIFr8T8sRXuRsr5KqdDunw6VAxKrZWFi/ZAoC9T8oGMUUrGUi86XkVMUUHL4Sr0OBKiLGl2OWAy0zJcAXqvOl14Spaazm/UxAze5I2sIUIF8gf0AOOl1EKXhj9X294xI2KNWNoWHFoepMiy0WYW8fg9Z4fhsrxWrpyro+6NZ8yzLxN8AZpIynxMrpGmAUWtbruWQPD/0Qg5ev5D5moIYH4ZU+lNf515UY/s7QjoV8hYfnkcjAjx11In7o1o3tkKb6niEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(83380400001)(54906003)(5660300002)(2906002)(2616005)(6486002)(38070700005)(71200400001)(53546011)(26005)(86362001)(6512007)(38100700002)(91956017)(478600001)(122000001)(41300700001)(316002)(66446008)(186003)(66556008)(66946007)(66476007)(76116006)(64756008)(6506007)(33656002)(6916009)(8676002)(8936002)(36756003)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22E9F541B7EE654BA363FABC7684315D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95435532-9fb3-406f-aa17-08db8e7b4d20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+plm0jjeyzo4+3fGjtblnPOWwhpq7H6TcjWzxFsAQmUPjuEtDsgGPKi08frD6XJVEv2OPdu56Hi1A6ocpaIvRAEUlqxiFJAKfntp6dTW/ochwlwaXWRk9Jby2Qel50Rmv+/xPzvDkSLljVBvtGEOUu6PqTH2lUnHrzfayw89DTPGC8yEG7MasbMPs0NUH2JBUm6LZYmk6RbpgmUuHyLO44owFnCPJn5v4DvzlIXSyNtZXlwAGPQCJ2uHw8558bhFKHG5PbLL6ftr2UYrZujEZ7PXdkBCzKg8gzAplMBLf1e8i2bnyL+VziJu82rqZeDVU02BcAkCB609Su6M8S0l/1ynG5j45JdwixWCpQu9Bx/+6v2MGAbalXOvZ7nzpi2R5oORtwD9+6CgCzL9dHq6IbAMGn70HcXLTeqIeWsxreDWDxcJ0iHJls9dJkzvNz33Plei2GWffFSIn4I7tqFfoiG3DQqW4pxBrWl89cWa8QpOwxZtW/5BUkWtBukzHV4QT/k3K64qrPOAqzdznXJYvPzQxAsoX8ICM4Y9lgN3RyuU6vQPjJzlh9ddZ4jOMuV741Yu1vW4d7JwGeeqXJzgsUxKLC2xRE4WKQoiswaXb78ZF+bfYQ2Zgz3dgpu/XLMuLH3MLvjijZOpYajqZ6WQ0fBemtUBVo3IIZyXAi7TzfyOSGdG4rdHeUMFMekD2r1XjcctZ+mEemxFOgI4gV68t65T23e8JnuCK+q76DGpCMr3tIm0sD14zI2kRemSIwm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(6486002)(6512007)(54906003)(478600001)(83380400001)(36860700001)(86362001)(40460700003)(36756003)(33656002)(40480700001)(6862004)(53546011)(2906002)(2616005)(47076005)(107886003)(336012)(6506007)(26005)(186003)(82740400003)(81166007)(70586007)(316002)(70206006)(4326008)(41300700001)(8936002)(356005)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:27:34.1339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 032d36ee-8285-48a5-d6ec-08db8e7b53d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004

SEkgSnVlcmdlbiwNCg0KPiBPbiAyNyBKdWwgMjAyMywgYXQgNjo1NCBhbSwgSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE4LjA3LjIzIDEzOjMxLCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+IFhlbiA0LjE3IHN1cHBvcnRzIHRoZSBjcmVhdGlvbiBvZiBzdGF0
aWMgZXZ0Y2hucy4gVG8gYWxsb3cgdXNlciBzcGFjZQ0KPj4gYXBwbGljYXRpb24gdG8gYmluZCBz
dGF0aWMgZXZ0Y2hucyBpbnRyb2R1Y2UgbmV3IGlvY3RsDQo+PiAiSU9DVExfRVZUQ0hOX0JJTkRf
U1RBVElDIi4gRXhpc3RpbmcgSU9DVEwgZG9pbmcgbW9yZSB0aGFuIGJpbmRpbmcNCj4+IHRoYXTi
gJlzIHdoeSB3ZSBuZWVkIHRvIGludHJvZHVjZSB0aGUgbmV3IElPQ1RMIHRvIG9ubHkgYmluZCB0
aGUgc3RhdGljDQo+PiBldmVudCBjaGFubmVscy4NCj4+IFN0YXRpYyBldnRjaG5zIHRvIGJlIGF2
YWlsYWJsZSBmb3IgdXNlIGR1cmluZyB0aGUgbGlmZXRpbWUgb2YgdGhlDQo+PiBndWVzdC4gV2hl
biB0aGUgYXBwbGljYXRpb24gZXhpdHMsIF9fdW5iaW5kX2Zyb21faXJxKCkgZW5kcyB1cCBiZWlu
Zw0KPj4gY2FsbGVkIGZyb20gcmVsZWFzZSgpIGZpbGUgb3BlcmF0aW9ucyBiZWNhdXNlIG9mIHRo
YXQgc3RhdGljIGV2dGNobnMNCj4+IGFyZSBnZXR0aW5nIGNsb3NlZC4gVG8gYXZvaWQgY2xvc2lu
ZyB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwsIGFkZCB0aGUNCj4+IG5ldyBib29sIHZhcmlhYmxl
ICJpc19zdGF0aWMiIGluICJzdHJ1Y3QgaXJxX2luZm8iIHRvIG1hcmsgdGhlIGV2ZW50DQo+PiBj
aGFubmVsIHN0YXRpYyB3aGVuIGNyZWF0aW5nIHRoZSBldmVudCBjaGFubmVsIHRvIGF2b2lkIGNs
b3NpbmcgdGhlDQo+PiBzdGF0aWMgZXZ0Y2huLg0KPj4gQWxzbywgdGFrZSB0aGlzIG9wcG9ydHVu
aXR5IHRvIHJlbW92ZSB0aGUgb3Blbi1jb2RlZCB2ZXJzaW9uIG9mIHRoZQ0KPj4gZXZ0Y2huIGNs
b3NlIGluIGRyaXZlcnMveGVuL2V2dGNobi5jIGZpbGUgYW5kIHVzZSB4ZW5fZXZ0Y2huX2Nsb3Nl
KCkuDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4N
Cj4gDQo+IFB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNi41YQ0KDQpUaGFua3MuDQoN
ClJlZ2FyZHMsDQpSYWh1bA0KDQo=

