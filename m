Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D351D80C
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323069.544605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxFm-0001I3-Cz; Fri, 06 May 2022 12:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323069.544605; Fri, 06 May 2022 12:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmxFm-0001GE-9X; Fri, 06 May 2022 12:40:14 +0000
Received: by outflank-mailman (input) for mailman id 323069;
 Fri, 06 May 2022 12:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuCn=VO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmxFk-0001G8-VK
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:40:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf0e34c-cd39-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 14:40:11 +0200 (CEST)
Received: from AS9P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::16)
 by AM6PR08MB4232.eurprd08.prod.outlook.com (2603:10a6:20b:b4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 12:40:08 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::bc) by AS9P251CA0018.outlook.office365.com
 (2603:10a6:20b:50f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Fri, 6 May 2022 12:40:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 12:40:07 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 06 May 2022 12:40:07 +0000
Received: from bece71d4864c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A40D9F2E-CBCC-4B1F-96AC-25882DBD365B.1; 
 Fri, 06 May 2022 12:39:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bece71d4864c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 12:39:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB4307.eurprd08.prod.outlook.com (2603:10a6:208:13d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 12:39:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c%7]) with mapi id 15.20.5144.027; Fri, 6 May 2022
 12:39:55 +0000
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
X-Inumbo-ID: aaf0e34c-cd39-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DVcQjT/kz2UDVTXJl/p5LK1MG/mM0AVi6S73eqJzTVs53dGcH0NhHl9DEjEnzN7/K8OIYuZG+ghHtkeBBmCMFJ12Hm+uFhhxBg5XiRkMLFJOmu8TO1l9rYRanJ1PPrjLGw4Jh1PBzkVvbTrxs4lpk0pVN+TlfT/l41gHgqjCCxOiCnBSXy/Jf9zHtvGGNlIgqcyFmF6wIMno1Cb+IvPoHCLQIyryLn7Q6CArfWlPAHfWchlPV6/lLTl0nzFOFUtSzlNgab0H9X3mrOjlfzwLTTgVujuDwRJD4D6oXY3kzK7m77u0l4cgamAM3ZRgb/SZsI9vY9HXjv/ZfNkwkOd7VQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFNE7/+zluslQcX6pwyHXxsd++W2iDNOce2ssCCoTcM=;
 b=n43R5hRr630NkPQrAyFwhKV7UGFmKjFqXKMkuBOZQS77x86kMYsmqIrYq31HaOj91bKAx2ANQHpDJEapYgqEnw49bMIoReIHmZ5sTFGjdUbiBbefwqxf7uHWSK2qOxuk3/AbEAnVcgrhN2BxgcgYskCtVhBgTZCxlT0Z32OISLMcaKumq46W2RveDXkKZF240Fz0DCsKHuX4wb3chlxSKBFefODgOV+5nILBWMEEvEjAMXpbZFL3Frkso+Qm3+U1I0sEApcqYIZZcVgibNFKYL4YFKHs53dBaK39plBYwRRDce5nZYo7NSUV0FCiuuSkZ8M7T+i9VyuQO0VZLOkOKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFNE7/+zluslQcX6pwyHXxsd++W2iDNOce2ssCCoTcM=;
 b=ECtA9jZjM7QTGsOJAm3oqTbDjgexnd25lVTNJaZEDiq5QjeEmi22XVmVo808XJwcpVHg6/mMqcI+NZceWuNxVQRPFuTgE4jPlJITp5QnhZU4nz6SU89JfSAn7VPxlOCx5pcpOKSLO8/TfVluDaCtJeKThttoGHng2pDvMV28pYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYGlGCC1zLPQ6n+PMqt57GI6YeoeyNfjH/ibDM34mbMQCvfnyyfYXSNS9e19yLhido+a3TFmJFJFgg94LcFEeJvCF+ovRxkNpfgkEm0Jjm1hfLivOOCLU9WShz5OSSeD7canHsnaTNjjPRdvfEOnyGZnT1j9z93sWgWLzmZrvWhziLnjELOzwfikFttsuf3oxWYtejSMXKsvqL6ECQRdbTwG1juNsjG+MS/4PHUKNon5CppL0NNp3ZHtKW+XyrSEJ6IQFNMS7gLIkohKhnG+IUgEzlVq+aOm/tafNhnjbblo/McnbAy7j13EXJan0JCmT01FGdyXCAleX2L6Fllcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFNE7/+zluslQcX6pwyHXxsd++W2iDNOce2ssCCoTcM=;
 b=Wvd/ITjzwtqbDQ0efDsMaohdpz2jqUVMQaDklJFfQDcqWNwxZ04iTmeeOhS9OKbdhYLYf0I2rXtxiM/QlSSw97aEmbVXgqondO/wFTYhJdfB30a5wOsNyPoRQr/bkGaG6TVyqlPsPekZ/D5BNqsq8VLho/gMVmisL7UUGm3mkoZnyVkA+KRwF6IXOTP1YEMghYf5kCsQ/s71DEWpHrmf8tYG+anazDPKYYVQUbuU1YguTjk5NuU0yyUuxwkThPiCEKanrB6B6nQ0Ga8s8oGoy8yomILSfUutGCH75Xu/2fSRuQtk/2JYaEyhNEh8GOO0rB8bk8BkJZVXCtVCAZrxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFNE7/+zluslQcX6pwyHXxsd++W2iDNOce2ssCCoTcM=;
 b=ECtA9jZjM7QTGsOJAm3oqTbDjgexnd25lVTNJaZEDiq5QjeEmi22XVmVo808XJwcpVHg6/mMqcI+NZceWuNxVQRPFuTgE4jPlJITp5QnhZU4nz6SU89JfSAn7VPxlOCx5pcpOKSLO8/TfVluDaCtJeKThttoGHng2pDvMV28pYY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<jgrall@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Topic: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Index: AQHYYQ1+wSNISpljvkG6pMKyJcwNSq0Rpx4AgAAWlnCAAAmQAIAAAnVQ
Date: Fri, 6 May 2022 12:39:55 +0000
Message-ID:
 <AS8PR08MB799158DE5F4993AE6346EB5F92C59@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220506055201.999277-1-Henry.Wang@arm.com>
 <20220506055201.999277-3-Henry.Wang@arm.com>
 <6a44bc43-c392-2eac-d350-ec87cb2c3ab3@suse.com>
 <AS8PR08MB7991DBFE189E7FC5E63C1EB392C59@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3dbdf5a8-1257-01b1-f61a-a39163be26fe@suse.com>
In-Reply-To: <3dbdf5a8-1257-01b1-f61a-a39163be26fe@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 52DDF5847446FA4E9E1445B6DC27DECB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f2eb56e6-acbf-4428-f308-08da2f5d8d5b
x-ms-traffictypediagnostic:
	AM0PR08MB4307:EE_|VE1EUR03FT024:EE_|AM6PR08MB4232:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB423274C5C63D75768F0268E592C59@AM6PR08MB4232.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8bpyQNapg8MDc5iRxVCZgnK2u42NMhbEi6eh0pOVxJcE0K+VYReqbH83nJ5vvBxdtQxOzHtDbgyQpU8+yrie+3xKoQ/B3VebFMbeldDFSIUF57lMSQ5Fg1CMgMjDqpoqC3A0nRHaCudg0oVS+mUjS1dvOa+wLVO1sIqLQVXxgF0Tfa2xEFRgdUZHmhkPqw+HrVzvB2IrkmyHJnggU/+eCI1c/dBMtBC7wRaffILq+IhdQ1boP9cOjvo6DXi+EGD8yOdEyLWpv/jxnCMRswuJtXwdCWtOJW3hscrUngbMpVXVh2282Xzab/rePj8XxLmntSq6VYHqyZivXQWIkcmRV9x5XM7vSnqJXTrRglGX1V7Jvx+P+dv1U8k6ACmeh4M96KgUOxaTavTckn6S6FZSHYjIpUucdyehr0w4LdUHze3lIEu+EW4YSEW5Nz4ReqsN43YQeQ55jFR7pYbYZd23WgO/3nJQ3BtHUgz2+OJpKkImnVdm8dP4igUA4n/E/mSHARm9bXqKaeWb8eVYeWekS2qFhR0q8zkxTMUR2na9XEK+3WFeWml0IXXGBoXWMsNBsNsPzMM4FLXQFgUYf2c2X0Drig0fRevGY1nvEdreDRfR26tpmH7iCUJZnB03TmhnJa4PLjoItvsDOnec253t/C4U8qGBya7+zLBDwQLuQZTVa0ZmtMVAfGNtOVJhM1IcPMMAMKpCy6WqudcUlXRwfg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(52536014)(55016003)(8936002)(5660300002)(316002)(83380400001)(6916009)(54906003)(186003)(33656002)(53546011)(2906002)(71200400001)(6506007)(7696005)(122000001)(38070700005)(38100700002)(66946007)(66476007)(66446008)(64756008)(66556008)(4326008)(76116006)(9686003)(8676002)(508600001)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb782574-97f5-415b-50a2-08da2f5d85ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+nVRhg9Ua8bqQmCuIxasjhqRUAgqJI5UPpDMQfNYDUMTiTlK8bBh6czop0d8IHPa1NBDqdoFxfbx4Ge/MG/CPVDCJGwUxySSwOAASMdK7O0ZjIh2haOLLwzAzq9yqqL+b0Npde2v4zL1pRWugEuxcSOar+omI8P/5nO0ACKnx9hDzwPO95ft7u6GMXBp2t7W7zs91wb2l+Ob9nHXGAow5/s6N5McRww+D4ODwEceX33cAUHNrojHXAo0O1xniW9SAMfWXmzzstjv/qK6rFCHRaUxlwroL+3xxVt34lgo6KkrBBC5cwnQXhvQaDrNO72ihDnwFs+qplD0yI9vkM5faihLk1KiG81018Gurqvti48Wd3WCsZ+4fcjul5RAKeUK7+MYrgQhV3iRlZ1Q+D3CewIWSxZny6B7RfYmlUVvl58GJ6rIazX1ttNeqssHiX4ws3O+hCLQlkauFPdHZOWWt5dRdG8AGBmcLAX8l0q5QhNMRbjjWPtw4h+D88w0zylxurS+UP2rP1MigbBsXWeGL55z1QzxT3WMsD2MMYetl0sh/P4V+roDQHQJewZzqWynTwPbq2nGZPaoK1lii50eD9AcqxhxllrM1RID/1b3UehsyNHeJ034aOmGSJGC/98vY1tE5FgYy8Qrv2JKVZZGwb+QoIcWGScfhCDIS1EiqTcFLez1w+LUqBR9HmnhsMA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(316002)(54906003)(7696005)(40460700003)(9686003)(82310400005)(53546011)(6506007)(26005)(70206006)(6862004)(70586007)(186003)(8676002)(47076005)(336012)(83380400001)(33656002)(4326008)(2906002)(86362001)(356005)(81166007)(55016003)(52536014)(8936002)(5660300002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:40:07.5330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2eb56e6-acbf-4428-f308-08da2f5d8d5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4232

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE9uIDA2LjA1LjIwMjIgMTQ6MDMsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBNYXkg
NiwgMjAyMiA2OjMzIFBNDQo+ID4+DQo+ID4+IE9uIDA2LjA1LjIwMjIgMDc6NTIsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jDQo+ID4+PiAr
KysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jDQo+ID4+PiBAQCAtNTk0LDcgKzU5NCw3IEBA
IHZvaWQgKl94bWFsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZw0KPiA+PiBh
bGlnbikNCj4gPj4+ICB7DQo+ID4+PiAgICAgIHZvaWQgKnAgPSBOVUxMOw0KPiA+Pj4NCj4gPj4+
IC0gICAgQVNTRVJUKCFpbl9pcnEoKSk7DQo+ID4+PiArICAgIEFTU0VSVF9BTExPQ19DT05URVhU
KCk7DQo+ID4+DQo+ID4+IEZvciBvbmUgLSB3aGF0IGFib3V0IHhmcmVlKCk/DQo+ID4NCj4gPiBP
aCB5b3UgYXJlIGRlZmluaXRlbHkgY29ycmVjdCwgdGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91
dC4gSSB3aWxsDQo+ID4gZGVmaW5pdGVseSBjaGFuZ2UgdGhlIGFzc2VydGlvbiBpbiB4ZnJlZSgp
IGFzIHdlbGwgaW4gdjMuDQo+ID4NCj4gPj4NCj4gPj4gQW5kIHRoZW4gZGlkIHlvdSBjb25zaWRl
ciB0YWtpbmcgdGhlIG9wcG9ydHVuaXR5IGFuZCBtb3ZpbmcgYm90aCB0bw0KPiA+PiB0aGUgcmVz
cGVjdGl2ZSBwb29sIGFsbG9jIGZ1bmN0aW9ucywgdGh1cyBnaXZpbmcgZXZlbiBiZXR0ZXIgY292
ZXJhZ2U/DQo+ID4NCj4gPiBZZWFoIEkgd291bGQgbG92ZSB0by4gQnV0IHNvcnJ5IGFib3V0IHRo
ZSBxdWVzdGlvbiAoanVzdCBmb3IgbGVhcm5pbmcpOg0KPiA+IEkgYXNzdW1lIHlvdSBhcmUgdGFs
a2luZyBhYm91dCBjb2RlIGNvdmVyYWdlLCBjb3VsZCB5b3UgcGxlYXNlIGtpbmRseQ0KPiA+IGFk
ZCBhIGxpdHRsZSBiaXQgbW9yZSBkZXRhaWwgdG8gaGVscCBtZSB1bmRlcnN0YW5kIHdoeSBhZGRp
bmcgdGhlIHNhbWUNCj4gPiBBU1NFUlRfQUxMT0NfQ09OVEVYVCB3b3VsZCBoZWxwIHRvIGEgYmV0
dGVyIGNvdmVyYWdlPyBTaW5jZS4uLg0KPiA+DQo+ID4+IEdyYW50ZWQgdGhlcmUncyBvbmUgZG93
bnNpZGUgdG8gbW92aW5nIGl0IHRvIHhtZW1fcG9vbF9hbGxvYygpOiBUaGVuDQo+ID4+IHRoZSBl
YXJseSB6ZXJvLXNpemUgYW5kIGVycm9yIHJldHVybnMgd29uJ3QgYmUgY292ZXJlZCwgc28gbWF5
YmUgd2UNCj4gPj4gYWN0dWFsbHkgd2FudCBjaGVja3MgaW4gYm90aCBwbGFjZXMuDQo+ID4NCj4g
PiAuLi5hZnRlciByZWFkaW5nIHRoZXNlIEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCB3ZSBuZWVkIHRv
IGFkZCB0aGUgc2FtZQ0KPiA+IEFTU0VSVF9BTExPQ19DT05URVhUIGluIHRoZSBiZWdpbm5pbmcg
b2YgdGhlIHhtZW1fcG9vbF9hbGxvYywNCj4gPiB4bWFsbG9jX3dob2xlX3BhZ2VzLCBhbmQgeG1l
bV9wb29sX2ZyZWUsDQo+IA0KPiB4bWVtX3Bvb2xfe2FsbG9jLGZyZWV9KCkgYXJlIHdoYXQgbXkg
Y29tbWVudCB3YXMgYWJvdXQuIEFuZCAiY292ZXJhZ2UiDQo+IHdhcyBtZWFudCBhcyAiaWYgdGhl
IGFzc2VydGlvbnMgd2VyZSB0aGVyZSwgbW9yZSBbcG90ZW50aWFsXSBjYWxsIHNpdGVzDQo+IHdv
dWxkIGJlIGNvdmVyZWQiLiB4bWFsbG9jX3dob2xlX3BhZ2VzKCksIGFzIHlvdSAuLi4NCj4gDQo+
ID4gd2hpbGUga2VlcGluZw0KPiA+IEFTU0VSVF9BTExPQ19DT05URVhUIGluIF94bWFsbG9jLiBJ
IHRoaW5rIHhtZW1fcG9vbF9hbGxvYyBhbmQNCj4gPiB4bWFsbG9jX3dob2xlX3BhZ2VzIGFyZSBv
bmx5IGNhbGxlZCBpbiBfeG1hbGxvYyBhbmQgeG1lbV9wb29sX2ZyZWUNCj4gPiBpcyBvbmx5IGNh
bGxlZCBpbiB4ZnJlZS4gQWRkaW5nIHRoZSBzYW1lIGFzc2VydGlvbiBpbiB0aGVzZSB0aHJlZSBm
dW5jdGlvbnMNCj4gPiBpcyBkdXBsaWNhdGlvbiBvZiBjb2RlPw0KPiANCj4gLi4uIHZhbGlkbHkg
bm90ZSwgaXMgb2Ygbm8gaW50ZXJlc3QgaW4gdGhpcyByZWdhcmQsIGFzIGl0J3MgKDEpIGEgc3Rh
dGljDQo+IGhlbHBlciBhbmQgKDIpIHdvdWxkIGhpdCB0aGUgY2hlY2tzIGluIHBhZ2VfYWxsb2Mu
Yy4NCj4geG1lbV9wb29sX3thbGxvYyxmcmVlfSgpIG90b2ggYXJlIG5vbi1zdGF0aWMgZnVuY3Rp
b25zLCBzbyB3ZSB3aWxsIHdhbnQNCj4gdG8gY2FyZSBhYm91dCBub3Qgb25seSBleGlzdGluZyBj
YWxsZXJzLCBidXQgYWxzbyBwb3RlbnRpYWwgZnV0dXJlIG9uZXMuDQoNCkdyZWF0IHRoYW5rcyBm
b3IgeW91ciBleHBsYW5hdGlvbi4gVGhpcyBtYWtlcyBncmVhdCBzZW5zZSwgc28gSSB3aWxsIGFk
ZA0KQVNTRVJUX0FMTE9DX0NPTlRFWFQgaW4gdGhlIGJlZ2lubmluZyBvZiB4bWVtX3Bvb2xfe2Fs
bG9jLGZyZWV9KCkuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KDQo=

