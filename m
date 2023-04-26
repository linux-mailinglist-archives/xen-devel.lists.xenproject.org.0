Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264256EEF5E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526528.818347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZhf-0005qe-Sk; Wed, 26 Apr 2023 07:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526528.818347; Wed, 26 Apr 2023 07:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZhf-0005oY-PT; Wed, 26 Apr 2023 07:36:39 +0000
Received: by outflank-mailman (input) for mailman id 526528;
 Wed, 26 Apr 2023 07:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prZhe-0005oS-BJ
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:36:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e8b700-e405-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 09:36:36 +0200 (CEST)
Received: from DUZPR01CA0223.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::10) by AS2PR08MB8574.eurprd08.prod.outlook.com
 (2603:10a6:20b:55d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 07:36:31 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::9f) by DUZPR01CA0223.outlook.office365.com
 (2603:10a6:10:4b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 07:36:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Wed, 26 Apr 2023 07:36:31 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 26 Apr 2023 07:36:31 +0000
Received: from 63161baa45d4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A64543B8-D42A-434D-8D57-7E7432CEBD59.1; 
 Wed, 26 Apr 2023 07:36:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63161baa45d4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 07:36:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 07:36:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 07:36:16 +0000
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
X-Inumbo-ID: 12e8b700-e405-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGaej4NQ+uswKUQdRV/BuZd/DUx0sCqy/7Xx/koFV/Y=;
 b=21le+bEfe3gEkCb6+RDupx1QUYuxNsf6QEnxbO5yCi8gt/1z0bOQTwjyGX0UzPvH+Yi6GiF3D9rvBBgtDrGAGekATle15eJbp1s9DOzqYRzcJJ3VpOwjcLXOp/pLWRaeS9KupFZrEsdRWHK0ppoMYdlWbFjuFMi9Qap7WAZyQkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0qpccbsyImua9+2a7u2zfDoorXpKTcXLlrW1Do6NX1XVGA3NA75smXoTjCaEIYdcXwaEtvH6QUYP16/mJkLCDdPM+7Uw1Q4UIqUoKeSfTmONddF6mvgwCGl4ttbllfJVWs6ioYP8ihWt/zmnbZc4Eh31zpCZhbCcuxkntNmqxhrOx6bNLqxDGMeGZsd73Txn6wyQtwIsGq26UZOO7+EIzCgrFRSLpzfawcDTE/F4B/bsz3cv8Hf/mQbUVViOTfqu+zN+camLAiXuFjT+YbYdhO6NQbO3b2J+N8guObibNBKj2gl5bX7PSw8X/506R/5+1SpkGj0VJjxV72509X38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGaej4NQ+uswKUQdRV/BuZd/DUx0sCqy/7Xx/koFV/Y=;
 b=PF2bNFS9ck3ji2QedmH95lbkDyb+Di8FNHtVn28myAMMm0S5sFj2JTbiRtlscWytbu1kCRMdAHKpNszuxC/9RPjfs1FG6xS+2+UMacg5T7xj7CLVURmsn7lkLwXp2sV0rZL9VubFDEz1DrXTPew1Buetgqv2i3IWjS5RyvVMQLutOispjK8GQN2UO7rS8BlpE9Bp0KHfRbCVqeusW/DaeZFMQhQYmmGMNxwI6P8UTIjqyK3y1kV3fXafpUq8bFD/jsdqquB26sHpnYs0T3sdgptEGcbW9/H1Njgs54nMQCzowE4/0/qwuMlgJ9lBFSS+hklrdvqM8TkT1Zw5e1vWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGaej4NQ+uswKUQdRV/BuZd/DUx0sCqy/7Xx/koFV/Y=;
 b=21le+bEfe3gEkCb6+RDupx1QUYuxNsf6QEnxbO5yCi8gt/1z0bOQTwjyGX0UzPvH+Yi6GiF3D9rvBBgtDrGAGekATle15eJbp1s9DOzqYRzcJJ3VpOwjcLXOp/pLWRaeS9KupFZrEsdRWHK0ppoMYdlWbFjuFMi9Qap7WAZyQkA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index: AQHZd0ulMpqFICe/LUiDVq6+aDsW9687tFqAgAFSIKCAACZ1gIAABguQ
Date: Wed, 26 Apr 2023 07:36:15 +0000
Message-ID:
 <AS8PR08MB79919EAEDCD85073CAECE5DD92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
In-Reply-To: <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C65C67E0A067E549B0CF886F5CD35384.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB8029:EE_|DBAEUR03FT035:EE_|AS2PR08MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8ebd0c-9e46-4431-11e9-08db4628f441
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KpBdWNWAapWcvGOJ0/RDOuoP4feRFHeFQnweZWbNmLJ3nEJ0GqH6cuO1MkJAnwI32Pve79v6a9/uH+7sVA5mqssKgz3JxdzJkpeCleFbI73J2rdfhEbm4DkuCtXC0luE9zcznhsn/8Vtx3JxQmgGS3omnj6y2rPwNY3BTwZuK9Tk1V4TKT90zuW0BzjrT04pnSkoT1suf+e5rzZuaXZk6M/v75HHGTLIm/1wh7Dq27AHhMqgJq+ZC/oSNeHsxRJJyyy271VRvo39c7mdglDW9K5H9VSU1KOB0C7YI1I0gXO99gNhHDjHSXh+pyxKiim7fyGJYB4tS6zEwm4P0jGFEgX8suUaIKEZpZZv8qPg7sBHJVUC5+eNZtAaBp/SPcE8C0tKW4Rvi/4StIZyfF5Xtj0VEAaePSrOhE8mWLFRQCN+jBHxT2q806fhu1ypr2O0fayCFCMZcbEYbGsFnIU7TnwebV4Y3y1rmoVFZMcrNgo0urcDRrPp5WkHMtDInJ+UXGOfiqpPOteTieiv1VaQnfHXxRtSAosN6AYtDHZVAT+KTQT5qqiWTqxoQvQOKfOiHSdCG9gMQFg2MRCIIqBrjjvv7+PxfUSKYdyKyqNbW5g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(451199021)(9686003)(26005)(6506007)(53546011)(186003)(478600001)(33656002)(54906003)(966005)(7696005)(5660300002)(71200400001)(52536014)(8936002)(8676002)(2906002)(38070700005)(316002)(4326008)(86362001)(6916009)(64756008)(66446008)(66476007)(66946007)(76116006)(66556008)(38100700002)(41300700001)(122000001)(55016003)(83380400001)(66899021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b267ac2b-827b-4dc0-c8fa-08db4628eb11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NVN2aEBQYwdIcgynD7WxChkjNQH30HqGts/MtQqcV424JUL2lNGNmaW1MpRk+7y2WNKkiH4SmAUiciJW1az+iiK0h3w7bWSgmBJNMGipaFxQjMcYr5MEW8+/XXOthyRa7C1Si9nAgy45sGN1YvtBFdW79uMLvYffoRd1bHnwmAc7smiqJQt1+GZ/cT/Mssb9yAy7bIsCqBmf6m+Bs5KEUD44QuM4jVWHAYzFSxPL/BOBqiEgZv4g13vsYyZQh6U+QxxITpfEyh55Hlod6AXuBsaO8uXtK/sm06ggc7oNA8fYHSnyvyOeI+EtJVr2jl7y2XXUI4RPahdKAHPCCMix2g2ySVuIoB/Nl4XZpPZDFx6QfNGbbKwH4KBKE2AdFxKBr96bG8drgRA3j/0rTqHrcPH53ZrJtaW4E0BhPvbF4SKNNJ6Kjg0vFHf9IDPWl6TTGBIeX1fb90GGBRnKfFGjUinnfXQpBbQQ/76+iCBRjPrYaVE6vd3SW3TigfsYo8ncDnpSs5QmgQHcjEmy1b4QvLwvjCM279hqsSUwAVON0cqV9KoaQDqgX5ZBQm0SmLu6+rAg9XswRf85su31SIZnaXYMY6+90fxzlo/BhmBCCNUKeDBMvGcUanHlW0jIM1rvy4W9kWZHYmmD8cCYdKaM0xFU9vC7mJgDnd9iQyj38FsLtdopUzGphj2QNLybwm2Hhw/TrVYOmXmQjfTk5N9xktkL0iCkMEoWL2dMH9TCOuk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(66899021)(82740400003)(316002)(40460700003)(4326008)(81166007)(41300700001)(5660300002)(356005)(52536014)(8936002)(6862004)(8676002)(82310400005)(33656002)(86362001)(2906002)(40480700001)(55016003)(53546011)(966005)(7696005)(9686003)(6506007)(26005)(478600001)(34070700002)(36860700001)(83380400001)(336012)(186003)(47076005)(54906003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:36:31.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8ebd0c-9e46-4431-11e9-08db4628f441
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8574

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOS8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIE5VTUEg
ZGlzdGFuY2UgbWFwDQo+IA0KPiBPbiAyNi4wNC4yMDIzIDA4OjI5LCBIZW5yeSBXYW5nIHdyb3Rl
Og0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+DQo+ID4+PiArICAgICAgICBkaXN0YW5jZSA9IGR0
X25leHRfY2VsbCgxLCAmbWF0cml4KTsNCj4gPj4NCj4gPj4gVXBvbiBzZWNvbmQgdGhvdWdodCBJ
IGNoZWNrZWQgd2hhdCBkdF9uZXh0X2NlbGwoKSByZXR1cm5zOiBZb3UncmUgc2lsZW50bHkNCj4g
Pj4gdHJ1bmNhdGluZyBoZXJlIGFuZCB0aGVuIC4uLg0KPiA+Pg0KPiA+Pj4gKyAgICAgICAgICAg
IC8qIEJpLWRpcmVjdGlvbnMgYXJlIG5vdCBzZXQsIHNldCBib3RoICovDQo+ID4+PiArICAgICAg
ICAgICAgbnVtYV9zZXRfZGlzdGFuY2UoZnJvbSwgdG8sIGRpc3RhbmNlKTsNCj4gPj4+ICsgICAg
ICAgICAgICBudW1hX3NldF9kaXN0YW5jZSh0bywgZnJvbSwgZGlzdGFuY2UpOw0KPiA+Pg0KPiA+
PiAuLi4gaGVyZSBhZ2Fpbi4gSXMgdGhhdCByZWFsbHkgdGhlIGludGVudGlvbj8NCj4gPg0KPiA+
IEJ5IGh1bnRpbmcgZG93biB0aGUgaGlzdG9yaWNhbCBkaXNjdXNzaW9ucyBJIGZvdW5kIHRoYXQg
dXNpbmcgZHRfbmV4dF9jZWxsKCkNCj4gaXMNCj4gPiB3aGF0IEp1bGllbiBzdWdnZXN0ZWQgMiB5
ZWFycyBhZ28gaW4gdGhlIFJGQyBzZXJpZXMgWzFdLiBHaXZlbiB0aGUgdHJ1bmNhdGlvbg0KPiA+
IGhlcmUgaXMgZm9yIG5vZGUgaWQgKGZyb20vdG8pIGFuZCBkaXN0YW5jZSB3aGljaCBJIGFtIHBy
ZXR0eSBzdXJlIHdpbGwgbm90DQo+ID4gZXhjZWVkIDMyLWJpdCByYW5nZSwgSSB0aGluayB0aGUg
c2lsZW50IHRydW5jYXRpb24gaXMgc2FmZS4NCj4gDQo+IFRoYXQgZGlzY3Vzc2lvbiBpcyBvcnRo
b2dvbmFsOyB0aGUgcHJldmlvdXNseSB1c2VkIGR0X3JlYWRfbnVtYmVyKCkgaXMgbm8NCj4gZGlm
ZmVyZW50IGluIHRoZSByZWdhcmQgSSdtIHJlZmVycmluZyB0by4NCj4gDQo+ID4gSG93ZXZlciBJ
IHVuZGVyc3RhbmQgeW91ciBwb2ludCBoZXJlLCB0aGUgc2lsZW50IHRydW5jYXRpb24gaXMgbm90
IGlkZWFsLCBzbw0KPiA+IEkgd29uZGVyIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyB0byBp
bXByb3ZlLCBkbyB5b3UgdGhpbmsgSSBzaG91bGQNCj4gY2hhbmdlDQo+ID4gdGhlc2UgdmFyaWFi
bGVzIHRvIHU2NCBvciBtYXliZSBJIG5lZWQgdG8gZG8gdGhlIGV4cGxpY2l0IHR5cGUgY2FzdCBv
ciBhbnkNCj4gPiBiZXR0ZXIgc3VnZ2VzdGlvbnMgZnJvbSB5b3U/IFRoYW5rcyENCj4gDQo+IFNv
IG9uZSB0aGluZyBJIG92ZXJsb29rZWQgaXMgdGhhdCBieSBwYXNzaW5nIDEgYXMgdGhlIGZpcnN0
IGFyZ3VtZW50LCB5b3UNCj4gb25seSByZXF1ZXN0IGEgMzItYml0IHZhbHVlLiBIZW5jZSB0aGVy
ZSdzIG5vIChzaWxlbnQpIHRydW5jYXRpb24gdGhlbiBvbg0KPiB0aGUgZHRfbmV4dF9jZWxsKCkg
dXNlcy4gQnV0IHRoZSBudW1hX3NldF9kaXN0YW5jZSgpIGNhbGxzIHN0aWxsIHRydW5jYXRlDQo+
IHRvIDggYml0cy4gQWRkaW5nIGV4cGxpY2l0IHR5cGUgY2FzdHMgd29uJ3QgaGVscCBhdCBhbGwg
LSB0cnVuY2F0aW9uIHdpbGwNCj4gcmVtYWluIGFzIHNpbGVudCBhcyBpdCB3YXMgYmVmb3JlLiBI
b3dldmVyLCBudW1hX3NldF9kaXN0YW5jZSgpJ3MgZmlyc3QNCj4gdHdvIGFyZ3VtZW50cyBjb3Vs
ZCBlYXNpbHkgYmVjb21lICJ1bnNpZ25lZCBpbnQiLCByZXN1bHRpbmcgaW4gaXRzIG5vZGUNCj4g
cmVsYXRlZCBib3VuZHMgY2hlY2tpbmcgdG8gdGFrZSBjYXJlIG9mIGFsbCB0cnVuY2F0aW9uIGlz
c3Vlcy4gVGhlDQo+ICJkaXN0YW5jZSIgcGFyYW1ldGVyIGFscmVhZHkgaXMgdW5zaWduZWQgaW50
LCBhbmQgaXMgYWxyZWFkeSBiZWluZyBib3VuZHMNCj4gY2hlY2tlZCBhZ2FpbnN0IE5VTUFfTk9f
RElTVEFOQ0UuDQoNCkdyZWF0IHBvaW50cyEgVGhhbmtzIGZvciBwb2ludGluZyB0aGUgOC1iaXQg
dHJ1bmNhdGlvbiBvdXQuIFlvdSBhcmUgY29ycmVjdC4NClNvbWVob3cgbXkgaW1wcmVzc2lvbiBv
ZiBudW1hX3NldF9kaXN0YW5jZSgpJ3MgZmlyc3QgdHdvIGFyZ3VtZW50cyBhcmUNCmFscmVhZHkg
InVuc2lnbmVkIGludCIgc28gSSBtaXNzZWQgdGhpcyBwYXJ0Li4uU29ycnkuDQoNCkluIHRoYXQg
Y2FzZSwgSSB0aGluayBJIHdpbGwgYWRkIGEgY2hlY2sgYmV0d2VlbiAiZnJvbSwgdG8iIGFuZCBN
QVhfTlVNTk9ERVMNCmFzIHNvb24gYXMgdGhlIHZhbHVlcyBvZiAiZnJvbSIgYW5kICJ0byIgYXJl
IHBvcHVsYXRlZCBieSBkdF9uZXh0X2NlbGwoKS4NCkhvcGVmdWxseSB0aGlzIHdpbGwgYWRkcmVz
cyB5b3VyIGNvbmNlcm4uDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KPiAN
Cj4gPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDIxLQ0KPiAwOC9tc2cwMTE3NS5odG1sDQo+ID4NCj4gPiBLaW5kIHJlZ2FyZHMsDQo+
ID4gSGVucnkNCg0K

