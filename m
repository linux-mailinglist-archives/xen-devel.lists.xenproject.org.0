Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BA646B1C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456917.714779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Cfs-000069-Kk; Thu, 08 Dec 2022 08:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456917.714779; Thu, 08 Dec 2022 08:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Cfs-0008VD-HS; Thu, 08 Dec 2022 08:54:36 +0000
Received: by outflank-mailman (input) for mailman id 456917;
 Thu, 08 Dec 2022 08:54:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/A3=4G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p3Cfr-0008V6-7M
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:54:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee502ff5-76d5-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 09:54:31 +0100 (CET)
Received: from AS8PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:20b:312::31)
 by AS2PR08MB9103.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 08:54:05 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312::4) by AS8PR04CA0056.outlook.office365.com
 (2603:10a6:20b:312::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 8 Dec 2022 08:54:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.14 via Frontend Transport; Thu, 8 Dec 2022 08:54:05 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Thu, 08 Dec 2022 08:54:05 +0000
Received: from 0b4493b3c022.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F74ACD47-3467-4EDC-9DE0-FB53A5901BA5.1; 
 Thu, 08 Dec 2022 08:53:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b4493b3c022.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Dec 2022 08:53:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8367.eurprd08.prod.outlook.com (2603:10a6:150:b0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 8 Dec
 2022 08:53:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Thu, 8 Dec 2022
 08:53:48 +0000
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
X-Inumbo-ID: ee502ff5-76d5-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wb4d9UR5Zugk40nZOAR5r469bFJgjPQE/oAUUG2tM4=;
 b=uHWZolWvfetvWYppQkNLNDb4yPOEbKOFuL2NnUPO6JDCFR71Me5acxePavO+U/pD7y3yH2a7q54Pnwy9fRjL3ZnsiDh0T7oVp7z9TRYXExYNz6b8iMnU1eSGiDznUwCjdBwdklx1ZDBbeG2KFHNC5IwwCyA0t6XxEfWF2Ny9p1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6o2O5h9vFpx4qHG2AHbXqWUyhLq6lQxSi5vtnSu5GmKlxDwmN8UvKq3ys/N2gY004H2M7j3bttK8VruTSeqwvHR1NRk9Re6G5j9zoEP7sn2hJIlRj4pUAuYGwMlPrptAnMLOZJfi/wN/8NXaYmPb+Ne3+F78Dek10EiEb+4Vpl+sJc/jfTYVdCs8ArJjdn2xujEkXYy+EdR4AfG+GXQFXXEWmoVZaqaC3jgIm41vQg5ChiWvPZMQqab6afk2Qfi4MNJlFTljQb3zdc4Oq5xG8ZJVT45h5SJ3IcE7IspIwhv77veaEpsYd6gYmQICUc3gV5yqcvxuaH2TV+lm6F2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wb4d9UR5Zugk40nZOAR5r469bFJgjPQE/oAUUG2tM4=;
 b=X41mFiTFN6L4BwVrqUxCBvW7vP36+tGBfpqRdJIU+gEQPqQHYoAmIeQgh7/NxOAxBqgZjbcniXZF6NY8kaUVDK6TSlswUw/G/Z+fiX31Ax6NIuBVRyCJj1qRBLsokwQeG+fnXjSS36HEBhjUXZ2Aa5jH/iyCISEDJxUkFRFJnuRlXCY9VJvrM7viaVoozOYmVyiISv5xWJ5FXCyGYwTjbUKjXp/SMzC9zzFx3CDYUV2vaUxMNCrcabdTSvHO45HQxCWeimFregDPgjNP4F4wzwrqJhzTYB0RFxO2Y+/CUCXOz4CNxtvvJzliYK+DxP2doPgDvbu2kRbJfDtcGXEEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wb4d9UR5Zugk40nZOAR5r469bFJgjPQE/oAUUG2tM4=;
 b=uHWZolWvfetvWYppQkNLNDb4yPOEbKOFuL2NnUPO6JDCFR71Me5acxePavO+U/pD7y3yH2a7q54Pnwy9fRjL3ZnsiDh0T7oVp7z9TRYXExYNz6b8iMnU1eSGiDznUwCjdBwdklx1ZDBbeG2KFHNC5IwwCyA0t6XxEfWF2Ny9p1w=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, Julien Grall <julien@xen.org>
CC: Ard Biesheuval <ardb@kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Topic: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Index: AQHZCuISzshQ7NkOqUOBoTPM3AzEWa5jro+g
Date: Thu, 8 Dec 2022 08:53:48 +0000
Message-ID:
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
In-Reply-To: <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B6DD5E4A5AD4F549AA5C55F5DE9DE6FA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8367:EE_|AM7EUR03FT058:EE_|AS2PR08MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfd0c3c-7783-4b05-be2d-08dad8f9c2de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 97Z17c7tATiHtnmYcqq4u4wHZT5fyWFlZ2vpk1QWXuwQHCsJWpNkb+QQi62cWUEBHBbbVZ+SrekKkkps3m0fqtPfs+R9k0sWhuFfx9hPWeNUPZje97T5Q/AdYx6oWnJ3aovxGYoPJFVsSvbksd03tvsOik9/0jZWUXTnwO6UNbdPavg6BoiX9ZsyQUjIUYpIRZA6m9a0Qw6zp9vn4SMO6MaggRLhyuiaiqiGqAG8f6cTf+rr3eA0joSntb8w77GEbfs5gQ5JTetAkJPwgIeaQt+9XDtr/KcU9+CbDq7Uan5qE9LSGrVdWaBAZsBxjCqlDihkV1Cti2xe1TyYx7WqzAs7vfg7P471KQIxyvxD1t7AiKy1ahZC4fFhc2Scjt8vuucCqiDL/LMMSse9s6uT9JK3vTwnxiJtKeKDjejncAaz/ENDnTZzpoPzf7cFFx6xAi9xGP+pUHdo0DT+HplhrMU3M1X0GpYBqUdVrM2rlqiH4hMZtcilDa9fbYeJqDdbyoXCq8MTRXx19Q9pEkYBfi8SNIrCmNPS2tt+8iylJdrtHK2dI3S1hvwxMEzRbEhlSQTTOgFaphd8lR6qzaOXzY7YaSSwDlFkWbY/zZHKlM0WxNJl3JS9Rjt2dhoAd8gSq1ZZBC8OvakCX+aNHDK4Gwxnn+lIUF9yk0SHSgwnqxp9cR0RvXX46FU8nfQGPJprBheQ8D6uWWG5/AEMfqT14UVrCPaXy58NV3/v2g0qwfs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199015)(110136005)(54906003)(52536014)(26005)(4326008)(71200400001)(8936002)(7696005)(66476007)(316002)(33656002)(66446008)(5660300002)(122000001)(83380400001)(66946007)(55016003)(38070700005)(478600001)(86362001)(186003)(76116006)(6506007)(66556008)(64756008)(41300700001)(53546011)(966005)(9686003)(8676002)(2906002)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05fee164-75e3-4566-604e-08dad8f9b8eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4sitFLsO6kPa6jHPH2lXoswFMmPYwgz9VlLRdOVHNDlH0dp0OfI5Ho7o11xfqGEKMexe5BuoylgBW26EP0L3WvamhhxT1iGZ8HV15vlUSwA5E0DT9ciRVzDLbXpYkONQGDu/UM2vgm+FnqL1V+m6CpPcd4GDaBF9WPFwMMs9y6t32txRBjn5CAGiEVtCOAo2SpHeda8CxpS8Y14j7uJIg8SPkyosFQHF31TYCss3DwBOPG/6vkzWU97THTe0Oyv/eSJhkpUOdRuqsdbqcN1LK/YW4qwXR6tsOGITKERACa75AMmupidhobVhsNtm/H4/Zx09HLEgLFSMnflg7evQmp7vkbv+fBKENrHp+7bGIM4VdcFfOFskbLtOmqH37eQkMKVZiOjCmy3B3XwjWA/bDUfElMBAG9D9plHY2dwb6lettwByYT3eDQ2XuifolK8pDWN3Lwl9RDV2CCpcW/Na5APXPYFN5ct0tnIcP1SqS6sBKaMEkXJM6e2QF0e1p1Ad/doRVIV9/4pqvXvxNWVqrdFS5okj7les/76FU0Xo606ynADnp1rijJHEzW89gvy+JMqjloDTAbyW5XYchCSW+r5E5Kzc22RjBfAL1IOH+MHPfSKVIasEA+kRYH7TEK4ky+WEmTJ2+ndT0MJnsym1OtKzGNkHn3sYmvT+pHiRtiA3C/t2QohsQ6+Qc3qDNTqntxbFV4luUWvHLLoWgrKY5fNvlzYDe3FYkgbPwuWYcwA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(55016003)(40480700001)(966005)(7696005)(86362001)(81166007)(6506007)(40460700003)(26005)(53546011)(478600001)(4326008)(9686003)(41300700001)(54906003)(110136005)(8936002)(2906002)(70586007)(52536014)(5660300002)(316002)(70206006)(82310400005)(83380400001)(36860700001)(82740400003)(186003)(336012)(8676002)(356005)(33656002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:54:05.3555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfd0c3c-7783-4b05-be2d-08dad8f9c2de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9103

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gVXNlIEVm
aUFDUElSZWNsYWltTWVtb3J5IGZvciBFU1JUDQo+IA0KPiBPbiAwNy4xMi4yMDIyIDIzOjQyLCBE
ZW1pIE1hcmllIE9iZW5vdXIgd3JvdGU6DQo+ID4gQSBwcmV2aW91cyBwYXRjaCB0cmllZCB0byBn
ZXQgTGludXggdG8gdXNlIHRoZSBFU1JUIHVuZGVyIFhlbiBpZiBpdCBpcw0KPiA+IGluIG1lbW9y
eSBvZiB0eXBlIEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGEuICBIb3dldmVyLCBFZmlSdW50aW1lU2Vy
dmljZXMqDQo+ID4gbWVtb3J5IG5lZWRzIHRvIGJlIGluY2x1ZGVkIGluIHRoZSBFRkkgcGFnZSB0
YWJsZXMsIHNvIGl0IGlzIGJlc3QgdG8NCj4gPiBtaW5pbWl6ZSB0aGUgYW1vdW50IG9mIG1lbW9y
eSBvZiB0aGlzIHR5cGUuICBTaW5jZSBFRkkgcnVudGltZSBzZXJ2aWNlcw0KPiA+IGRvIG5vdCBu
ZWVkIGFjY2VzcyB0byB0aGUgRVNSVCwgRWZpQUNQSVJlY2xhaW1NZW1vcnkgaXMgYSBiZXR0ZXIg
Y2hvaWNlLg0KPiA+DQo+ID4gTGluazogaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDIyLQ0KPiAwOS9tc2cwMTM2NS5odG1sDQo+ID4gRml4ZXM6
IGRjN2RhMDg3NGJhNCAoIkVGSTogcHJlc2VydmUgdGhlIFN5c3RlbSBSZXNvdXJjZSBUYWJsZSBm
b3IgZG9tMCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1pQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiANCj4gPiBTaG91bGQgdGhpcyBiZSBpbmNsdWRlZCBpbiA0LjE3PyAg
SXQgaXMgYSBidWcgZml4IGZvciBhIGZlYXR1cmUgbmV3IHRvDQo+ID4gNC4xNywgc28gSSBzdXNw
ZWN0IHllcywgYnV0IGl0IGlzIHVsdGltYXRlbHkgdXAgdG8gSGVucnkgV2FuZy4gIFRoZSBjb2Rl
DQo+ID4gaXMgaWRlbnRpY2FsIHRvIHYyLCBidXQgSSBoYXZlIGltcHJvdmVkIHRoZSBjb21taXQg
bWVzc2FnZS4NCj4gDQo+IEl0IG1heSBiZSB0b28gbGF0ZSBub3csIGxvb2tpbmcgYXQgdGhlIHN0
YXRlIG9mIHRoZSB0cmVlLiBIZW5yeSwgSnVsaWVuPw0KDQpMaWtlIEkgc2FpZCBpbiB2MiwgSSBk
b24ndCBvYmplY3QgdGhlIGNoYW5nZSBpZiB5b3Ugd291bGQgbGlrZSB0byBpbmNsdWRlIHRoaXMg
cGF0Y2gNCnRvIDQuMTcsIHNvIGlmIHlvdSBhcmUgc3VyZSB0aGlzIHBhdGNoIGlzIHNhZmUgYW5k
IHdhbnQgdG8gY29tbWl0IGl0LCBmZWVsIGZyZWUgdG8gYWRkOg0KDQpSZWxlYXNlLWFja2VkLWJ5
OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNClNpbmNlIHdlIGFsc28gbmVlZCB0
byBjb21taXQ6DQoiW1BBVENIIGZvci00LjE3XSBTVVBQT1JULm1kOiBEZWZpbmUgc3VwcG9ydCBs
aWZldGltZSIgc28gZnJvbSBteSBzaWRlDQpJIGFtIG5vIHByb2JsZW0uIEp1bGllbiBtaWdodCBo
YXZlIGRpZmZlcmVudCBvcGluaW9uIHRob3VnaCwgaWYgSnVsaWVuIG9iamVjdA0KdGhlIGNoYW5n
ZSBJIHdvdWxkIGxpa2UgdG8gcmVzcGVjdCBoaXMgb3BpbmlvbiBhbmQgbGVhdmUgdGhpcyBwYXRj
aCB1bmNvbW1pdHRlZC4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

