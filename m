Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14B570802
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 18:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365287.595412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvxm-0005AU-Ka; Mon, 11 Jul 2022 16:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365287.595412; Mon, 11 Jul 2022 16:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvxm-000571-HH; Mon, 11 Jul 2022 16:08:46 +0000
Received: by outflank-mailman (input) for mailman id 365287;
 Mon, 11 Jul 2022 16:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhC/=XQ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oAvxk-00056v-Nu
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 16:08:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bba62cec-0133-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 18:08:42 +0200 (CEST)
Received: from AS9PR06CA0398.eurprd06.prod.outlook.com (2603:10a6:20b:461::17)
 by AM0PR08MB4098.eurprd08.prod.outlook.com (2603:10a6:208:12f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 16:08:40 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::92) by AS9PR06CA0398.outlook.office365.com
 (2603:10a6:20b:461::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Mon, 11 Jul 2022 16:08:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 16:08:39 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Mon, 11 Jul 2022 16:08:39 +0000
Received: from 1fea33954d32.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E108DE4-510B-4EAE-A927-24BB5D557F82.1; 
 Mon, 11 Jul 2022 16:08:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1fea33954d32.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 16:08:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM0PR08MB4962.eurprd08.prod.outlook.com (2603:10a6:208:15a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 16:08:30 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 16:08:30 +0000
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
X-Inumbo-ID: bba62cec-0133-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VlHGYKAJpib6ti0VaWExV4kr3wrt4lgB7Enc4P3PBi7qxk1CO7sM1jGiKoVoJpbGwLoar97Xq3R/QAEGuJMV+I8oBxegSC+/kKWrnDOoqEgS88SsO7Da0+B4Ws2VddK7Czyyg+JQsBxirwUNppYA4e6skpkMzFGm2zylKZz7dyetOUZ0cKQ03pg0fpQNmyBHkKT6tShlPg6Kv0tXESUqszzI5LNh/80PHestAew32N3yeIXg5q09lvOwwnbDC20Zx34MoIh8MrFc07bsx4iVOd2VXBbCxBT+gXDJgooG7KU3myTmvMK/v8JBRu1cKUseGoWS+VqoTTC39wtjYOrtiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzzUzxRym5wX6T3toMxMnQRrUl504ic1G+KMhuIVNTM=;
 b=QxPA9a+e4e1kZzoNdqusUgYD8Kg8kwMlSr1DXQjhzN0kRhXEfz2suWYtKubnT7Jn/7r4fhwDA9FwQJEBI3nDeOHM44HXMF6wW6cuAjBMFU5fiwPJFf2/H/NYODrNLtWutpcRZHuTN+VhshY8u/bUfoSTXqquKxzT+WszB5JGB0crJ+Lnvq2wUp8ToRfjmXpTBsbEPqh7JaRxyF+9/mjVz/MgZgUtty3AZt64qKKkmBR78pjYVgUP2bcDYPOzdIjH77HCa7o0/HBphWrqO41arFis6xNT6GQ891+VZDQbtj5mfRFOA6EpZIVjamdtka8KEUEq2RK9Rez5bqeg9Xr9cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzzUzxRym5wX6T3toMxMnQRrUl504ic1G+KMhuIVNTM=;
 b=siarQlXbtLbnPFRqv+sWlAZCXZ3ogLGjJbogFRjAZvLnrnWZU7Sh94vlGq8aPeofPMJN5cdKn3giiGYiyIvR6sB3DLMllpMAOvdB30ch1cjjkleFslNtflXt8xEYHXZ5niCCCCqqkMZAhMzouUcElSTBRs8skcYyZ2dNdXDw738=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 152f774723ba7bf8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtOGEMRQCzOS0PXfl9iyn9MJo6LJWBSsXAKLY0op1vmTalW+3C/2+TNvR0AmZQJuxOCvZu4Mp0Fb95rNhyalDSs+7EXfdcGGy4YiNEwhCFpo6/P6v3n+lcudAPxLboxU6vVY/7JU4XNG38zkjTJGkeI8VjCDkKvswHee44Qfo5JFytknQCAG+JPa6NEoyKvad8CEswTaRaacovb4aC5q89ccnjRDM8jYCw52IDPdD+ftcgC4KS0ZvLIEnU7eqBHm39cGFJvjX6s49CHLTx/9mwFka86Vfc6GVMeJ5Tfw6LgzCVYd5IfSgyMpSdKjUuRPtgAg4Z7m9EScsnjFEA8QgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzzUzxRym5wX6T3toMxMnQRrUl504ic1G+KMhuIVNTM=;
 b=acR/QPViUO4yKg24s8LzM0Ss3zQvVbHunfn1f5jezNd8i2tlypBwsNbAvBR9IKiLxeZmOdhC2dbyucAlveGYd2dOM+++VzBfwk4mtYNYoxFMZNR9fTN2CvrDt9qq5W8GuvAvOWudEUbTfroHjxylUMR58xaX5C+5eGo6NaeyMld3qhGt3dL/WjfEZKAruMWsjWuSqUNaFRxYHVU1IHs3JJf96x7nC7J5oUy9kZvzCSuvIOpe/Dvzp/2c0CEnIPoirfN9n6TMb6kpzBSSPbfzxO6MNPEVX2rb4AlsfWU/v9iUaNzpzeqCTP0t+lciIeKMwGcMu0dXFTV3uUP1RhutBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzzUzxRym5wX6T3toMxMnQRrUl504ic1G+KMhuIVNTM=;
 b=siarQlXbtLbnPFRqv+sWlAZCXZ3ogLGjJbogFRjAZvLnrnWZU7Sh94vlGq8aPeofPMJN5cdKn3giiGYiyIvR6sB3DLMllpMAOvdB30ch1cjjkleFslNtflXt8xEYHXZ5niCCCCqqkMZAhMzouUcElSTBRs8skcYyZ2dNdXDw738=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index: AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuAA=
Date: Mon, 11 Jul 2022 16:08:30 +0000
Message-ID: <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
In-Reply-To: <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e57d70c2-7ec9-4666-0b11-08da63579e92
x-ms-traffictypediagnostic:
	AM0PR08MB4962:EE_|AM5EUR03FT018:EE_|AM0PR08MB4098:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ROIqf/uGonm426edlyxZxFkPWvi0DRszZ9Ka6lP0YpmLcAUuy9dOSUTwHrg3Xgm7xj9fJqvh1ly3iifdrlHsrr4taafwukFa/DigZ4zYbSMzlJ9ZWPdqQ2WrDoFg4xVjnbz4JlDsAjSnOmIQ38EG4PMwzYQdvCZPbfn317ukbXqapjQhIRWT5HiBqKvPChnButL0HDJErA6Y7eBRyvG/eItOHmbh6eDd+CNBK2DNj67mPfepwtBd41uQGLt3Ja5aqbxRTXyIY345iIPgfzOtDOfVurYO0UhVdmIijmhqafaxEg1kZBFjHa31Hh0fTkREFWSqyVaxOZk0+jp2A1iAzF5PkuahDrgjBaLV1ASmMiqopR7EUBGyCyQCjt4n8nSmejMDF6iW5kS8KNb6Hgid1KmFE1VdyzsHt6ny+kHkMwOUiKwU87NpPOB3UIhOcvT34285XqbKTw6hTi+Ltn0+OPqh/S5qc15mTx6DlVqRvwxEt3+Kiz0M756u1BgC/GB/8v+vmYcuXw2StLQ+z0WW8Mxb4719IajWnBHOU1ELll6eGCSeedMlEgBTwp/XdWQW1+vTEMalRFl5eeVv7wmUmxywwgxib4oiu+yLDqgb5nQu2DcO2JJZ+BIZsb8yF0jBbA+G8XGOx8jQCUf/WQqaTDJtvCmprou2E6Fy8tEQMnLSDnpFwoDtMHVWLJJ6KHpb2WAiPbnXnEkh/3vaWFdlazy2P63EQgOwrmpXIemshvwmJdaO9LB0vS/UVjuzR/D9LFrK+PKSpzf63PcjvdA6dZfyx767r+HBihq02CwEDw2QNBrG5tzFD5Vv6rDxnCIMp7CJYrJ/GUS9yN6WOYLfmN9+E9ZWDDjzNAlKolkiGw7Nl2upi0953OTKblZEceqN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(54906003)(66556008)(64756008)(8936002)(5660300002)(6916009)(66446008)(4326008)(66476007)(8676002)(86362001)(91956017)(38100700002)(2616005)(66946007)(53546011)(41300700001)(6512007)(316002)(76116006)(71200400001)(6506007)(966005)(33656002)(478600001)(122000001)(2906002)(6486002)(36756003)(186003)(38070700005)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E04C9D03AC3C8A46B4C234462B72CFD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4962
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d18da76f-6787-4951-e741-08da635798e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jNpc71WzSymopoDujKCZqf9GwjKsX0TR98Ud5gF7LJrudu1rXncPK7MvUS7/hZv3KhtRM719ALFIZOw+PC9RVW4+I2LZsMNLz4yLR9b2t2tYfdlYp9B3Kx7azYsDdZkQGXB4W3hTsbhUMRxsmrL+vpy1+gUMo3Rp0naPTnocC1KQeYZbXMuT0SQDEAIkPchvAPgIscPpChStcMHhebJZikxJ3L1I0DkR4RjZ32pfFAFs+NMSi8u8MHD3xiaFtybYRMEWy7sotmh6uK3eWOg5J8D4VcKk1eB37zEHx/X/R2pXPn6+sHiRHEYA0cnyobQpI/wfGFI5wAqDmzJuGpte/oJgS1r5xpOOF5/nWN7bYnyjwMUssCmRUIJPUaFCQeKgWDTZ3LV03NBgjTpMwU5z4OayI9kBNaRbhYyLM9ggfFs5XZ284etESiLXQvAvMfBJ03AoWGefyf7lm3vNZ12CT8ScWrhRJZUu1klfBq1BoclvuPteTmgbRUGIjhYlDOEp8UZQSO8zId6lCCJyXu3Qq7F80PwXTxMypizs1gZKKtJ3kR9wMrnYE/9ysQfoibBbZqDiWgc8Zg85ZkjpWq9aY7jJ7OYmPvA3RKIXj8vSzttWQqibqtTuPJklb/7MWOndO/9U014po07RRK6kvWI2z+pv5BCkkxAZBujV5GMNgDe7MXvIqsMq1crzvhUHUNchxEzmWF1wsyHqzGlaY739KXqqUhLtrHn3B5U5X1CMfrZD6Udt46m//hO8//cmDbwzJF/AZQtkX+DS8LL3gZSHjY4f4MKvAPGbP+NdXDshsy+gfJRw65TcVWmc0WQ2Y8cmWacb4Luton7u7ZIIC768cGnuRTxeaFFWuXkLrcfV5MM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(47076005)(33656002)(26005)(186003)(53546011)(70586007)(2616005)(8936002)(6512007)(2906002)(336012)(82740400003)(81166007)(6506007)(40460700003)(356005)(86362001)(40480700001)(82310400005)(36860700001)(54906003)(6486002)(6862004)(5660300002)(478600001)(41300700001)(316002)(4326008)(83380400001)(966005)(36756003)(70206006)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 16:08:39.9397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d70c2-7ec9-4666-0b11-08da63579e92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4098

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIEp1biAyMDIyLCBhdCAzOjUxIHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMDYvMjAyMiAx
NTozNywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBldnRjaG5fYWxsb2NfdW5ib3VuZCgpIGFsd2F5
cyBhbGxvY2F0ZXMgdGhlIG5leHQgYXZhaWxhYmxlIHBvcnQuIFN0YXRpYw0KPj4gZXZlbnQgY2hh
bm5lbCBzdXBwb3J0IGZvciBkb20wbGVzcyBkb21haW5zIHJlcXVpcmVzIGFsbG9jYXRpbmcgYQ0K
Pj4gc3BlY2lmaWVkIHBvcnQuDQo+PiBNb2RpZnkgdGhlIGV2dGNobl9hbGxvY191bmJvdW5kKCkg
dG8gYWNjZXB0IHRoZSBwb3J0IG51bWJlciBhcyBhbg0KPj4gYXJndW1lbnQgYW5kIGFsbG9jYXRl
IHRoZSBzcGVjaWZpZWQgcG9ydCBpZiBhdmFpbGFibGUuIElmIHRoZSBwb3J0DQo+PiBudW1iZXIg
YXJndW1lbnQgaXMgemVybywgdGhlIG5leHQgYXZhaWxhYmxlIHBvcnQgd2lsbCBiZSBhbGxvY2F0
ZWQuDQo+IA0KPiBJIGhhdmVuJ3QgeWV0IGZ1bGx5IHJldmlld2VkIHRoaXMgc2VyaWVzLiBCdXQg
SSB3b3VsZCBsaWtlIHRvIHBvaW50IG91dCB0aGF0IHRoaXMgb3BlbmluZyBhIHNlY3VyaXR5IGhv
bGUgKHdoaWNoIEkgdGhvdWdodCBJIGhhZCBtZW50aW9uIGJlZm9yZSkgdGhhdCBjb3VsZCBiZSBl
eHBsb2l0ZWQgYnkgYSBndWVzdCBhdCBydW50aW1lLg0KPiANCj4gWW91IHdvdWxkIG5lZWQgWzFd
IG9yIHNpbWlsYXIgaW4gb3JkZXIgdG8gZml4IHRoZSBpc3N1ZS4gSSBhbSB3cm90ZSAic2ltaWxh
ciIgYmVjYXVzZSB0aGUgcGF0Y2ggY291bGQgcG90ZW50aWFsbHkgYmUgYSBwcm9ibGVtIGlmIHlv
dSBhbGxvdyBhIGd1ZXN0IHRvIHVzZSBGSUZPICh5b3UgbWF5IG5lZWQgdG8gYWxsb2NhdGUgYSBs
b3Qgb2YgbWVtb3J5IHRvIGZpbGwgdGhlIGhvbGUpLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gWzFd
IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvanVsaWVuZy94ZW4tdW5z
dGFibGUuZ2l0O2E9Y29tbWl0O2g9MmQ4OTQ4NmZjZjExMjE2MzMxZTU4YTIxYjM2N2I4YTliZTFh
ZjcyNQ0KDQpUaGFua3MgZm9yIHNoYXJpbmcgdGhlIHBhdGNoLiAgSWYgeW91IGFyZSBva2F5IEkg
Y2FuIHVzZSB0aGlzIHBhdGNoIGluIG5leHQgdmVyc2lvbiB0byBmaXggdGhlIHNlY3VyaXR5IGhv
bGUuDQoNCkZvciB0aGUgRklGTyBpc3N1ZSwgd2UgY2FuIGludHJvZHVjZSB0aGUgbmV3IGNvbmZp
ZyBvcHRpb24gdG8gcmVzdHJpY3QgdGhlIG1heGltdW0gbnVtYmVyIG9mIHN0YXRpYw0KcG9ydCBz
dXBwb3J0ZWQgaW4gWGVuLiBXZSBjYW4gY2hlY2sgdGhlIHVzZXItZGVmaW5lZCBzdGF0aWMgcG9y
dCB3aGVuIHdlIHBhcnNlIHRoZSBkZXZpY2UgdHJlZSBhbmQgaWYNCmEgdXNlci1kZWZpbmVkIHN0
YXRpYyBwb3J0IGlzIGdyZWF0ZXIgdGhhbiB0aGUgbWF4aW11bSBhbGxvd2VkIHN0YXRpYyBwb3J0
IHdpbGwgcmV0dXJuIGFuIGVycm9yIHRvIHRoZSB1c2VyLg0KSW4gdGhpcyB3YXksIHdlIGNhbiBh
dm9pZCBhbGxvY2F0aW5nIGEgbG90IG9mIG1lbW9yeSB0byBmaWxsIHRoZSBob2xlLg0KDQpMZXQg
bWUga25vdyB5b3VyIHZpZXcgb24gdGhpcy4NCg0KY29uZmlnIE1BWF9TVEFUSUNfUE9SVA0KICAg
IGludCAiTWF4aW11bSBudW1iZXIgb2Ygc3RhdGljIHBvcnRz4oCdDQogICAgcmFuZ2UgMSA0MDk1
DQogICAgaGVscCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgIENvbnRyb2xzIHRoZSBidWlsZC10aW1l
IG1heGltdW0gbnVtYmVyIG9mIHN0YXRpYyBwb3J0IHN1cHBvcnRlZC4NCg0KUmVnYXJkcywNClJh
aHVsDQoNCg==

