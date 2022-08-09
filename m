Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE158D4EF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 09:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382793.617828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLK3Z-000195-L3; Tue, 09 Aug 2022 07:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382793.617828; Tue, 09 Aug 2022 07:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLK3Z-00017K-Hg; Tue, 09 Aug 2022 07:53:41 +0000
Received: by outflank-mailman (input) for mailman id 382793;
 Tue, 09 Aug 2022 07:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsBn=YN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oLK3Y-00017E-0P
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 07:53:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50068.outbound.protection.outlook.com [40.107.5.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb8b93e-17b8-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 09:53:32 +0200 (CEST)
Received: from DB9PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:1d9::23)
 by AM6PR08MB4197.eurprd08.prod.outlook.com (2603:10a6:20b:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 07:53:29 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::41) by DB9PR02CA0018.outlook.office365.com
 (2603:10a6:10:1d9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Tue, 9 Aug 2022 07:53:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 07:53:28 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 09 Aug 2022 07:53:28 +0000
Received: from c38829d3b645.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB552853-3310-49CB-9675-0C06B4E4E7FE.1; 
 Tue, 09 Aug 2022 07:53:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c38829d3b645.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 07:53:23 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3672.eurprd08.prod.outlook.com (2603:10a6:20b:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 07:53:21 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518%8]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 07:53:20 +0000
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
X-Inumbo-ID: 5cb8b93e-17b8-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KcTQc12QpQCchVBfxM2YX9tkQlOF1UkSbOJg69kBO2iA7wT6KCMBmsHLrh5mrm0COJY5JouH+7YBALmfmRks8TtA4RyFhqdI/uLx4ApfljqVUWASULsJb/7JHueK7VcQOZ7WHebZXu+NpMD8NeUyxsHBoghKgC3L44hAHW4Ci3Ov5PnaPmUrqCKrBeScqqWF5Puc+S1wuJAG+GWalPh5bXo8Fe3mpeTTwkfHjLnxDSZSrQuoWNZ8jjZ5AoeDWsZjK3g6mhFYUfJGeiLpGdnwykIvQUcgsdxeKHb0kIJ9dzB5HqxYStxhccSaQ5jP4WZgT0zXk2iIUQ1uz1O83Fb81Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkPwy5AHKadMyIA+8uZGWZz5T9fExyiEnD2PJqoRzf0=;
 b=C+y4fB4SPT4CMf/MDcVStYcyHPaWUzuJsG99W4M5tJSHc/1SzBdgVyLoCajIz7702PGUryi95qLOMpeNn519172ZJWNFerMSeYNGcHwnmW+BHYm837zxvIrNW0t+6hCW2/jHJ+g02Jsu8v/OlvvJzD0TA9t0u0RhJzJa5x2T+AnRwCM9KQ9TQ2Hxs2eG7xsXpCU3HAhpILC8G6eXBEqrvvcJhnt7wRwfZU/Y+zkeoeJNU8TsFudNhlyScEj4zLNt0iRwzRBLIO0tkMkwATur2kED0BqN4gHt/h0RtveC2hUMIpg0pfHxd6FYnFGmCKBbZGXvIVoAZBrIz33rAkDmVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkPwy5AHKadMyIA+8uZGWZz5T9fExyiEnD2PJqoRzf0=;
 b=ZM5lwlI3KX2exONTH3aSW/baWlEZ1knAIsIrisRycxLfvO2e7SKkxIVwm9EqcE6yUPs3PxNvPq6I61iEI96+DfR8OPrhycXZNvPzna2l/qH05vdeNO8Ry36MGmJijEY+KzixhXPUq/2lnkvpSbK/nSCMggvHeT3VzHyqUkBYgPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBaEUriQ/a2DfDsj58h8ZMSvrfjCK6NX/NNbtKoeiYqleQTwSSdNddVXNZunJz3NuHLFW2NBOaSfyPq7W3oUkVsw+Fd/Z8YzgyBk1IofBC1U7v2zhbBy9JY+IIeRpbb7xeA3wWLQqlYOEol3kGRFcjrIi83kW3Op/QTWglKyUS9+hWpuw0LVWQnaHo31JIYYDrqaZrhde7CAfX6lrkK91DqN13S3CERMg6QZx2FyxpryB41Y/20hdubMaiMnSd/F48hXkmEY4Cz4xwBdF2jnxnZRCJCbIbYC37uHA1SUaTktvEZAw2wYsXis1ruSBRSm0K3/9DeetjjWz3j0KrkdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkPwy5AHKadMyIA+8uZGWZz5T9fExyiEnD2PJqoRzf0=;
 b=Z22zeeyMJf7RYBL8xQ5rwMEvauzPip23h4U9WZuZH8bOVJRWqM+Lu1TacvdcOgdYW3bYZ83O3oDobOrWfd0doGHM5McbOjuaaNK397oQmfIDGDH+24w7r8GvNOoYCwdnEGRpZbzOv9fkHmVf8GGrJgUYtTZ5b4vPubp9aBlyO0hfE4h/iVBhL9WVBGoAx8NM2XCeJPHWjWm+WMHgymeOJ92TGsqGIkamGkYPzot/O8lgOf+FvmASJe9WRuJ0XKUqjBHEjnUegvs1LIiYl0vNnEZFwUMJ/QC9o9NtcOxdoDm8zuDb62ihTpPGdtLmqisLVa6nXWCeSTgFqI82atFAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkPwy5AHKadMyIA+8uZGWZz5T9fExyiEnD2PJqoRzf0=;
 b=ZM5lwlI3KX2exONTH3aSW/baWlEZ1knAIsIrisRycxLfvO2e7SKkxIVwm9EqcE6yUPs3PxNvPq6I61iEI96+DfR8OPrhycXZNvPzna2l/qH05vdeNO8Ry36MGmJijEY+KzixhXPUq/2lnkvpSbK/nSCMggvHeT3VzHyqUkBYgPQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYm/wqv1nrEHMOJUyQDyAePQJHla2PQtqAgBcOCRA=
Date: Tue, 9 Aug 2022 07:53:20 +0000
Message-ID:
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
In-Reply-To: <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B6B35EEE43109F43B6EA8178CCEA72F2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b9585a4b-d7a6-40aa-1d1d-08da79dc3f55
x-ms-traffictypediagnostic:
	AM6PR08MB3672:EE_|DBAEUR03FT003:EE_|AM6PR08MB4197:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GVvs92rofy395BKhciY05bjrM4D6Ulx27UdOy8NuctqcJRZ/Du/yBAvxWber4zF5bKD0u++QiecnJJn8RTq3XGR+E6rIsCiMtEoTVIEiw9K9Mzz08iKnVxiSELM5n2PnUDgZHmwdkpgoehusdibDYoMYrwbFIaWmh24QYjc78ptwVIc6wuxaRUv5urvhO+QhC3izM/z9kX3TDEBaNenHA4mWBNrxpYPLSuUStpv+i9DJeo/q/Yjk1UhGuVWOoUDwdNapLX57rjdHVs84SzRnoL2WtBxIIgWzXMZx20lgiKeugGjdOK9Lw8n/Q7U4uFONetIKmB6FkbR4HDitTPTBKgjNg+FEkeRRTg9O02lFP5Ps37ez0bRhdnOURn6aSCxRjFz2+XGqym9wW0KAclvTaraTWctcxBOC0AxGrT1QZ4xuzDFQZQ0upl4bXFmRfbX/O26CLcSndoUdtlQgQfPuRbLDqnGfe7wj/ZnTJHzKYV+VVgHddSmvOf3RCOm8FMc19Jd09Ib2pJ8v20rR3bYoGtrwSMQJ014j+YpSwawwfCTpLqvQE43lHI7OebM9xdMmkqfmUovdauWHXU/cTV3aKytQAwp+Bw0/uZ3+7ghAB17pF9yTE8WB0FgZXWaI0+gX31xHV+oDxQb2ExysUy4VtEA+ZTMLkLj+A1s1dVyxMYtMqJArN2gbknN4NXPcyu32LH7FVfFi/e8lYpVWV2mkblgK2t4lGvRT2Sai64O/cTbhcOl9hKFqGeCyEXHVf7H8aOqtcgwrdmBLFRprIrshmgKDCWfwn8XyVVhamrKVHYk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(52536014)(83380400001)(122000001)(5660300002)(186003)(2906002)(38100700002)(9686003)(55016003)(6506007)(7696005)(53546011)(66556008)(66476007)(33656002)(66946007)(316002)(6916009)(64756008)(66446008)(76116006)(71200400001)(26005)(86362001)(4326008)(8676002)(54906003)(8936002)(41300700001)(38070700005)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 =?utf-8?B?Z3NORzZLZzc1YXVUTi9BVVptMVFITlRXdEtncmJqM1l5c0FxNmxjVklHZThs?=
 =?utf-8?B?THh3OCtUelRMQzdTSmNoajdMaEI3UEt5RzN4YThzR3Z0aVpZVkVITnl5RmtL?=
 =?utf-8?B?ZTNsQ01JKzlPaVJBREpzdzRtSitDVlZGSGRqd0x1UGhTcGZQRk02c2ZrRGN0?=
 =?utf-8?B?ZnBCVFVtNFFuVzkvN2RLU3ZNYUNZamFvbG1HZEVCSyszVlRkYjNlRE1WK2Mw?=
 =?utf-8?B?TE8wU0FuaXRlOGtDMWovakcxRkJSaVF6U0p5V21MS0luU3NKS05jU3FRY2I1?=
 =?utf-8?B?YzBkWENMUEIvS3hYOTV5dVdEaWZFNzVDdGhVZXdob1JLa0FSZ3Q3dmh6Sll2?=
 =?utf-8?B?TjBqaWtoY1paMHlueVAyS2Vxc1U0NEY1K1lXandISm9rUGZhR0VMZFVaUVJl?=
 =?utf-8?B?RndyaDEyWml6Y3pQSkY1NmRiR3pVWDViQXJTV3ZmOFNkQllKQlVMeHBadi9B?=
 =?utf-8?B?ZWtoRHp5QmNMckl0MGdObFU5MkQvaTZ6YmRTbUpyZ1ZJaDhFQ1E3ZnB3ZDlv?=
 =?utf-8?B?b0VJM1pVSGM4Wi9XQXBzK0VMUlNSWlJZZFdreEsyeWQwL1MzNEFsR3pxbm5P?=
 =?utf-8?B?eXI4YWpJT2wySEFtT0xMdDJCd2xRL3BXZkZGUllEL0FoamNWUzZyOHJFRUEv?=
 =?utf-8?B?VytqTUlnZnFuTUtKOE1nc0NvQkVNYlAxaERVZkQxNWdndVZWZkMxcTZFcUpP?=
 =?utf-8?B?L1MvVXNmTXROYUN0SklQbVJYR0pBdUxiempFaklDUWs3eGMxajRUeFBid1Bx?=
 =?utf-8?B?S3dLZExRNUN2RCtiRzllV2pNWkg5MFAvM3djemhOYzhLWGx3cm1JUlVsMSt5?=
 =?utf-8?B?TWZab1NiN1JJbStRcldaZnVCTlU2bjlLRDJYUFo5ZFk5M2VSMkk3b0hFMHhv?=
 =?utf-8?B?azZWSGh6bzdhdFg3bHhuRHpyd1VBZWtEVzB5SStEU1Znb2g0ak9Dbjd6R25P?=
 =?utf-8?B?a0ZEcjgwTFhEMndYSnpwYmtTZ0RyOFBlRE5QTGY3NEVnejhQZ2tXTExwZTJJ?=
 =?utf-8?B?SW4zVUdZZ1BoenJLOFU0NjFCdEhBc3djOHJ2Q2E5ZjlySyt3R1U2N1hkYXcv?=
 =?utf-8?B?TDFLODBMVC94VElhZjRjN09kQVcveHBJWEg3cWhkSHA0dUphdGppN0VoY2J4?=
 =?utf-8?B?NjBOb3ZOM09UYTA1VmVnT0xpdDRMVEhldlJYbU1qc1BQLzVyV3Y1MkE4aFVI?=
 =?utf-8?B?SFc2Sk5WeW9CcCt4T3BwYm5nb3d3MWxQYTg1K2hIdXlOdGcydHhOd0xzUEN6?=
 =?utf-8?B?S3ZjQW1GMENPQkp1akZRYnNFb25zWnBibVI1SEFrV1p5V3I2b1BPVUxhTlNW?=
 =?utf-8?B?Lzlxck9WNERzcTdMdEVDVkV3YlNlVUVBekFKYUJnY21QVUFicnQxL012VzBR?=
 =?utf-8?Q?AvyJzl1Lp3ftLa1rCpeosH03udBiryls=3D?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3672
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b75473bc-5faf-4505-2a47-08da79dc3a8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qr2FNO0CxckhP2XX6VP0+L8jTdhFTrq35Hff3Vcv9GPZXmfxpfFuDRi2dFykkxc0R6CTaG5gJ09QbCZmz2y4KbKJBoR91QJ1DMXnVqDYgk/h9Zy13Kay/9XCsbDXr08iXcrILaNmK56i8zsWuEU5PpuvKBN9syMjuyqBnDOQCgYqpnHY5MEDae7kW8e6tzbYzHvYqUbMZOV62mSc2D14LY6Dbb5kPOzNITQY23jdUU5RZWV02y+JGM5yE4pVvPYXIyAZlUKMObkgsHROcA2Abd+Dm2PHrrIu2sEHn1jPm5vDLRlbDDVwjljbvjj5QL4h78cBelj8Mj3hsdQkNc4/XS8hUmj5AcM0A52Q9b+C+hgkKSGjejFVL0B3m9bG4868goHynEqqw1wZikPYGsBAJqWUH3WqZ731e0rvRr1j8NnbO/VxRe2cv9Jx3Krp2zyzmJEC757+BuxKXAEcn8ReHdU5CLv8sAX3ZjZe05ZY61dfaelnoy0grz/5rLaYOCD0D0doSUqLgvA2MUwG9Rj7mvTmQXYFB/U+2amuYH+ANjh4gUWTYSunBlVtCaigzWmDwSS1Feo5RlPR1+q0QJvy5qLq+43MOyjxBUM0zsfpvCtc33zT4dWZ0SAwg/yBW1ZBMyN4MQ33Njj3UVwb75Ra879hoN6nzjhL1FdJygCakuBYHGjp0iOQqrwsUDqTk1e9wro8+UQx1OhjQky6kkFWpksjtwlrDwy6eut6POz2wpcyvh5HBLSWKCsBE0H6rlldEBzGXYwV7xRNejqrk0wWyguvgkbOpO0PlVNGGADkKlDJgkPkQU3fGjBOJ/Mujh8a
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(9686003)(356005)(53546011)(82740400003)(478600001)(26005)(33656002)(40480700001)(5660300002)(6506007)(7696005)(2906002)(41300700001)(81166007)(4326008)(70206006)(70586007)(52536014)(83380400001)(6862004)(8936002)(8676002)(54906003)(86362001)(36860700001)(316002)(336012)(55016003)(40460700003)(82310400005)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 07:53:28.8498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9585a4b-d7a6-40aa-1d1d-08da79dc3f55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4197

SGkgSmFuDQoNClNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxpY2gNCj4gU2VudDog
TW9uZGF5LCBKdWx5IDI1LCAyMDIyIDExOjQ0IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnku
WmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjkgOC84XSB4ZW46IHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9uDQo+IHBv
cHVsYXRlX3BoeXNtYXANCj4gDQo+IE9uIDIwLjA3LjIwMjIgMDc6NDYsIFBlbm55IFpoZW5nIHdy
b3RlOg0KPiA+IFdoZW4gYSBzdGF0aWMgZG9tYWluIHBvcHVsYXRlcyBtZW1vcnkgdGhyb3VnaCBw
b3B1bGF0ZV9waHlzbWFwIGF0DQo+ID4gcnVudGltZSwgaXQgc2hhbGwgcmV0cmlldmUgcmVzZXJ2
ZWQgcGFnZXMgZnJvbSByZXN2X3BhZ2VfbGlzdCB0byBtYWtlDQo+ID4gc3VyZSB0aGF0IGd1ZXN0
IFJBTSBpcyBzdGlsbCByZXN0cmljdGVkIGluIHN0YXRpY2FsbHkgY29uZmlndXJlZCBtZW1vcnkN
Cj4gcmVnaW9ucy4NCj4gPiBUaGlzIGNvbW1pdCBhbHNvIGludHJvZHVjZXMgYSBuZXcgaGVscGVy
IGFjcXVpcmVfcmVzZXJ2ZWRfcGFnZSB0byBtYWtlDQo+IGl0IHdvcmsuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4g
PiB2OSBjaGFuZ2VzOg0KPiA+IC0gVXNlIEFTU0VSVF9BTExPQ19DT05URVhUKCkgaW4gYWNxdWly
ZV9yZXNlcnZlZF9wYWdlDQo+ID4gLSBBZGQgZnJlZV9zdGF0aWNtZW1fcGFnZXMgdG8gdW5kbyBw
cmVwYXJlX3N0YXRpY21lbV9wYWdlcyB3aGVuDQo+ID4gYXNzaWduX2RvbXN0YXRpY19wYWdlcyBm
YWlscw0KPiANCj4gTWF5IEkgc3VnZ2VzdCB0byByZS1jb25zaWRlciBuYW1pbmcgb2YgdGhlIHZh
cmlvdXMgZnVuY3Rpb25zPyBVbmRvaW5nIHdoYXQNCj4gInByZXBhcmUiIGRpZCBieSAiZnJlZSIg
aXMsIHdlbGwsIGNvdW50ZXJpbnR1aXRpdmUuDQo+IA0KDQpIb3cgYWJvdXQgY2hhbmdlIHRoZSBu
YW1lICJwcmVwYXJlX3N0YXRpY21lbV9wYWdlcyIgdG8gImFsbG9jYXRlX3N0YXRpY21lbV9wYWdl
cyI/DQoNCj4gPiArLyoNCj4gPiArICogQWNxdWlyZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdl
IGxpc3QocmVzdl9wYWdlX2xpc3QpLCB3aGVuDQo+ID4gK3BvcHVsYXRpbmcNCj4gPiArICogbWVt
b3J5IGZvciBzdGF0aWMgZG9tYWluIG9uIHJ1bnRpbWUuDQo+ID4gKyAqLw0KPiA+ICttZm5fdCBh
Y3F1aXJlX3Jlc2VydmVkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG1lbWZs
YWdzKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPiA+ICsNCj4g
PiArICAgIEFTU0VSVF9BTExPQ19DT05URVhUKCk7DQo+ID4gKw0KPiA+ICsgICAgLyogQWNxdWly
ZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdlIGxpc3QocmVzdl9wYWdlX2xpc3QpLiAqLw0KPiA+
ICsgICAgc3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPiA+ICsgICAgcGFnZSA9IHBh
Z2VfbGlzdF9yZW1vdmVfaGVhZCgmZC0+cmVzdl9wYWdlX2xpc3QpOw0KPiA+ICsgICAgc3Bpbl91
bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4gKyAgICBpZiAoIHVubGlrZWx5KCFwYWdl
KSApDQo+ID4gKyAgICAgICAgcmV0dXJuIElOVkFMSURfTUZOOw0KPiA+ICsNCj4gPiArICAgIGlm
ICggIXByZXBhcmVfc3RhdGljbWVtX3BhZ2VzKHBhZ2UsIDEsIG1lbWZsYWdzKSApDQo+ID4gKyAg
ICAgICAgZ290byBmYWlsOw0KPiA+ICsNCj4gPiArICAgIGlmICggYXNzaWduX2RvbXN0YXRpY19w
YWdlcyhkLCBwYWdlLCAxLCBtZW1mbGFncykgKQ0KPiA+ICsgICAgICAgIGdvdG8gZmFpbF9hc3Np
Z247DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHBhZ2VfdG9fbWZuKHBhZ2UpOw0KPiA+ICsNCj4g
PiArIGZhaWxfYXNzaWduOg0KPiA+ICsgICAgZnJlZV9zdGF0aWNtZW1fcGFnZXMocGFnZSwgMSwg
bWVtZmxhZ3MgJiBNRU1GX25vX3NjcnViKTsNCj4gPiArIGZhaWw6DQo+ID4gKyAgICBwYWdlX2xp
c3RfYWRkX3RhaWwocGFnZSwgJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPiArICAgIHJldHVybiBJ
TlZBTElEX01GTjsNCj4gPiArfQ0KPiANCj4gV2hhdCBhYm91dCBsb2NraW5nIG9uIHRoaXMgZXJy
b3IgcGF0aD8NCj4gDQoNClJpZ2h0LCBsb2NraW5nIGlzIG5lZWRlZCBoZXJlIHRvbzoNCmZhaWw6
DQogICBzcGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQogICBwYWdlX2xpc3RfYWRkX3Rh
aWwocGFnZSwgJmQtPnJlc3ZfcGFnZV9saXN0KTsNCiAgIHNwaW5fdW5sb2NrKCZkLT5wYWdlX2Fs
bG9jX2xvY2spOw0KDQo+IEphbg0KDQo=

