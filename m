Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA35ADCBB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 02:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399284.640403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVMuv-0003AB-Rb; Tue, 06 Sep 2022 00:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399284.640403; Tue, 06 Sep 2022 00:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVMuv-00037N-Od; Tue, 06 Sep 2022 00:58:17 +0000
Received: by outflank-mailman (input) for mailman id 399284;
 Tue, 06 Sep 2022 00:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVMuu-00037H-EC
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 00:58:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fba44f57-2d7e-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 02:58:14 +0200 (CEST)
Received: from AS9PR06CA0140.eurprd06.prod.outlook.com (2603:10a6:20b:467::26)
 by PAVPR08MB9306.eurprd08.prod.outlook.com (2603:10a6:102:305::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Tue, 6 Sep
 2022 00:58:10 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::3c) by AS9PR06CA0140.outlook.office365.com
 (2603:10a6:20b:467::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Tue, 6 Sep 2022 00:58:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 00:58:10 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 06 Sep 2022 00:58:09 +0000
Received: from 3748e944446f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A18E72DB-0F2E-45EF-823C-54BBCF1D7B5E.1; 
 Tue, 06 Sep 2022 00:58:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3748e944446f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 00:58:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6080.eurprd08.prod.outlook.com (2603:10a6:102:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 00:58:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 00:58:01 +0000
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
X-Inumbo-ID: fba44f57-2d7e-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=k8UyiCeZHifYZLUWfOYCKL9HkE6rQxquIVtckdWfQ52feCTdZYf6ISr/VNUnRYVI/HemvmNYfMZ0nuvRQRZZQEX7qzHDkzfKQq6yYeGV7iNvra1k917iS3xSF4K/eKMULwrcjQ/n5N7aD4hEtvvG7Ss1/cZztu7p4k4+65Ify22oRs10ydOoXsG5gTD5HqxLoU003qlGKs0rZvvWffZq/uXqXHXs0t+VB9sNKshYlcaG1yr2Ztbg1gc8j2qVSYW4gOSOfkkyTDomNVYLUgy/LmPpZOpX7iDYed97hOwe6IVAvxXlpi0+h+s3FZKhFv3s155UykoWfUs8nQnGF+XEzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7J9WA2MFUmhguNx9IeUrNKEVRRslrxh9aiMqFwCYn4=;
 b=E9Uf8jslrwf6XMtAbVVTtT252CcYw8XzqitYPnxs2Xsn7rL2DLTZyy1DkrIoowKUsXZLyyL2kSMJ2ncTQ/gJvCg/UQioiGwDIa5w0do78yKimJaJOXse+5xjnC4sJeiFW18r4dvwp/tR0P68ElOAU1+ok/62tcD2xFCjt2vh7yG8DXr1acaA8q8P0Zlg0slL9Z1mDtlJjULaoyjv8h4tLCUpN2RojfWHg/5jKkx432HK1typNUYCGrAo5l5Trwj7H+oABCwq8thjtwKSMM51rnHz/xDGEJ6RBPj1KL8stQtQr9O4tD1UZ2wEIIXYu74b+wCU4PfoR/pZOXXGBgbvNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7J9WA2MFUmhguNx9IeUrNKEVRRslrxh9aiMqFwCYn4=;
 b=LCQXIj9xjDK7/4wD6Jy+0j3v0UiqH9XcdttG4HQJ+bQC7G1Af2e4jeWyYbr8aA6rAwCgpL/9orlcOugKKkoPmKRKEtk4iCDYAsE60onZAfSR2XdzxWirTTPEX5ZljxeDXwijqpSgxgx1nU0nXPbNuu8mbM/M5yzH/TlqrLfvuyo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INtsuPp9l5pGtsUz+HKc15hbK8Xj8C+7ckzcGb6RM13pmQN6wh2KqoDcQFOXlNNEg8+jxNbUcLhDNjknwgoYaB3fgWHxpmPRLyQxlkF+a61njOhycRqZZ3uel3DNEbr2BjNAmDLEwlr5x4YNbHA9ZU1H+pZAta5Sa2kDwmjMuJgLXYmJLPeGYl/KJcTyx+JPMg5iqIjZinNy+wRzSmJJDrgZvXx2LGPBo3hHrjOMxO/k20bbEWjQR7jJGzvbNGSF9344ey3DuVoK1674tyuInuIaeVB4uj8u7CNOjIbtPN9EuLaOy6wkEvPHC/sCR37SqU/dlmmZLIKS45agfnC/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7J9WA2MFUmhguNx9IeUrNKEVRRslrxh9aiMqFwCYn4=;
 b=L/wjNlD+aXh0SYhNp1jbOBtJzhLXk/Gi34rg3tMxvWpASteDR3vOU312l5XIK89KJphsFhqqxqzvwM20OKMfsUq3ft9AzhGI/RXKIk0f4WXiEOSzS+/tbdaU3HKqZwjbGWzS/ZEn6fROE3yO1ZFalrg6M3xQ96cED4ln+h4rfoEdtqqyUuFdciJ9p+RILJmvJ3Ick5vwTKoWxCD3kUAMq28iEszdsq+fHqO+WYyV+R1r1JV8pLPYOQM2FZzd5LL7YMPXLXsUYBd4SmmbnzQwWkE1MAFo9b8EfR1LLT3QZrVadw2FyabpzHiuD1TA6eVZ0vFz0HqZdjtpKu+jfdLEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7J9WA2MFUmhguNx9IeUrNKEVRRslrxh9aiMqFwCYn4=;
 b=LCQXIj9xjDK7/4wD6Jy+0j3v0UiqH9XcdttG4HQJ+bQC7G1Af2e4jeWyYbr8aA6rAwCgpL/9orlcOugKKkoPmKRKEtk4iCDYAsE60onZAfSR2XdzxWirTTPEX5ZljxeDXwijqpSgxgx1nU0nXPbNuu8mbM/M5yzH/TlqrLfvuyo=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Liu <wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>
Subject: RE: Xen 4.17 release: Current status before the feature freeze
Thread-Topic: Xen 4.17 release: Current status before the feature freeze
Thread-Index: AdjA2VmJ6EcVoZ5cTOOgVSRHep4cQAAXrAGAABTkYBA=
Date: Tue, 6 Sep 2022 00:58:01 +0000
Message-ID:
 <AS8PR08MB7991FDADDF9314F5BF967762927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <YxYOt4+D5VtkMscV@perard.uk.xensource.com>
In-Reply-To: <YxYOt4+D5VtkMscV@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B0DD53D62E228243AD048BF80D9AC04B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2b39a105-464b-4803-adb7-08da8fa2de43
x-ms-traffictypediagnostic:
	PA4PR08MB6080:EE_|AM7EUR03FT052:EE_|PAVPR08MB9306:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vOtXtVUX5R+Gkqv8uoA5jqfE/fzQmNFaIjMr02I7OtHIEXRhMRFyAlVr1xPwp6VgQ9ODUUFeCwXbpK+D4uRjxJabL61upeXXtPS0cI0HlJeKBtXl1IyLXHao8zW3Tyjn2J1qpAKqMm2g8prw5S85COR6/bPWNtlEVXyYPoVJnS7HXzGoyQqu2y4Ob4mwGcRtklHVJPFrwuiC+d5eyZuI+qGy22IgRkMBs0Qnyb8MBiOKB1dzh9wHUUXaR9hBxzpjy521tBfvayrrBufCwTepZR+tsdJPW+r9R/2n3giU0IujvraxL1VUi/926MGw1xqTPFU/cEDI4vM6PoayaTZpBt7JgnGi21Rm45g+orkjsFgMEWk+83yM9QK0KouPyV0ZmTdNfPRsk+9YldTEFxCsr7GO0O8/okuzTY8T/WN08jgR+WytStDQnaO9VnXLrRP9U34hh2+oAqeeLrX2QCzLnz5Ng6Pvfn98GbiO6DDL16ecGiWj2X1rFY++D27Nq1tzED4wvbi2wSx4PYDASTbCJhkRzVBYeXMfbIL1Y0AiAPfSppZ3edz0O0KBv/EsK2zfJr4fyI1gxyoz6ZojD2fUkOkFMWio56n15S6ko6lCsxmqCG+ZauKjeobCWHNGclNJQlYyKMw8GTdBQIq93W8RuvBtmf2Vw34GzPDN2HnFJfU4+o5SQToav2p04fEc6r5z3NKzoEKLMoRZAOdqwZaseGmzk1Zz3qBor+o0kLH5HsslY5LWjvcsFi2Yj67gJsKZ6cwJFQUeBV6vNEHU5EZYSFgQc9LCBkl/ibfnf8zrq2U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(54906003)(6916009)(9686003)(55016003)(316002)(38100700002)(122000001)(38070700005)(2906002)(86362001)(8936002)(5660300002)(64756008)(83380400001)(76116006)(66446008)(4326008)(8676002)(52536014)(66556008)(33656002)(66946007)(966005)(71200400001)(41300700001)(186003)(66476007)(6506007)(7416002)(478600001)(26005)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1e8a26a-980f-487f-0918-08da8fa2d8e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08vUvFlsWFSz9kehAIt798GSwho8yscrvh2bEp3xMcY7QbitF+5bvYslfQGXvbAUoRfBtYT/YIG5Tuhhho3BwVAo4/BFJn+gT1JZ1bCQG+ERw5rHo9hCI26bN2H9vIv2W9oDQkKstKpRbKuef8+PDVypbtxcMCg18FW2Hr5YuCoC4WDoNHED7YXCS/XyuJa3QIRruiu0h7Pj+m1Es7msncH9gDXgqsV7FR7Dt6M9y9X8qtklsfORbW2zyby3nUBJqdbvLaU3Q26BaYHNHWqOTrKaE2XGj/Lm1aHvTt2DEonKHmEVZfO+8Va2gs40o5mR8K5vm7+K2yNBTchZFPN57Fb9tir65SvHOIUskPl9d3XgDpN/TW2twls3YkBtWGi8P1WHUcLdRRpMjU+wGUvvcgAD/4J4x6/gwfhdYej16D5zt2YkYwKbVfd+I6w7Krura6Ozg6Dj7JjOh6gXfPqYYKxL9GjsZQOhru2Wq4MyLAteGKvJafDHwlPEraNIUVQ7uFiCt+/ZqAKMRUD9/HXWZTfpDQCvbaNoZcFXT94bbmd2Dsx/7ZWY0h/nFFragX0eizG3XdM73wkTX4rd5NFR53+c85An8ljVZ2FfsVJfPc3q9ocx7kbmYBP7Ya4GrMbGTjJ183hVwb6BuHpweoHALxe9rLZFg2qYk7sTKJgtcFDron8zfJR8HjAVW4Df5c5tj6XXWDw+syR23+G9qZU3d3sw6QMCB5AeETYCviT2sB+tdV3YA/Q+AL0LzR3e9tT4ogCF0PF2rRqkDOZrc6xm0YbCHvfgJt9Wc5fqyI0uXRU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(40470700004)(36840700001)(46966006)(82740400003)(8676002)(356005)(4326008)(70586007)(36860700001)(81166007)(70206006)(336012)(186003)(966005)(41300700001)(40460700003)(47076005)(107886003)(7696005)(6506007)(9686003)(54906003)(478600001)(26005)(83380400001)(8936002)(40480700001)(82310400005)(52536014)(55016003)(5660300002)(316002)(2906002)(33656002)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 00:58:10.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b39a105-464b-4803-adb7-08da8fa2de43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9306

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: Xen 4.17 release: Current status before the feature freeze
>=20
> On Mon, Sep 05, 2022 at 03:44:33AM +0000, Henry Wang wrote:
> > ** Blocker List **:
> > 2. The fix of libvirt after the virtio support in toolstack
> > Status: The OSSTEST seems to work properly, apart from what Jan
> > asked in IRC - the qemu and omvf OSSTEST might need a force push.
> > (I am not sure if this has been fixed so I just carried this)
>=20
> The build fix for libvirt have been applied to the project libvirt.
>=20
> osstest needs to be updated to be able to build recent version of
> libvirt. But we'll have to wait until Roger is back to update osstest
> (patch for osstest are available).
>=20
> Once osstest is updated, it should be able to test the recent version of
> libvirt and then start to use it with other branch (qemu and ovmf).
> I don't think a force push for qemu and ovmf is necessary, and fairly
> soon not needed.

Thanks for the information. I am personally good with it.

>=20
>=20
> > ** Common **:
> > 10. [XEN,v2] build: Fix x86 out-of-tree build without EFI
> > https://patchwork.kernel.org/project/xen-devel/list/?series=3D668331
> > Status: Reviewed but not merged.
>=20
> I believe this should be a blocker. And the status might be that I need
> to update the patch.

Sure, added to my list.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --
> Anthony PERARD

