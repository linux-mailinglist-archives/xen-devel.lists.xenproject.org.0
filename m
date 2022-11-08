Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41E620595
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 02:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439658.693689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osD41-0003Ni-Qs; Tue, 08 Nov 2022 01:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439658.693689; Tue, 08 Nov 2022 01:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osD41-0003L2-NA; Tue, 08 Nov 2022 01:06:05 +0000
Received: by outflank-mailman (input) for mailman id 439658;
 Tue, 08 Nov 2022 01:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+JRS=3I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1osD3z-0003Kw-DF
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 01:06:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81b30053-5f01-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 02:05:59 +0100 (CET)
Received: from AM6P193CA0104.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::45)
 by DBBPR08MB6122.eurprd08.prod.outlook.com (2603:10a6:10:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 01:05:56 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::f4) by AM6P193CA0104.outlook.office365.com
 (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Tue, 8 Nov 2022 01:05:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 01:05:55 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 08 Nov 2022 01:05:55 +0000
Received: from 881bfb1e62b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E893127-E365-4D61-8187-BCCC2FF31054.1; 
 Tue, 08 Nov 2022 01:05:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 881bfb1e62b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 01:05:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6203.eurprd08.prod.outlook.com (2603:10a6:10:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 01:05:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Tue, 8 Nov 2022
 01:05:46 +0000
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
X-Inumbo-ID: 81b30053-5f01-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lvF9Epvz9dxyyoTbNOXJSvEUPvgnumjag0leTRCk1fa5WTBCFSdObw6etSfnCOuUx6Dp+1rIMbvZsfYfPkROCqDJU34zXag0WoRkQv80XDFVFsqQMvoZw2v2a4wBg6xdSlCS01H7E/HGDWzOTFHmiU6yr2f5CSYPgyo9WDb5RvQIYMvimEwvuIAmdWMM9DvXD0wnnd7R4FtEYxkA4lh9jxxZTjlMY1PM5Ks6eFsudPQMasrHwaMm2fuYEQprDXpxlJIEhOuUJBNufTgnAzYRtxwvqWIO1SANQUB6+IWn0YuBUUqMj+DLDf8tucq6cFD6Fa+M8SQZdWxcN2/2N07imw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqa2RjtQWWG/e0fAb9DGuzRMYmH/1iSHfNHPjH8ugbQ=;
 b=DbTr41ir91N++DEvRYn8Wl7h4cFn+MJtxB5PjDVVY+4OXMTmqvmN4WBQOxKHIacT5wT4ORzEJR5nrK7cJEp8pNNGfSLQECNNBUNl3fDUfzfNZzjspEw4KbGgKMRRa28rIImWyrz0CK+a0ApqSjUs8YJlwHsQxQ0WNMvrtJF/BjJY7H1/GQ+99nbp45jtQ0S5CbO8hu2/8CSIrz0NRbJS8jr3bHe9CwWuI/JVuPAq2l2EZCk8VcWHUaVNzIXnHqP/HmLK9fqaF6MsC1cD7PmxyT2701JchJICgQwv/a0dIdqpcUt13mhUtvLXIUMU90C0MqL5/P5rC/Y4Hknp0I8elA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqa2RjtQWWG/e0fAb9DGuzRMYmH/1iSHfNHPjH8ugbQ=;
 b=Je0j1OJIziOnGbGPR7/ucqxXR1vu30blNlYGzFrG+CzizRzXYiuV7ZkBajUMUwmFNsDZq5x6bUOeZ4nXdD4ZVRHjPD8NQBENzFbDCa9SUiS8TfGnXTrQ8sj8rOJ+zZPZatsLbpT9Bb91RRL65J+aXlFE0f1zys/mTJhOOGN8mXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeVjHBswMsT/u3LLLihGGAAG/X/vAVcPiSk5lem8bON+YbHm9uYhA0cGynRbzr9nKqXCU9L1d2ofLsDP0+aZxW410kt6nt+tQJVW0n+4aEOYNe0CKxeAYnf8tRxnVw1ecJXR25+CXxPWyzik5RBwE3NPHiBTvlmtzOW2DVdelu75I2JhawRIIKMhSfh2NlG3gkGpkVoQK14G9EHhDXRuRFF9rN9hSw1jwi6FzuD74mrXwdxGxiywca4RkqqWanUAtpoxlYYprSuKDDhqICNjZDUFXjizv/hhBn7VKxeGZrHVGk4ppM5GHDWjDTr3O5OoP77aP4uu7J6t+pBv2yeeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqa2RjtQWWG/e0fAb9DGuzRMYmH/1iSHfNHPjH8ugbQ=;
 b=Af4+e8pcKaVCDjoTYI+ROh8r+xICcU7UIVgfp8Hpq6ZF5u3jrrt9cwNwX/7wCz2RMjMfbfvEZaPbIybfpsya/CSJbK+v9R+sX6paxE031ZJhKqs6U0LUw7rtnvBUADH7hhuGNnGzPq0TUdilijFdzNFH0e1XTGLxIubyvYv9sgd8USkGLlQFgRYFmJ3dLb2ekeXKVeJBPywXpSgUu3YH0QE7ihzw8ntuUHWhDLCjhpc0gOb0nohDmt6nQcuaW5Z6tu75ptf9PiNqaHgCUeuZlzYnraIuuROdR4TiRMAS07KLoP+HUoHkS/LX7Xr4SnSFIpok9ToZhSvYjSRpJVHGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqa2RjtQWWG/e0fAb9DGuzRMYmH/1iSHfNHPjH8ugbQ=;
 b=Je0j1OJIziOnGbGPR7/ucqxXR1vu30blNlYGzFrG+CzizRzXYiuV7ZkBajUMUwmFNsDZq5x6bUOeZ4nXdD4ZVRHjPD8NQBENzFbDCa9SUiS8TfGnXTrQ8sj8rOJ+zZPZatsLbpT9Bb91RRL65J+aXlFE0f1zys/mTJhOOGN8mXQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Thread-Topic: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Thread-Index: AQHY8rrrC5MnTfe7JEO9u4gvJODJ2K40NucQ
Date: Tue, 8 Nov 2022 01:05:46 +0000
Message-ID:
 <AS8PR08MB79911C965936D2BE2CAB81BD923F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
In-Reply-To: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3E38498ED0CEA24A86B6E8A655358250.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6203:EE_|AM7EUR03FT042:EE_|DBBPR08MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3f1c65-ba75-4ac8-9ba8-08dac1256373
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 juTE0kUeUWeUycQu8daPO3PICW59qge03zvor96iEd4AaE+4VbMZQnkltkyy6YQ39kf09Rfv55O8NyvqSPF6Hkb6wJx+BfRpL8dI734QN7zvyVODhU0vTpyNk1nFoxjBpydcpDkTmalMU/0KqBKMgeTy45OHnU3wP/VHvYuNVzFg4z0LNpgA23qE8c9QcruNbkjL6taX0xyeLTznZjc2yCENqPz40sC8NMZrNIvHqXKNJwWkkIOsBl+mD9hIlqJzrbV4sqfXZCMmK+I0+nHSTKOo6weI9xFFYsCdIfPpLF7aLORQmkp0LcOlgnUnuDKjnim9H5BfsFXgr9e9nZp1RZOF0nITlmjGoRdmDnp1/7w8aF1HmjBPnvVdxDTExjuUFxYPyJm4dy+w66P2QbGsSAo3uggrRpYqC6JaYSJi66wjprZiuD6w0QT/w7luhvkXLoHpJMkzBi9nJPFHaWXvBaGeOazeRJht5d1PJh7URGciUdhprK83f52wogSCLKPM3Q5bmzsNtHwPwxDmWiAYAXu0wEJGtkh5bE8nTozUzY60ZjAelSgNVVvgwXEa2u5n06YhaW3uzmj7JVvuUfeAy56Uq9Q83CLiBNCM0vP7BEo8+NKUCZbbHydIxbp2sRcae1hFHJBNLd7DEqq44m1eorH4YVu2Ee/HhG0kLbjO6y7iziTb9KhHhsUpmPL+OCL+2RFL0TVSQcw6VtlhTPMta+5v/vFQ8s0YeQIMT/QOInh5p2McOQmnAJPe3VX4izW78TapchHZlLDi3y1J0Ocaww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199015)(52536014)(7696005)(2906002)(55016003)(66446008)(71200400001)(64756008)(4326008)(66476007)(76116006)(66556008)(66946007)(33656002)(38100700002)(110136005)(8676002)(5660300002)(54906003)(316002)(122000001)(38070700005)(478600001)(86362001)(41300700001)(8936002)(9686003)(83380400001)(186003)(6506007)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6203
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a43baaed-93f7-407b-e23a-08dac1255e68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVsMUZOHJHP7PD3wMV7sTjQAUxUnY8lh1FgDXuQprwaK9wF98IEOQah/Bc3SBTKORaDKuwoPebPYBFjq7eJq0Y6Z53X9WglP/41CjgUI05wTShpdf6QISBuwAPhQMCejXUL7xqZoz815WCjr+bOfEqK0A1IjntqqN3povLkWfHheZSDo0zs0MKfYQZhqD0FuqOqLyAYP1/fqQPA2aVku5E4PzXQVm5Gsn1op6Uq3ROZNyPcfaZikGXKLQaIukL7nGucTb7bLpyYXphWiz3o4Nwmtb88ytQjeXfA18jy1jDM/tXiEU5m38jd9ujY0x9dK/mIN4aTOkXAP7UmEXT9u1mtZj0CRlQ5JqF5OWWRsDs5F8RBqgfTodWbKRjQpj1sXbsQll+Qy/Cazh3DRbW/dmUnorEnjY2p9wMv/w8MLBLCVsHTSdmg3OwmlSXQQZnOaHyYGfEC6ib9FWJUYY/ytyaV55PzQHUJCSrEaD9jrTODXgNwewoBgkhqszncXuSm2UEuo5l7mAEWzYQvjxaUnQp/c9PmF5iijU3uiq7ofBfZVnCEHPqF2nXHmarYesl13hCdt1qFfax2VAzYG6LlxVTBP/tKmyARc6thoCH56g34fx6Ev4lH9wFkaTMG8DJtW44g2Yj50SsBNXhw03DSA5t6Yj9a6tNcQMue4lck4AjgYdAGW3DijMR1iL/hYbPxhDHed5MpZkqjooXumMuwreZASrv8MHSY2ZXz8IvCLWyRnVpJ6rbh0XxW0e12M1EXtKU7R4kDgzHJb2RAVawbyag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(478600001)(81166007)(52536014)(33656002)(8936002)(4326008)(70586007)(70206006)(8676002)(55016003)(40480700001)(5660300002)(316002)(54906003)(41300700001)(2906002)(110136005)(356005)(83380400001)(36860700001)(336012)(86362001)(6506007)(7696005)(9686003)(82740400003)(40460700003)(26005)(186003)(82310400005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 01:05:55.2193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3f1c65-ba75-4ac8-9ba8-08dac1256373
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6122

SGkgSmFuLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1Ympl
Y3Q6IFtQQVRDSF1bNC4xN10ga2V4ZWM6IHJlc3RvcmUgaHlwZXJjYWxsIDFzdCBhcmcncyB0eXBl
DQo+IA0KPiBUaGlzIHJldmVydHMgYSBzbWFsbCBwYXJ0IG9mIDdlMjFiMjUwNTllZCAoInhlbjog
aGFybW9uaXplIHJldHVybiB0eXBlcw0KPiBvZiBoeXBlcmNhbGwgaGFuZGxlcnMiKS4gVGhlIGNo
YW5nZSBmcm9tICJ1bnNpZ25lZCBsb25nIiB0byAidW5zaWduZWQNCj4gaW50IiBmb3IgdGhlIG5h
dGl2ZSBoYW5kbGVyIGZ1bmN0aW9uIG1lYW50IHRoYXQgcHJldmlvdXNseSBpbnZhbGlkDQo+IHZh
bHVlcyBiZWNhbWUgdmFsaWQuIFdoaWxlIHBlcmhhcHMgbm90IGEgc2lnbmlmaWNhbnQgaXNzdWUs
IHN0cmljdGx5DQo+IHNwZWFraW5nIHRoYXQncyBzdGlsbCBhIGNoYW5nZSB0byB0aGUgQUJJLiBE
b24ndCBnbyBhcyBmYXIgYXMgcmVzdG9yaW5nDQo+IHRoZSBjb21wYXQgZW50cnkgcG9pbnQncyB0
eXBlIHRob3VnaDogVGhhdCBvbmUgY2FuJ3QgaGF2ZSB2YWx1ZXMgcGFzc2VkDQo+IHdoaWNoIGRv
bid0IGZpdCBpbiAzMiBiaXRzLg0KPiANCj4gTm90ZSB0aGF0IGFzIGEgc2lkZSBlZmZlY3QgdGhp
cyBmaXhlcyB0aGUgaW52b2NhdGlvbiBvZg0KPiBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlv
bigpLCB3aGljaCBieSBtaXN0YWtlIHdhc24ndCBhZGp1c3RlZCBieSB0aGUNCj4gZWFybGllciBj
aGFuZ2UuDQo+IA0KPiBBbHNvIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb3JyZWN0IHRoZSBy
ZXNwZWN0aXZlIGNvbW1lbnQgaW4gdGhlDQo+IHB1YmxpYyBoZWFkZXIuIChUaGUgd2F5IGl0IHdh
cyBpdCByZWFsbHkgc3VwcG9ydHMgdGhhdCBpdCBwcm9iYWJseSB3YXMNCj4gcG9pbnRsZXNzIHRv
IHVzZSAibG9uZyIsIGJ1dCB0aGF0J3MgdGhlIHdheSB0aGUgaHlwZXJjYWxsIHdhcw0KPiBpbnRy
b2R1Y2VkLikNCj4gDQo+IFJlcXVlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

