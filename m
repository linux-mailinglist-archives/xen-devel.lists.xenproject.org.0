Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1C61EFBB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439189.693200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orysg-0006lv-45; Mon, 07 Nov 2022 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439189.693200; Mon, 07 Nov 2022 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orysg-0006k0-1J; Mon, 07 Nov 2022 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 439189;
 Mon, 07 Nov 2022 09:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkz+=3H=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oryse-0006js-0I
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:57:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c77158-5e82-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 10:57:22 +0100 (CET)
Received: from AS9PR06CA0115.eurprd06.prod.outlook.com (2603:10a6:20b:465::24)
 by PAVPR08MB9858.eurprd08.prod.outlook.com (2603:10a6:102:300::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:57:20 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::94) by AS9PR06CA0115.outlook.office365.com
 (2603:10a6:20b:465::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Mon, 7 Nov 2022 09:57:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 09:57:19 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 07 Nov 2022 09:57:19 +0000
Received: from e57290c410e6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06B309A0-DDBD-4468-BD2C-9A50D6E75DE5.1; 
 Mon, 07 Nov 2022 09:57:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e57290c410e6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 09:57:13 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AM9PR08MB6674.eurprd08.prod.outlook.com (2603:10a6:20b:302::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:57:10 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 09:57:10 +0000
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
X-Inumbo-ID: 92c77158-5e82-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GtBYp7dT5I0e/mN5uhXJIaXbZ5mFAyhdvxmtb3lUzle7AQ0+/yKKMhvHFWVkDb8yY6m1xiBdv8+3jPD0w5HTu476795ElVkADRjv+CxTZCR+XIpqurftKzsoEKk8/ArCyHFYZUo7pvvYylUGAPj506J76y4IOCsP6um2X0zTvxTElHq2yY0K1B2xZKTe4/UA5FnsWKLj4reKgRiacET3CdJkN4/MZZ67xTtxrcawcxnQsdXjiePMa48hVsvoYfRzCfe4wdfRWBHjgxIOEh7aJ8RcZvUWMWSI9BmDMFmNnSTrQYd+em96Jrj+ifTO0cLGEUbbsF2u7NrCCGnD/5iPKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9T+EFI796AAqudQKihHLLiMjOCFouP3L7bRE4F1nHw=;
 b=AL0i+TXHs69fwC9dp6Qz1WkZg2O/T/3owHOL0nu+LBptP7QUHxqotncfn+DGKvQRCbaL73o9plvtMqZK4JE+Bq+F/PcdU7hDT97uv1ZOYLM2JzalPkQzHtyah/w1Or7hsR4hcznEKsF9yNyK+Ckydc5AFuzT1wM798ISJZQ58qI6VkcsviCouufULdA2JE3G+xKzCsWzDx7CXkPZ7i13dPlvd7Qdd3egblClA+rTeQoJahh8w12b3pb40ruVl5MGW+/cTloJ9QsykcEI/dVVXjgp1YNWuEf8txVHIF7mhhFBqfzvYepo4xRvDGvLPzEhpQn13iyOQ5pVehEDX6GMCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9T+EFI796AAqudQKihHLLiMjOCFouP3L7bRE4F1nHw=;
 b=3LOOp35p9Mnmuz44EKC/g6AmyM/tZSzITnv1baxG6Mz68AS3RegIN9xZupWrkdArf+jGVDPFucknPl79GrWGe90Hx7SgdSOA/kSd2AIX1QE8fVaiein1LLI+5wuDifkZ1E4J/rQbnt4EWWqGmJj0HIP9/PsmdojDWShNdFw6Zbk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXoBfgp7TydScR1cVEAlvrNfYxY4H78OmgRleBQEk+FttR/6x1jFdpz2gQh3JX30P1pPhdF1VxEMe6ciS0BE02halEhWTPulyOUmOpdJedZkzEF3ru4kiSM1Nb5+EKaHFYoqjKmD56rTxbhP9+e866A/PqdfbgNQukxWZYW4ITKxw8io0tsvh5TKE83ghQkkwvoWv7i3hNGjGOfW/OTDMrU7ZdDNtnXXzOw3p/fWH+KuZ+GnZXZI5N3wfr59FDQHbAYNUTI5no30FimVCTs/1h4jhUwFGHVsFJyKP/TY6v8puh8+yKvlTZIhUPu73Q1nCeFHx8lYN7JnxBKmqrpSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9T+EFI796AAqudQKihHLLiMjOCFouP3L7bRE4F1nHw=;
 b=fX7u//Tdy/hABvX1SZ2CZHb/wlkzsmhIsy+fb834wS7NHcuDlrzRfIiyBCX/EZkIeAaVkOYZ4Yo/UZ+Fs0jrp40Ud171VZcP3gS1NhteYkP8js8Le4yZ+N7r73NtvvqkQvPjaQQOQaHBMvhywX9WsF4Xl63bAtd5LaeGG2cezAF6yhPyvyal8YrA1TdbLztnMcnIRyF15FjcbeddeiJEwNVto2axvJOLObEH9K9K1O4sJk0bnX+WDl85PyXisAkKBTpD8abt+nVTRarYq4QjtOiwNI5m60PG2ThNydsojwa1oZ9rWx8Ek+wgX2jRZ8ykRoQkXI5gRA2DVd8bv/iR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9T+EFI796AAqudQKihHLLiMjOCFouP3L7bRE4F1nHw=;
 b=3LOOp35p9Mnmuz44EKC/g6AmyM/tZSzITnv1baxG6Mz68AS3RegIN9xZupWrkdArf+jGVDPFucknPl79GrWGe90Hx7SgdSOA/kSd2AIX1QE8fVaiein1LLI+5wuDifkZ1E4J/rQbnt4EWWqGmJj0HIP9/PsmdojDWShNdFw6Zbk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
Thread-Topic: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
Thread-Index: AQHY8DVttaMHoZmFwkey/b3g/gof864yY/8AgADDtcA=
Date: Mon, 7 Nov 2022 09:57:10 +0000
Message-ID:
 <AM0PR08MB45308C4FF75C1D1B6605DC95F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-11-wei.chen@arm.com>
 <54d6e747-c791-c321-3c75-87613393d789@xen.org>
In-Reply-To: <54d6e747-c791-c321-3c75-87613393d789@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 938B9A6A29EF6244BA5E2ED366979526.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AM9PR08MB6674:EE_|AM7EUR03FT015:EE_|PAVPR08MB9858:EE_
X-MS-Office365-Filtering-Correlation-Id: f003e7ff-9ee2-4ef1-c505-08dac0a6757e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WhbNTXghp9s/rRYA822HYO1xwrlI0NzlopqSkEehUQ4CYcCJ457Fxi49pHfuO2vKuj89IOMWR6E4KBCeQA10nrrnG6MO40RPoHnwd4P6FwutdSY79vxiyOc0ynEsZzlNPX+QcjsaVSQw9MAihVI5RYrSxsEj965Nj0PWf7r9CuZXn0YvLqtPtMVxrqSwZhZC0Yjc8GcfEkAKvcGSEoyKXCWlMet+ofjWqtmr+3kP6oiLd/eHDcSIGu1vZIDvtEHlHvVxlj7aML02hERGIyOobvCQCHNs5rbk3h8uzCUYkDo8Yh0HKRivbL6DHyN8pd0DbzTStYRreSfriou5RBcP1zJiRAoHavextd9k7QXcCNp8QKZaRRZ6r3UeaHFtbK6qnmVsEbF1hv7fjYn9/13925393+oPYDak0x1hplxvxLsC9mwqpKgJnNUE1Nu9xuWOPA9RiVRzF0xMn0gxaGsbciSp3+O/yFv5C+ubvGeLMQnuMaV6f7Cr847ekLtU77KwoQmSTOrj1LSHlVDXhOGOTBNe6n3qbDnw71a2cNhzIjLQtWWHJOc2MqxerRoSgN4wJ2qRAYRpUZSDE6JVkjo3w9B1kfWCzS9lFrmKCpm6yJFJBWzkp+HTqwTTWkwhagzmo5JQWEeKbRMo1fpH0nTs3ZQLyjYNt3j+IZxncfCmHUOKgy9B8IDOdY9xddDAdEEFYlzcV4aIjuKbMuODI+lVZqm9qFSiCFt5grdUyYIdpQ08ifnpEvbybyLV38j5tkeiw9ledGDpmicmFZg3u7LLSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(66556008)(66946007)(66476007)(4326008)(64756008)(66446008)(8676002)(122000001)(71200400001)(110136005)(76116006)(38100700002)(316002)(38070700005)(54906003)(33656002)(86362001)(41300700001)(8936002)(5660300002)(52536014)(2906002)(478600001)(83380400001)(7696005)(55016003)(186003)(26005)(53546011)(9686003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6674
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e43f5b7-1a16-40ef-a8bc-08dac0a67042
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLSWnlBqv0xJ+GaERHh+7PoXtd9Rb0jzn58oYNN2VXvfgePJZDH8NZjr4yEzfYix/ySiwxf2CgLQTqDRvadKey2Ryyivo3Ue6dW2j7CWzlrMZRKwWCffEWx9CwmFU/fauS9ZX98TX1TF3QlYfKaFvHpph15jlIx/8KTD+n3mDqfK1S6INHyLZs/yyo4bNH1ZbctgDLRjQq6/cVpC6jp5OhkPYmdcHKSv4abQtRaUC3K0AGQjMKMwa5qAgB/AWj7VeRpG0V5SUqXWGlzbnutx5FeexKfpbd5oAo0CPz5HlRLEhsdalWULu+ZUe4rOJ5XH2x4PyaNUFZwAVhZ+nkVeHAOQttHF30quHpP7w/wf+lN5D+Cn64iWZzN0VSueoS5Lv/hkfMZj0nVjgdWmepv/99/Y1x9vOHDkUyYNZE7FDBxc/lEq1pnPWFJP7TrkpFUDWMZelnBAp+5yw77duBlDxX7oaDUYH6QOI17BSjxArkuiXQrxi/O2ih0o+hBbYer+IBnm2jKR/SSfErYhIS4kRXdtXwpoyxAFKnVBNZMDCb3KfQrDNU9vMiozloRgsnvZui8EqQa4DA7hmb3uIA/8QngyMGG+GvdtviLhcBxGtT117FjcQHsB6tZIL5J8B8tMZrKyk+Y/Ota3FZ/vSbvfc82KATfkgdwPzdJsAcpEjQmMfC/FWbXEiJrvQQSwVW8tF/ZD3oByX4S2ZrdTkKSXuDAPBhw/s/7n3J647MkYoRTa64IbkiIZdd6vjotDnjN17NJ837oYK7eSaTOxgvyZdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(8676002)(316002)(40460700003)(4326008)(47076005)(81166007)(356005)(70206006)(70586007)(82740400003)(54906003)(33656002)(36860700001)(8936002)(478600001)(86362001)(41300700001)(5660300002)(52536014)(40480700001)(110136005)(2906002)(83380400001)(82310400005)(55016003)(107886003)(336012)(186003)(7696005)(9686003)(53546011)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:57:19.3911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f003e7ff-9ee2-4ef1-c505-08dac0a6757e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9858

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRl
dmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
DQo+IEp1bGllbiBHcmFsbA0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDcsIDIwMjIgNDo1NiBB
TQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBlbm55Llpo
ZW5nQGFybS5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xv
ZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMTAvMTFdIHhlbi9hcm02NDogaW50cm9kdWNlIGhlbHBlcnMgZm9yIE1Q
VQ0KPiBlbmFibGUvZGlzYWJsZQ0KPiANCj4gSGkgV2VpLA0KPiANCj4gT24gMDQvMTEvMjAyMiAx
MDowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5n
QGFybS5jb20+DQo+ID4NCj4gPiBXZSBuZWVkIHNvbWUgaGVscGVycyBmb3IgWGVuIHRvIGVuYWJs
ZS9kaXNhYmxlIE1QVSBpbiBib290LXRpbWUgYW5kDQo+ID4gcnVudGltZS4gRm9yIE1QVSBlbmFi
bGUgaGVscGVyLCB3ZSBrbm93IHRoYXQgaXQncyBhbiBlc3NlbnRpYWwNCj4gPiByZXF1aXJlbWVu
dCBvZiBNUFUgc3lzdGVtLiBCdXQgZm9yIE1QVSBkaXNhYmxlLCB3ZSBuZWVkIHRvIHVzZSBpdCBm
b3INCj4gPiBzb21lIHNwZWNpYWwgc2l0dWF0aW9ucy4gRm9yIGV4YW1wbGUsIGluIHRoZSBwcm9n
cmVzcyBvZiB0cmFuZmVycmluZw0KPiA+IGZyb20gYm9vdC10aW1lIHRvIHJ1bnRpbWUsIHdlIG5l
ZWQgdG8gdXBkYXRlIHRoZSBNUFUgcHJvdGVjdGlvbg0KPiA+IHJlZ2lvbnMgY29uZmlndXJhdGlv
biwgYnV0IHdlIGNhbid0IG1vZGlmeSBhbiBNUFUgcHJvdGVjdGlvbiByZWdpb24gaWYNCj4gPiB0
aGVyZSBpcyBzb21lIGRhdGEgYWNjZXNzZWQgYnkgWGVuLiBCdXQgaW4gYm9vdC10aW1lIGFsbCBv
ZiBYZW4gdGV4dCwNCj4gPiBkYXRhIGFuZCBCU1MgYXJlIGluIG9uZSBNUFUgcHJvdGVjdGlvbiBy
ZWdpb24sIGlmIFhlbiB3YW50IHRvIHVwZGF0ZQ0KPiA+IHRoaXMgcHJvdGVjdGlvbiByZWdpb24s
IGFib3ZlIHJlc3RyaWN0aW9uIHdpbGwgYmUgdHJpZ2dlcmVkLg0KPiANCj4gVGhpcyByYWlzZXMg
dGhlIGZvbGxvd2luZyBxdWVzdGlvbjogV2h5IGNhbid0IHdlIGNyZWF0ZSB0aGUgc3BsaXQgcmVn
aW9ucyByaWdodA0KPiBub3c/DQo+IA0KDQpUaGUgcmVhc29uIHdoeSB3ZSBhcmUgbm90IGNyZWF0
aW5nIHRoZSBzcGxpdCByZWdpb25zIHJpZ2h0IG5vdyBpcyB0aGF0IHdlDQphcmUgdHJ5aW5nIHRv
IGdvIHRoZSBzYW1lIHBhdGggTU1VIGdvZXMuIFRoZW4gd2UgY291bGQgcmV1c2UgYXMgbXVjaA0K
c2FtZSBpbnRlcmZhY2VzIGFzIHdlIGNvdWxkLCBpbiBvcmRlciB0byBub3QgbGVhdmUgI2lmZGVm
IENPTkZJR19IQVNfTVBVDQphbGwgb3ZlciB0aGUgcGxhY2UuDQoNCj4gSW4gcGFydGljdWxhciwg
ZGlzYWJsaW5nIHRoZSBNTVUvQ2FjaGUgaXMgZmFpcmx5IHJpc2t5IGJlY2F1c2UgeW91IG5lZWQg
dG8NCj4gZW5zdXJlIHRoYXQgYW55dGhpbmcgaW4gdGhlIGNhY2hlIHlvdSBjYXJlIGFib3V0IGhh
dmUgYmVlbiB3cml0dGVuIGJhY2sgdG8NCj4gdGhlIFJBTSkuDQo+DQoNCkhvcGUgSSBjb3VsZCB1
bmRlcnN0YW5kIHlvdXIgY29uY2VybiB0b3RhbGx5LCB5b3UgYXJlIHdvcnJ5aW5nIGFib3V0IHN0
YWxlIGluZm8gbGVmdCBpbg0KdGhlIGNhY2hlLCBldmVuIGlmIGl0J3MgYWx3YXlzIDE6MSBtYXBw
aW5nIG9uIHRoZSBNUFUgc3lzdGVtLCBtZW1vcnkgYXR0cmlidXRlcyBjb3VsZA0KYmUgZGlmZmVy
ZW50IGJlZm9yZSBhbmQgYWZ0ZXI/IA0KU28gaXQgaXMgbmV2ZXIgZW5vdWdoIHRoYXQgd2Ugb25s
eSBmbHVzaCB0aGUgdmFyaWFibGVzIHdoaWNoIHdlIHdpbGwgdXNlIGR1cmluZyB0aGUgZGlzYWJs
aW5nDQp0aW1lLCBpdCBzaG91bGQgYmUgZXZlcnl0aGluZyBpbiB0aGUgY2FjaGUuLi46Lw0KDQpT
aW5jZSBpbiBjdXJyZW50IGRlc2lnbiwgdGhlcmUgYXJlIHR3byB0aW1lIHBvaW50cyBpbiBib290
IHRpbWUgd2hlcmUgd2Ugd2lsbCBkaXNhYmxlDQpNUFUvQ2FjaGUgdG8gY29uZmlndXJlIE1QVS4N
Cg0KT25lIGlzIGluIHNldHVwX21tLCBoZXJlLCB3ZSB3aWxsIG1hcCBYRU4gY29tcG9uZW50cyBi
eSBjb21wb25lbnRzLCBlYWNoIE1QVSBtZW1vcnkNCnJlZ2lvbiBmb3IgYSBkaWZmZXJlbnQgY29t
cG9uZW50Lg0KVGhlIG90aGVyIGlzIG5lYXIgdGhlIGVuZCBvZiBib290IHRpbWUsIHdlIHdpbGwg
cmVvcmcgdGhlIHdob2xlIE1QVSBtZW1vcnkgcmVnaW9uIGxheW91dA0KYmVmb3JlIGdvaW5nIHJ1
bnRpbWUsIGFuZCB3ZSB3aWxsIGtlZXAgdW5jaGFuZ2luZyByZWdpb25zIGluIHRoZSBmcm9udCBh
bmQgZmxleGlibGUgb25lcyBpbiB0aGUgcmVhci4NCk90aGVyd2lzZSBpdCBpcyBoYXJkIGFuZCBj
b21wbGV4IHRvIG1haW50YWluIG9uIHJ1bnRpbWUsIGVzcGVjaWFsbHkgZHVyaW5nIGNvbnRleHQg
c3dpdGNoLg0KDQpVbmNoYW5naW5nIHJlZ2lvbnMgbGlrZSB4ZW4gdGV4dCB3aWxsIG5vdCBjaGFu
Z2UgZHVyaW5nIHZjcHUgY29udGV4dCBzd2l0Y2guIEZsZXhpYmxlIHJlZ2lvbnMsIGxpa2UNCmd1
ZXN0IG1lbW9yeSByZWdpb24sIHdpbGwgZGlzcGxheSBkaWZmZXJlbnQgY29udGVudHMgZHVyaW5n
IHZjcHUgY29udGV4dCBzd2l0Y2guDQoNCj4gPiBTbyBpbiB0aGlzIHNpdHVhdGlvbiwgd2UgbmVl
ZCB0byBkaXNhYmxlIHRoZSB3aG9sZSBNUFUgdG8gdXBkYXRlIHRoZQ0KPiA+IHByb3RlY3Rpb24g
cmVnaW9ucy4NCj4gPg0KPiA+IEluIHRoZXNlIGhlbHBlciwgZW5hYmxlL2Rpc2FibGUgTVBVIHdp
bGwgYWxzbyBlbmFibGUvZGlzYWJsZSB0aGUNCj4gPiBELWNhY2hlLiBUaGVyZSBhcmUgdHdvIHJl
YXNvbnMgZm9yIGl0Og0KPiA+IDEuIE1ha2UgdGhlIGZ1bmN0aW9uIHNlbWFudGljIGJlIGNvbnNp
c3RlbnQgd2l0aCBlbmFibGVfbW11Lg0KPiA+ICAgICBGb3IgTU1VIHN5c3RlbXMsIGVuYWJsZV9t
bXUgd2lsbCB0dXJuIE1NVSBhbmQgRC1DYWNoZSBhdA0KPiA+ICAgICB0aGUgc2FtZSB0aW1lLg0K
PiA+IDIuIFdoZW4gTVBVIGlzIGRpc2FibGVkLCB0aGUgTVBVIGJhY2tncm91bmQgYXR0cmlidXRl
cyB3aWxsDQo+ID4gICAgIGJlIHVzZWQuIE9uIHNvbWUgcGxhdGZvcm1zLCB0aGUgYmFja2dyb3Vu
ZCB3aWxsIHRyZWF0IGFsbA0KPiA+ICAgICBtZW1vcnkgYXMgZGV2aWNlIG1lbW9yeS4gVGhlIGFj
Y2VzcyB0byBkZXZpY2UgbWVtb3J5IHdpbGwNCj4gPiAgICAgYnlwYXNzIHRoZSBjYWNoZSwgZXZl
biBpZiB0aGUgQyBiaXQgaXMgZW5hYmxlZCBpbiBTQ1RMUi4NCj4gPiAgICAgVG8gYXZvaWQgdGhp
cyBpbXBsaWNpdCBiZWhhdmlvciwgd2UgZGlzYWJsZSBjYWNoZSB3aXRoIE1QVQ0KPiA+ICAgICBl
eHBsaWNpdGx5IHRvIHRlbGwgdXNlciB0aGF0IHdoZW4gTVBVIGlzIGRpc2FibGVkLCB0aGUNCj4g
PiAgICAgbWVtb3J5IGFjY2VzcyBpcyB1bmNhY2hlYWJsZS4NCj4gPg0KPiA+IEluIHRoaXMgcGF0
Y2gsIHdlIGFsc28gaW50cm9kdWNlIGEgbmV1dHJhbCBuYW1lIGVuYWJsZV9tbSBmb3IgWGVuIHRv
DQo+ID4gZW5hYmxlIE1NVS9NUFUuIFRoaXMgY2FuIGhlbHAgdXMgdG8ga2VlcCBvbmUgY29kZSBm
bG93IGluIGhlYWQuUw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVu
QGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFy
bS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICB8ICA1
ICsrKy0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUuUyB8ICA0ICsrLS0NCj4g
PiAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5TIHwgMzUNCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+IGluZGV4IDZjMWE1
Zjc0YTEuLjIyOGYwMWRiNjkgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4gPiBAQCAtMjU1LDcg
KzI1NSw4IEBAIHJlYWxfc3RhcnRfZWZpOg0KPiA+ICAgICAgICAgICAgKiBhbmQgcHJvdGVjdGlv
biByZWdpb25zIGZvciBNUFUgc3lzdGVtcy4NCj4gPiAgICAgICAgICAgICovDQo+ID4gICAgICAg
ICAgIGJsICAgIHByZXBhcmVfZWFybHlfbWFwcGluZ3MNCj4gPiAtICAgICAgICBibCAgICBlbmFi
bGVfbW11DQo+ID4gKyAgICAgICAgLyogVHVybiBvbiBNTVUgb3IgTVBVICovDQo+ID4gKyAgICAg
ICAgYmwgICAgZW5hYmxlX21tDQo+ID4NCj4gPiAgICAgICAgICAgLyogV2UgYXJlIHN0aWxsIGlu
IHRoZSAxOjEgbWFwcGluZy4gSnVtcCB0byB0aGUgcnVudGltZSBWaXJ0dWFsDQo+IEFkZHJlc3Mu
ICovDQo+ID4gICAgICAgICAgIGxkciAgIHgwLCA9cHJpbWFyeV9zd2l0Y2hlZA0KPiA+IEBAIC0z
MTMsNyArMzE0LDcgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQ0KPiA+ICAgICAgICAgICBibCAg
ICBjaGVja19jcHVfbW9kZQ0KPiA+ICAgICAgICAgICBibCAgICBjcHVfaW5pdA0KPiA+ICAgICAg
ICAgICBibCAgICBwcmVwYXJlX2Vhcmx5X21hcHBpbmdzDQo+ID4gLSAgICAgICAgYmwgICAgZW5h
YmxlX21tdQ0KPiA+ICsgICAgICAgIGJsICAgIGVuYWJsZV9tbQ0KPiA+DQo+ID4gICAgICAgICAg
IC8qIFdlIGFyZSBzdGlsbCBpbiB0aGUgMToxIG1hcHBpbmcuIEp1bXAgdG8gdGhlIHJ1bnRpbWUg
VmlydHVhbA0KPiBBZGRyZXNzLiAqLw0KPiA+ICAgICAgICAgICBsZHIgICB4MCwgPXNlY29uZGFy
eV9zd2l0Y2hlZA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUu
Uw0KPiA+IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbW11LlMgaW5kZXggZmM2NDgxOWE5OC4u
YjU0Mjc1NWJkMg0KPiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9t
bXUuUw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5TDQo+ID4gQEAgLTIx
Nyw3ICsyMTcsNyBAQCBFTkRQUk9DKHByZXBhcmVfZWFybHlfbWFwcGluZ3MpDQo+ID4gICAgKg0K
PiA+ICAgICogQ2xvYmJlcnMgeDAgLSB4Mw0KPiA+ICAgICovDQo+ID4gLUVOVFJZKGVuYWJsZV9t
bXUpDQo+ID4gK0VOVFJZKGVuYWJsZV9tbSkNCj4gPiAgICAgICAgICAgUFJJTlQoIi0gVHVybmlu
ZyBvbiBwYWdpbmcgLVxyXG4iKQ0KPiA+DQo+ID4gICAgICAgICAgIC8qDQo+ID4gQEAgLTIzOSw3
ICsyMzksNyBAQCBFTlRSWShlbmFibGVfbW11KQ0KPiA+ICAgICAgICAgICBtc3IgICBTQ1RMUl9F
TDIsIHgwICAgICAgICAgIC8qIG5vdyBwYWdpbmcgaXMgZW5hYmxlZCAqLw0KPiA+ICAgICAgICAg
ICBpc2IgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIE5vdywgZmx1c2ggdGhlIGljYWNoZSAq
Lw0KPiA+ICAgICAgICAgICByZXQNCj4gPiAtRU5EUFJPQyhlbmFibGVfbW11KQ0KPiA+ICtFTkRQ
Uk9DKGVuYWJsZV9tbSkNCj4gPg0KPiA+ICAgLyoNCj4gPiAgICAqIFJlbW92ZSB0aGUgMToxIG1h
cCBmcm9tIHRoZSBwYWdlLXRhYmxlcy4gSXQgaXMgbm90IGVhc3kgdG8ga2VlcA0KPiA+IHRyYWNr
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUw0KPiA+IGIveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWRfbXB1LlMgaW5kZXggZjYwNjExYjU1Ni4uNWExYjAzZTI5Mw0KPiAx
MDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUw0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5TDQo+ID4gQEAgLTY4LDMgKzY4LDM4IEBAIEVO
VFJZKHByZXBhcmVfZWFybHlfbWFwcGluZ3MpDQo+ID4NCj4gPiAgICAgICByZXQNCj4gPiAgIEVO
RFBST0MocHJlcGFyZV9lYXJseV9tYXBwaW5ncykNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIEVu
YWJsZSBFTDIgTVBVIGFuZCBkYXRhIGNhY2hlLiBCZWNhdXNlIHdlIHdpbGwgZGlzYWJsZSBjYWNo
ZQ0KPiA+ICsgKiB3aXRoIE1QVSBhdCB0aGUgc2FtZSB0aW1lLCBpbiBhY2NvcmRhbmNlIHdpdGgg
dGhhdCwgd2UgaGF2ZQ0KPiA+ICsgKiB0byBlbmFibGUgY2FjaGUgd2l0aCBNUFUgYXQgdGhlIHNh
bWUgdGltZSBpbiB0aGlzIGZ1bmN0aW9uLg0KPiA+ICsgKiBXaGVuIE1QVSBpcyBkaXNhYmxlZCwg
dGhlIE1QVSBiYWNrZ3JvdW5kIGF0dHJpYnV0ZXMgd2lsbA0KPiA+ICsgKiBiZSB1c2VkLiBPbiBz
b21lIHBsYXRmb3JtLCB0aGUgYmFja2dyb3VuZCB3aWxsIHRyZWF0IGFsbA0KPiA+ICsgKiBtZW1v
cnkgYXMgSU8gbWVtb3J5Lg0KPiANCj4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBh
bGwgYWNjZXNzIHdvdWxkIGJlIHRyZWF0ZWQgYXMgRGV2aWNlDQo+IE1lbW9yeSB3aGVuIHRoZSBN
TVUgaXMgb2ZmLiBJc24ndCBpdCB0aGUgY2FzZSBmb3IgdGhlIE1QVT8NCj4gDQoNClllcywgd2l0
aG91dCBiYWNrZ3JvdW5kIHJlZ2lvbi4gUmlnaHQgbm93LCBiYWNrZ3JvdW5kIHJlZ2lvbiBpcyBk
aXNhYmxlZA0KaGVyZS4NCkJ1dCBpZiB0aGUgQmFja2dyb3VuZCByZWdpb24gaXMgZW5hYmxlZCwg
dGhlbiB0aGUgTVBVIHVzZXMgdGhlIGRlZmF1bHQgbWVtb3J5DQptYXAgYXMgdGhlIEJhY2tncm91
bmQgcmVnaW9uIGZvciBnZW5lcmF0aW5nIHRoZSBtZW1vcnkgYXR0cmlidXRlcyB3aGVuIE1QVSBp
cyBkaXNhYmxlZC4NCkFuZCBpdCBpcyBhbHNvIElNUExFTk1FTlRBVElPTiBERUZJTkVEfg0KDQo+
IEFsc28sIEkgdGhpbmsgdGhlIGNvcnJlY3Qgd29yZGluZyBpcyAiZGV2aWNlIG1lbW9yeSIgcmF0
aGVyIHRoYW4gIklPDQo+IG1lbW9yeSIuDQo+IA0KPiA+IFRoZSBhY2Nlc3MgdG8gSU8gbWVtb3J5
IHdpbGwgYnlwYXNzDQo+IA0KPiBEaXR0by4NCj4gDQo+ID4gKyAqIHRoZSBjYWNoZSwgZXZlbiB5
b3UgaGF2ZSBlbmFibGVkIHRoZSBDIGJpdCBpbiBTQ1RMUi4NCj4gPiArICogVG8gYXZvaWQgdGhp
cyBpbXBsaWNpdCBiZWhhdmlvciwgd2UgZGlzYWJsZSBjYWNoZSB3aXRoIE1QVQ0KPiA+ICsgKiBl
eHBsaWNpdGx5IHRvIHRlbGwgdXNlciB0aGF0IHdoZW4gTVBVIGlzIGRpc2FibGVkLCB0aGUgbWVt
b3J5DQo+ID4gKyAqIGFjY2VzcyBpcyB1bmNhY2hlYWJsZS4NCj4gPiArICovDQo+ID4gK0VOVFJZ
KGVuYWJsZV9tbSkNCj4gPiArICAgIG1ycyAgIHgwLCBTQ1RMUl9FTDINCj4gPiArICAgIG1vdiAg
IHgxLCAjKFNDVExSX0F4eF9FTHhfTSB8IFNDVExSX0F4eF9FTHhfQykNCj4gPiArICAgIC8qIEVu
YWJsZSBFTDIgTVBVIGFuZCBELWNhY2hlICovDQo+ID4gKyAgICBvcnIgICB4MCwgeDAsIHgxDQo+
ID4gKyAgICBkc2IgICBzeQ0KPiA+ICsgICAgbXNyICAgU0NUTFJfRUwyLCB4MA0KPiA+ICsgICAg
aXNiDQo+ID4gKyAgICByZXQNCj4gPiArRU5EUFJPQyhlbmFibGVfbW0pDQo+ID4gKw0KPiA+ICsv
KiBEaXNhYmxlIE1QVSBzeXN0ZW0sIGluY2x1ZGluZyBkYXRhIGNhY2hlLiAqLw0KPiA+ICtFTlRS
WShkaXNhYmxlX21tKQ0KPiANCj4gSSB3b3VsZCByYXRoZXIgbm90IGludHJvZHVjZSB0aGlzIGZ1
bmN0aW9uIHVudGlsIHRoZXJlIGlzIGEgY2FsbGVyLiBUaGlzIGlzDQo+IGJlY2F1c2UsIEkgYmVs
aWV2ZSwgdGhlcmUgYXJlIHNvbWUgYXNzdW1wdGlvbnMgb24gdGhlIHN0YXRlIG9mIHRoZSBjYWNo
ZQ0KPiBiZWZvcmUgd2UgY2FuIHR1cm4gb2ZmIHRoZSBNTVUuIFNvIEkgd291bGQgbGlrZSB0byBz
ZWUgdGhlIGNhbGxlciBpbiBvcmRlciB0bw0KPiBhc3Nlc3Mgd2hldGhlciB0aGlzIGZ1bmN0aW9u
IG1ha2VzIHNlbnNlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

