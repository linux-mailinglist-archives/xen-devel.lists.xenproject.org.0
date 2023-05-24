Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EB70F42D
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 12:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538963.839388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lib-0000NG-GQ; Wed, 24 May 2023 10:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538963.839388; Wed, 24 May 2023 10:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lib-0000Ko-Dc; Wed, 24 May 2023 10:27:45 +0000
Received: by outflank-mailman (input) for mailman id 538963;
 Wed, 24 May 2023 10:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1liZ-0000Ki-Vm
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 10:27:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c1bcb1f-fa1d-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 12:27:40 +0200 (CEST)
Received: from AS9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:20b:462::33)
 by AS2PR08MB8335.eurprd08.prod.outlook.com (2603:10a6:20b:557::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 10:27:38 +0000
Received: from VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::b2) by AS9PR06CA0010.outlook.office365.com
 (2603:10a6:20b:462::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 10:27:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT064.mail.protection.outlook.com (100.127.144.94) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 10:27:37 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 24 May 2023 10:27:36 +0000
Received: from 01cbd565a69e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5190F13D-6ECC-4609-ACF2-2B9F18D2E7FA.1; 
 Wed, 24 May 2023 10:27:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01cbd565a69e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 10:27:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 10:27:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 10:27:28 +0000
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
X-Inumbo-ID: 9c1bcb1f-fa1d-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQDou18rh7izUFLGpVEumTsRr1hHQnvABTTGb046RD4=;
 b=qM+0Hhx5fGomAEI1ZMw5LcRPzfm9iSD9YNuSVV4/Bn3ZmyXd8hEzNQMMVr8yV3z2aAbAUwU+OgtMiErK53U6HIoQgCxm7Yw8KvZoEA8+SzT8becKMQKwGf22oBd7NEsoi3XG4B35IjatdfEuL67NLL7IOltmv/SRae4KZ5WgmvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9389547f330a9ad5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT79aPJI2UNDCc9Sl7Mp/Y/liEzGkb60x7nDOR6qavZ+nYL+Hfr0Z8QTqyVY9T6I27U24roEybJZfQ8LJtVkOpGmy2z1ZiRa9Y/WOlsMDrYLjGvBAh5Ta6F9sjE5Gmu1irCfP5D6Q7VRlX5LfH4vpNAfR8yjJI3hQCbo8HX/xb1pmYE12rBig0WHNDSXTG7n6EhZmsN+u/YNtMJOSt0Lgt4oidxINrfQTFYZqMRhf58Nk+b1yDSd271oUUQHNlaGSazlWDhLcAVwWiJ3IZrgKnZlLzHZMYIM7SuvrYi4etmKPujKUyLPF6/oPXe/f+URae4cxk0aNPIHMSAkIRhMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQDou18rh7izUFLGpVEumTsRr1hHQnvABTTGb046RD4=;
 b=UvrCIycxDnqJtAfa2WXg/cLnXein9kqqbYuHSJNNqEzZsewfQHO0yFZ0sSDeTu0BFPpAEbyB8y504WCq5rcUMaBGqXZBkW6232TamAJtbxP/WZUDjyaHhxWeUhGsFry0dlLJ7L99aQEhW8XCEUcbeRsDtRL408AV3LtnsAFVhckg4+cTBCKmOkbHYo0HNH3/Jk1LIv21Y6kPgp009Ej3eCtR4UVXCtVuamPDum2vQo58d+5OtxGh1yMeStBJAMVkLEAaazybKPtrCpVGnZwye5LRjFeBk49znoF2uXr/424WsiJA5CXEpMbzKxMGRjCm+g4kt3iyIHghFEYbEFoBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQDou18rh7izUFLGpVEumTsRr1hHQnvABTTGb046RD4=;
 b=qM+0Hhx5fGomAEI1ZMw5LcRPzfm9iSD9YNuSVV4/Bn3ZmyXd8hEzNQMMVr8yV3z2aAbAUwU+OgtMiErK53U6HIoQgCxm7Yw8KvZoEA8+SzT8becKMQKwGf22oBd7NEsoi3XG4B35IjatdfEuL67NLL7IOltmv/SRae4KZ5WgmvE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 15/15] build: remove Config.mk include from Rules.mk
Thread-Topic: [XEN PATCH 15/15] build: remove Config.mk include from Rules.mk
Thread-Index: AQHZjZZcR9VZERXJ80eRAbM26/D8DK9pOXQA
Date: Wed, 24 May 2023 10:27:28 +0000
Message-ID: <A53E5B44-6898-41FC-BB0B-3B30DAA831BB@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-16-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-16-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9755:EE_|VI1EUR03FT064:EE_|AS2PR08MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: beab92b0-40ce-4a7c-75c6-08db5c417ee9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t2x5W0fFdJ4nWakUEHlhmqEWgcLJSgufrdb4pDo8TjvbmPyydgKMsBK5BMWDC3sLUQRNg54PnTA/Tih5oDU3h3tpSQNR27HZWF0CDIWXdJ4yKDUPJCtRR1TZcY9Oc4/c3y49k41wMZ2VIILTNSQUnhiCDzHPjQJ2I52HPSRViODfkdiYgELDBpnhqSNIQ/nu5flbcDZcPjGoKymljorn/Bivv+vPrdy8KYX6C8vx70XVsmFxoCC4C/eRBIeG+cZFf7NhVbRqBjNxK0SI5TjKqhjrvzpbiNdLK5AjLX5YGeQn3NexoD9m1vvNfrhA2wxoDVttP5JbpWC+JzUao+puQpZ7sWC+W4o8K4Ff0LzqGSOJLKGQSZx+vXl7fGFe0vSiFWsJKgVjYyB5esKxB2xmEtS/vPHgQ0DxZKuagxRF1SvI439jeG6IE+VTtqizgbYrZ68jOIqCIUl3KpJ8IwtAgmxAmrG2iArWMMiMyAnGJVhRDN7z6P2sl384bw9TFRSxiq5oB8WgPbozC9UY2vpsUC+7WzwE3JU/RhP332UlVCF5lSON7UVXwl+yHTGmnuqYrr5A+3FBa6yyVazF8YkgFbIV4ZA6sPoEGqEp9Ia+7ckQi9TtsjHvL6Nru+cGR+DyvJh4CjXW9rplgGwfhfTgpA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(4744005)(2906002)(91956017)(5660300002)(8936002)(8676002)(33656002)(66946007)(76116006)(66556008)(66446008)(6916009)(66476007)(36756003)(4326008)(316002)(41300700001)(54906003)(478600001)(71200400001)(6486002)(64756008)(26005)(2616005)(122000001)(86362001)(186003)(6506007)(53546011)(6512007)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6603D1D432641499F418BEA893F9D92@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f87960a1-b7cf-4d46-3e38-08db5c4179a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYCIu8VnP8NXopIpphtOoo6x+8cxy8CyF/QjujQ8khPjlwxf8XHVu9sB+IIxAP5kPUPD48RmdlvSO5oz1E4QFzi6N+8PP3k1tLDmRlWw3IKv6+mTD8nKepy4nxmS+XdqhL4H5Amt6MJnH2J6A9FItD8erLx7/AQIffH1MGwb18wOp4/OvJ4T/qtS+MjVhrRKxkiAfSIWRGeiCd+yT0dxQRY2wIfWgP8O7Epz1x3x8jrD5xx3vZSPU+M1ms9Wm5Q24LmyOUW8YFwrzfsEZNdhNzNayCelVZDihlFv6haGtQEIoiQpfYlRWltn8FBUTbNJIIb8vLcjrsAB3DbeuVUpSv+tlVVp1rlx+ZNkWKTGOlhuGgTrsxJ4J6tpntzshu9oIxO8NhnsBJFPc9GXYQmTiZNMSieklfWMVvSkvLgGP1AQebFuwq9GwJNM7WcuKiE40mP57XBr9HtPvoK+zBGzZRPZtfeIf65Lfyo4BUElVvS5p54Ma/l1DyBjizJfVCRXdo78m1jrcmbRlWRfary4IqQoKVN2e78cfemBXmTL/5OcR/yZqskojOmUnuPLVjJomgLvkdfYcAu7gT0E2LFkuE2iHk4b536iZRz6mY6N94PbWUwLegunK2ckz6GWMR1kdXhgNjCslQD7uDoc3LNB5lm23yshr+VszZ3Eh+Gvh8wo3wzBqSC4hzgXBMn1VCg/dgdP7iJyf8eczeA5J8uPfLfDFLrVaXtBs46T3IP8ULw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(8936002)(6862004)(8676002)(5660300002)(47076005)(36860700001)(82310400005)(186003)(6512007)(6506007)(26005)(53546011)(336012)(2616005)(86362001)(81166007)(82740400003)(356005)(40460700003)(41300700001)(6486002)(40480700001)(33656002)(70206006)(70586007)(36756003)(4326008)(478600001)(316002)(54906003)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 10:27:37.3822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beab92b0-40ce-4a7c-75c6-08db5c417ee9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8335



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Everything needed to build the hypervisor should already be configured
> by "xen/Makefile", thus Config.mk shouldn't be needed.
>=20
> Then, Config.mk keeps on testing support of some CFLAGS with CC, the
> result of this testing is not used at this stage so the build is
> slowed unnecessarily.
>=20
> Likewise, GCC is checked to be at the minimum at 4.2 when entering
> every sub-directory, so the check have run countless time at this
> stage.
>=20
> We only need to export a few more configuration variables. And add
> some variables in Kbuild.include, and macro fallbacks for Make older
> than 3.81. (Adding `or` just in case. it's only used in xen/Makefile,
> which includes Config.mk and so has already the fallback.)
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>




