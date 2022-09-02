Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE65AA653
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397225.637724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxKW-0002dD-He; Fri, 02 Sep 2022 03:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397225.637724; Fri, 02 Sep 2022 03:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxKW-0002aM-Er; Fri, 02 Sep 2022 03:26:52 +0000
Received: by outflank-mailman (input) for mailman id 397225;
 Fri, 02 Sep 2022 03:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnAz=ZF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oTxKV-0002aG-8U
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:26:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13d39978-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:26:49 +0200 (CEST)
Received: from DB8PR09CA0032.eurprd09.prod.outlook.com (2603:10a6:10:a0::45)
 by PA4PR08MB6238.eurprd08.prod.outlook.com (2603:10a6:102:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:26:46 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::97) by DB8PR09CA0032.outlook.office365.com
 (2603:10a6:10:a0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Fri, 2 Sep 2022 03:26:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:26:46 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Fri, 02 Sep 2022 03:26:46 +0000
Received: from 9bed2a2855fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F014644F-02A0-496E-88C9-0B220B44554F.1; 
 Fri, 02 Sep 2022 03:26:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bed2a2855fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:26:35 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by PAWPR08MB9098.eurprd08.prod.outlook.com (2603:10a6:102:342::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 2 Sep
 2022 03:26:34 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 03:26:34 +0000
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
X-Inumbo-ID: 13d39978-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iCzPFQzzb+wzYfjDbGf3wZNsWjJl2c/2ynBlPEoL6G1gDTDrnk3qlk2zgATyMvYInScQ7M1vu0ak3XtKo2//qOF/V3g1bb/y8zHgphRpACtGd0o0RbzvhLvq14DAZt1kqMeKZYgx0tjxyT1gAAMdf1VdQ+7Bs/76jXLju7vN/1MibD8exJO94ByKZNl6yLfZSYqLDGnCgYyW8dlPZVEz9ovpShtY9eWt6WxnzBdMyxeWJjLksrg+8mtYgZBAvRKcGSei3tP5zfwo1GVuB/D9GoXcd3JUZsHPRW/Un/tiQMXnftpDNtb1rD/FLy7JclC1RvCvu+8dhiwMiDSBQLCscQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXVqFggeAI10CnlEnx3E1YjQaDN/L131D7NPhJhQZCk=;
 b=JEJOYCqgT9fhaF8NIfBmkRvJ4ue13V/7KlT0ZnSUzGFvgMP/f1WMMiVfE8OjpjuRlyke/s4x4lWw8sQPDYd9d6y8NfLknUsJ7Uevne1ofeWRc9o1IVpYvrsQ8c+9PuhHbgfJfPsxp+tdW1EshLHYEAW9G31S/iBOPqZ82bHmb+NnfWeErIGTZPBc86kMB2Uz7RQeAHST7eUIUo9nyHBrKegDDu7B5/R3M0ME8pi0RGF/tskfVMATP8ZEsgm1OadFXdHr9aWTLDonskI6cu4KzaUHvaJ5edABoIXegSZD+zszde+N7Dw8EVeGvCd0eU7kROL9Z1ZjbrSgIECWkGLDBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXVqFggeAI10CnlEnx3E1YjQaDN/L131D7NPhJhQZCk=;
 b=yA1BAwF+s0ex8EGnflQEqKExNO/WqFGQ6kT44OQvJoo1dFb8sCHLxqh4Op2vVl1szTO0kq+EYVt3L/oHCV5YPgo9UzZKm3Obxx6tbjy/v+WSfi6t08xuolQ9zP+5gGB0rRA1/lsjq3Jt/EeYHlKo4I7elt7IHSyl5uCGIm/jR80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv2SAnm6H4SLYkGmStkB/qdfS+MBUnx0TNToQGgBN4rK3cWSCQyJXks9lxI1fvl8K8u24e2IZCjqJ3MIIFF8pi+yVt7HC3clYtYV+WWAa600BX6XN68eWVupCBYIqoqNPlmAU/NtsSHaRhS3hQ5Q7fLtalefUrMQ3yfyAkqSgxHwKFUq8DGOaNnMsKpkTibbRVKOhVmwZG9+9JC3vZZOVfzfIqXK8VOqD2H+mUHCysH4FtPNIgG5PbZeZ8f0MxDPOhthsIKYh0Ax/5ie3Fk8j7wskNHLt0sjdSqk/+/bYyl5+Mcd/khmOfSImQ4c1OetbFLKpFSozMvWV+CCCNbIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXVqFggeAI10CnlEnx3E1YjQaDN/L131D7NPhJhQZCk=;
 b=XKUdMiFANikdHBi0ySiprtZqLJuWApph+y8xM2rD9T/AkpeFA3FMBJ/QGCY7IzCqy0/4SxIEOrgM35TFVS9H1F7hvKvfuObiKQVvAin3B+K1gksqPhFQoRRg8RJa7C0hA0HExdEqfkMRF1RlF0r0PDCovUABh5i/BgNkJV4rmzmmGygukmJDXVhjz0M77Cd1MqDBMlQ64BlP3kj14Bn8fQUGMH3ALGmwiYED+ar0R+ZVLsdPkXG+3sYT1y1IbQnhH5ADHUfTR/gNTt9kg8lTk9fggdrt1I7efyqBLfQ0rfFRgc8wx5O6dJOB+XSQ/6FrbiEituOgezAm98Yb99sDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXVqFggeAI10CnlEnx3E1YjQaDN/L131D7NPhJhQZCk=;
 b=yA1BAwF+s0ex8EGnflQEqKExNO/WqFGQ6kT44OQvJoo1dFb8sCHLxqh4Op2vVl1szTO0kq+EYVt3L/oHCV5YPgo9UzZKm3Obxx6tbjy/v+WSfi6t08xuolQ9zP+5gGB0rRA1/lsjq3Jt/EeYHlKo4I7elt7IHSyl5uCGIm/jR80=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Index: AQHYnQTR3P1Hf4Rlc0O1VRJveInV4K3BYj8AgARCxICABVMrAIAAtVaA
Date: Fri, 2 Sep 2022 03:26:33 +0000
Message-ID:
 <AM0PR08MB4530DD45D81B4238A1011500F77A9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
 <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
 <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
In-Reply-To: <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 86737EBE24B9304BABD3CD5BCA0D2460.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 93ab6402-fc02-481b-b80b-08da8c92f6f8
x-ms-traffictypediagnostic:
	PAWPR08MB9098:EE_|DBAEUR03FT014:EE_|PA4PR08MB6238:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IxLm17OxFUp354HwzQ+7DQEbUGQNTt1KSwgvDKH5mgd5xJ5QcWKGGPHd+OpBkOZvQD5sg939slF69IrUJ8lk927GhXSNodj67yjDNt4cOozd4auIrbQDz+6mEvdsEJdohvuJWO3Yi98Efkj5/zuHI11snocSM6W+P0HlSBvBsdCQN/RI77XtTQUw8oI5GOO2Zni0rNjTeNVBVJFZtvDdqdlgQVXvTPMwqpcxXi49wadpQ3Q954lxrl7ETCZrENINIeirk27IC1P/6V7q16ROWUMgq//MMFYQ63cHL4XJ1X3l6PiT9iFJ7s1ktNN6igmGws9uoR4J6xZQnre2nqljjySJNIX/T0W7rsflU2qpSKbBeHxrdiI0pp7URd+NogiHcUygQluv2JHmT8Z4HOAmCtG1OqbfKLUjUVNtO9DgXx6iv/33H+OFgSpkICPrCmEJwl/YrAZOe7p2QlC/fEkHt3nVJqLuf+wq9LXlCWFZ4JVxqLjAyq4Vr4i1L7bwhoWXMEiIiDQdg4+pd+JuqBzoj9TmzscdM4WbkPAAP9N7HTOSIK+cbNbQLjgt70haAfDSrDoVfSwVnqYYDlL+GYHTinvwgLk/Ge5VuGnwZdFtM09Culen7GF2gYiOLuxeoQ/Wnx6tiUrd3VXimjc2SgvTfBlSF0EBmv5QnS05bsv7JvhOGXXYop+0BmZzJ7sGqmoI1Xg7vsT1GuKsvxBZBWE/oTj4KFYqk/IJKG7cXGFIIZkB5VXFHarais8Q2YzZSJFwqK77E7ooYsqiXKiJ0MUWaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(66446008)(122000001)(55016003)(38070700005)(86362001)(66946007)(5660300002)(478600001)(76116006)(8676002)(64756008)(4326008)(66476007)(110136005)(8936002)(38100700002)(52536014)(41300700001)(33656002)(54906003)(71200400001)(316002)(186003)(9686003)(6506007)(53546011)(7696005)(66556008)(26005)(83380400001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9098
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ae63817-3f02-488c-95ce-08da8c92efae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5IH5OQiHcbmn79bHaDUN2Pe/AsKqc4trL1NZRe8g7CHL5ze6zaL3vz5QxcaYGCz1xdS4TQAJmh5FECJIuOautyJYM2qFM471ZzI8jDsJhzS0Kyg1tsYDqdg7CCEbcR+jebiv11FylI/2cxz616Oc80qcLKgX2jpKfeMz4n27vHGnuP2cZ+rSOzLBipYW08qrjFWBTYfp7bwx04VxPFsNGORM0kAo+fuq8FQU7rxjHmsw34q+xHJXd9Di5ajF50n3rHqlGuBc6donwxhbafLF7lTWBqP2st+tIpmEBHFi4v5PEoMs9W/8Nh3q/zXIuCUP6Ldh5ykOSMrmpBklpCVraGiSkdYweX/5Dbora0cR9z+nrLGvgviRuZb3GxhtPZ8cjlWIgGxwxa620vK4IRwM3Ddrh8r3P+ToJSMuXredvPAdQP1H8F+LcXG70qdljc0B8M8lQQKwNHsdNOP8qEU4y9nzZS4bfnqCq/URaaBU7buEdG8RtMvqgCmIk391pAo/kvhmS4TtLcSfQ0geRok/irLaKFuZNvk/iBaUj2ULRbvVeGwh0IByYbWZUj1Vdbx0RSBXvhcbFZwxUonFwqUZq+2MqX7LiaMKfOPF9u07ECfJsL29j5MAG5x2arBLftGfvrfFFCCmcpUFGn5w2RWYbKTdvPhTosiHJeu+sA887/E+SR8ZAi48AzLI+vmLwFf4goN0zdJEJw2LtHd54Xn+0j9PNH56yjHRHagE8HOlnUOs3iJSWE3A9FrMisfx6Sfb5rXZffbEFw/qP+xT5aaT5g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(9686003)(6506007)(47076005)(7696005)(26005)(336012)(186003)(40480700001)(52536014)(53546011)(8936002)(5660300002)(33656002)(107886003)(41300700001)(86362001)(478600001)(36860700001)(83380400001)(356005)(81166007)(54906003)(110136005)(82310400005)(2906002)(316002)(40460700003)(82740400003)(55016003)(4326008)(8676002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:26:46.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ab6402-fc02-481b-b80b-08da8c92f6f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6238

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxLCAy
MDIyIDExOjQwIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFy
cXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVw
YW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvOV0geGVuL2FybTogaW50cm9kdWNl
IHN0YXRpYyBzaGFyZWQgbWVtb3J5DQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9uIDI5LzA4LzIw
MjIgMDc6NTcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50
OiBGcmlkYXksIEF1Z3VzdCAyNiwgMjAyMiA5OjE3IFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVuZyA8
UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJl
cnRyYW5kIE1hcnF1aXMNCj4gPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15
ciBCYWJjaHVrDQo+ID4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAxLzldIHhlbi9hcm06IGludHJvZHVjZSBzdGF0aWMgc2hhcmVkIG1l
bW9yeQ0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwNCj4gPj4NCj4gPg0KPiA+IEhpIEp1bGllbg0KPiA+
DQo+ID4+IE9uIDIxLzA3LzIwMjIgMTQ6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gRnJv
bTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4+Pg0KPiA+Pj4gVGhpcyBw
YXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyBmZWF0dXJlOiBzZXR0aW5nIHVwIHN0YXRpYyBz
aGFyZWQNCj4gPj4+IG1lbW9yeSBvbiBhIGRvbTBsZXNzIHN5c3RlbSwgdGhyb3VnaCBkZXZpY2Ug
dHJlZSBjb25maWd1cmF0aW9uLg0KPiA+Pj4NCj4gPj4+IFRoaXMgY29tbWl0IHBhcnNlcyBzaGFy
ZWQgbWVtb3J5IG5vZGUgYXQgYm9vdC10aW1lLCBhbmQgcmVzZXJ2ZSBpdA0KPiA+Pj4gaW4gYm9v
dGluZm8ucmVzZXJ2ZWRfbWVtIHRvIGF2b2lkIG90aGVyIHVzZS4NCj4gPj4+DQo+ID4+PiBUaGlz
IGNvbW1pdHMgcHJvcG9zZXMgYSBuZXcgS2NvbmZpZyBDT05GSUdfU1RBVElDX1NITSB0byB3cmFw
DQo+ID4+PiBzdGF0aWMtc2htLXJlbGF0ZWQgY29kZXMsIGFuZCB0aGlzIG9wdGlvbiBkZXBlbmRz
IG9uIHN0YXRpYyBtZW1vcnkoDQo+ID4+PiBDT05GSUdfU1RBVElDX01FTU9SWSkuIFRoYXQncyBi
ZWNhdXNlIHRoYXQgbGF0ZXIgd2Ugd2FudCB0byByZXVzZSBhDQo+ID4+PiBmZXcgaGVscGVycywg
Z3VhcmRlZCB3aXRoIENPTkZJR19TVEFUSUNfTUVNT1JZLCBsaWtlDQo+ID4+PiBhY3F1aXJlX3N0
YXRpY21lbV9wYWdlcywgZXRjLCBvbiBzdGF0aWMgc2hhcmVkIG1lbW9yeS4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gdjYgY2hhbmdlOg0KPiA+Pj4gLSB3aGVuIGhvc3QgcGh5c2ljYWwgYWRkcmVz
cyBpcyBvbW1pdGVkLCBvdXRwdXQgdGhlIGVycm9yIG1lc3NhZ2UNCj4gPj4+IHNpbmNlIHhlbiBk
b2Vzbid0IHN1cHBvcnQgaXQgYXQgdGhlIG1vbWVudA0KPiA+Pj4gLSBhZGQgdGhlIGZvbGxvd2lu
ZyBjaGVjazogMSkgVGhlIHNobSBJRCBtYXRjaGVzIGFuZCB0aGUgcmVnaW9uDQo+ID4+PiBleGFj
dGx5IG1hdGNoDQo+ID4+PiAyKSBUaGUgc2htIElEIGRvZXNuJ3QgbWF0Y2ggYW5kIHRoZSByZWdp
b24gZG9lc24ndCBvdmVybGFwDQo+ID4+PiAtIGNoYW5nZSBpdCB0byAidW5zaWduZWQgaW50IiB0
byBiZSBhbGlnbmVkIHdpdGggbnJfYmFua3MNCj4gPj4+IC0gY2hlY2sgdGhlIGxlbiBvZiB0aGUg
cHJvcGVydHkgdG8gY29uZmlybSBpcyBpdCBiaWcgZW5vdWdoIHRvDQo+ID4+PiBjb250YWluICJw
YWRkciIsICJzaXplIiwgYW5kICJnYWRkciINCj4gPj4+IC0gc2htX2lkIGRlZmluZWQgYmVmb3Jl
IG5yX3NobV9kb21haW4sIHNvIHdlIGNvdWxkIHJlLXVzZSB0aGUNCj4gPj4+IGV4aXN0aW5nIGhv
bGUgYW5kIGF2b2lkIGluY3JlYXNpbmcgdGhlIHNpemUgb2YgdGhlIHN0cnVjdHVyZS4NCj4gPj4+
IC0gY2hhbmdlICJucl9zaG1fZG9tYWluIiB0byAibnJfc2htX2JvcnJvd2VycyIsIHRvIG5vdCBp
bmNyZW1lbnQgaWYNCj4gPj4+IHRoZSByb2xlIGlzIG93bmVyIGluIHBhcnNpbmcgY29kZQ0KPiA+
Pj4gLSBtYWtlICJ4ZW4sc2htX2lkIiBwcm9wZXJ0eSBhcyBhcmJpdHJhcnkgc3RyaW5nLCB3aXRo
IGEgc3RyaWN0DQo+ID4+PiBsaW1pdCBvbiB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMsIE1BWF9T
SE1fSURfTEVOR1RIDQo+ID4+PiAtLS0NCj4gPj4+IHY1IGNoYW5nZToNCj4gPj4+IC0gbm8gY2hh
bmdlDQo+ID4+PiAtLS0NCj4gPj4+IHY0IGNoYW5nZToNCj4gPj4+IC0gbml0IGZpeCBvbiBkb2MN
Cj4gPj4+IC0tLQ0KPiA+Pj4gdjMgY2hhbmdlOg0KPiA+Pj4gLSBtYWtlIG5yX3NobV9kb21haW4g
dW5zaWduZWQgaW50DQo+ID4+PiAtLS0NCj4gPj4+IHYyIGNoYW5nZToNCj4gPj4+IC0gZG9jdW1l
bnQgcmVmaW5lbWVudA0KPiA+Pj4gLSByZW1vdmUgYml0bWFwIGFuZCB1c2UgdGhlIGl0ZXJhdGlv
biB0byBjaGVjaw0KPiA+Pj4gLSBhZGQgYSBuZXcgZmllbGQgbnJfc2htX2RvbWFpbiB0byBrZWVw
IHRoZSBudW1iZXIgb2Ygc2hhcmVkIGRvbWFpbg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBkb2NzL21p
c2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IHwgMTI0ICsrKysrKysrKysrKysrKysrKysr
DQo+ID4+PiAgICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICA2ICsN
Cj4gPj4+ICAgIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICAgICAgICAgICAgfCAxNTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9zZXR1cC5oICAgICAgfCAgIDkgKysNCj4gPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMjk2IGlu
c2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZp
Y2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4gYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jv
b3RpbmcudHh0DQo+ID4+PiBpbmRleCA5ODI1MzQxNGI4Li44MDEzZmI5OGZlIDEwMDY0NA0KPiA+
Pj4gLS0tIGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4gKysr
IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4gQEAgLTM3OCwz
ICszNzgsMTI3IEBAIGRldmljZS10cmVlOg0KPiA+Pj4NCj4gPj4+ICAgIFRoaXMgd2lsbCByZXNl
cnZlIGEgNTEyTUIgcmVnaW9uIHN0YXJ0aW5nIGF0IHRoZSBob3N0IHBoeXNpY2FsIGFkZHJlc3MN
Cj4gPj4+ICAgIDB4MzAwMDAwMDAgdG8gYmUgZXhjbHVzaXZlbHkgdXNlZCBieSBEb21VMS4NCj4g
Pj4+ICsNCj4gPj4+ICtTdGF0aWMgU2hhcmVkIE1lbW9yeQ0KPiA+Pj4gKz09PT09PT09PT09PT09
PT09PT09DQo+ID4+PiArDQo+ID4+PiArVGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGRldmljZSB0
cmVlIG5vZGVzIGFsbG93IHVzZXJzIHRvDQo+ID4+PiArc3RhdGljYWxseSBzZXQgdXAgc2hhcmVk
IG1lbW9yeSBvbiBkb20wbGVzcyBzeXN0ZW0sIGVuYWJsaW5nDQo+ID4+PiArZG9tYWlucyB0byBk
byBzaG0tYmFzZWQgY29tbXVuaWNhdGlvbi4NCj4gPj4+ICsNCj4gPj4+ICstIGNvbXBhdGlibGUN
Cj4gPj4+ICsNCj4gPj4+ICsgICAgInhlbixkb21haW4tc2hhcmVkLW1lbW9yeS12MSINCj4gPj4+
ICsNCj4gPj4+ICstIHhlbixzaG0taWQNCj4gPj4+ICsNCj4gPj4+ICsgICAgQW4gYXJiaXRyYXJ5
IHN0cmluZyB0aGF0IHJlcHJlc2VudHMgdGhlIHVuaXF1ZSBpZGVudGlmaWVyIG9mIHRoZSBzaGFy
ZWQNCj4gPj4+ICsgICAgbWVtb3J5IHJlZ2lvbiwgd2l0aCBhIHN0cmljdCBsaW1pdCBvbiB0aGUg
bnVtYmVyIG9mDQo+ID4+PiArIGNoYXJhY3RlcnMoXDANCj4gPj4gaW5jbHVkZWQpLA0KPiA+Pj4g
KyAgICBgTUFYX1NITV9JRF9MRU5HVEgoMTYpYC4gZS5nLiAieGVuLHNobS1pZCA9ICJteS1zaGFy
ZWQtbWVtLQ0KPiAxIiIuDQo+ID4+PiArDQo+ID4+PiArLSB4ZW4sc2hhcmVkLW1lbQ0KPiA+Pj4g
Kw0KPiA+Pj4gKyAgICBBbiBhcnJheSB0YWtlcyBhIHBoeXNpY2FsIGFkZHJlc3MsIHdoaWNoIGlz
IHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlDQo+ID4+PiArICAgIHNoYXJlZCBtZW1vcnkgcmVnaW9u
IGluIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSwgYSBzaXplLA0KPiA+Pj4gKyBhbmQgYQ0K
PiA+PiBndWVzdA0KPiA+Pj4gKyAgICBwaHlzaWNhbCBhZGRyZXNzLCBhcyB0aGUgdGFyZ2V0IGFk
ZHJlc3Mgb2YgdGhlIG1hcHBpbmcuDQo+ID4+PiArICAgIGUuZy4geGVuLHNoYXJlZC1tZW0gPSA8
IFtob3N0IHBoeXNpY2FsIGFkZHJlc3NdIFtzaXplXSBbZ3Vlc3QNCj4gPj4+ICsgYWRkcmVzc10g
Pg0KPiA+Pg0KPiA+PiBZb3VyIGltcGxlbWVudGF0aW9uIGJlbG93IGlzIGNoZWNraW5nIGZvciBv
dmVybGFwIGFuZCBhbHNvIGhhdmUgc29tZQ0KPiA+PiByZXN0cmljdGlvbi4gQ2FuIHRoZXkgYmUg
ZG9jdW1lbnRlZCBpbiB0aGUgYmluZGluZz8NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgICAgVGhl
IG51bWJlciBvZiBjZWxscyBmb3IgdGhlIGhvc3QgYWRkcmVzcyAoYW5kIHNpemUpIGlzIHRoZSBz
YW1lIGFzIHRoZQ0KPiA+Pj4gKyAgICBndWVzdCBwc2V1ZG8tcGh5c2ljYWwgYWRkcmVzcyBhbmQg
dGhleSBhcmUgaW5oZXJpdGVkIGZyb20gdGhlDQo+ID4+PiArIHBhcmVudA0KPiA+PiBub2RlLg0K
PiA+Pg0KPiA+PiBJbiB2NSwgd2UgZGlzY3Vzc2VkIHRvIGhhdmUgdGhlIGhvc3QgYWRkcmVzcyBv
cHRpb25hbC4gSG93ZXZlciwgdGhlDQo+ID4+IGJpbmRpbmcgaGFzIG5vdCBiZWVuIHVwZGF0ZWQg
dG8gcmVmbGVjdCB0aGF0LiBOb3RlIHRoYXQgSSBhbSBub3QNCj4gPj4gYXNraW5nIHRvIGltcGxl
bWVudCwgYnV0IGluc3RlYWQgcmVxdWVzdCB0aGF0IHRoZSBiaW5kaW5nIGNhbiBiZSB1c2VkIGZv
cg0KPiBzdWNoIHNldHVwLg0KPiA+Pg0KPiA+DQo+ID4gSG93IGFib3V0Og0KPiA+ICINCj4gPiBI
b3N0IHBoeXNpY2FsIGFkZHJlc3MgY291bGQgYmUgb21pdHRlZCBieSB1c2VycywgYW5kIGxldCBY
ZW4gZGVjaWRlIHdoZXJlDQo+IGl0IGxvY2F0ZXMuDQo+ID4gIg0KPiANCj4gSSBhbSBmaW5lIHdp
dGggdGhhdC4NCj4gDQo+ID4gRG8geW91IHRoaW5rIEkgc2hhbGwgZnVydGhlciBwb2ludCBvdXQg
dGhhdCByaWdodCBub3csIHRoaXMgcGFydA0KPiA+IGZlYXR1cmUgaXMgbm90IGltcGxlbWVudGVk
IGluIGNvZGVzPw0KPiANCj4gSSBoYXZlIG1hZGUgYSBjb3VwbGUgb2Ygc3VnZ2VzdGlvbiBmb3Ig
dGhlIGNvZGUuIEJ1dCBJIHRoaW5rIHRoZSBiaW5kaW5nDQo+IHdvdWxkIGxvb2sgYSBiaXQgb2Rk
IHdpdGhvdXQgdGhlIGhvc3QgcGh5c2ljYWwgYWRkcmVzcy4gV2Ugd291bGQgbm93IGhhdmU6DQo+
IA0KPiA8IFtzaXplXSBbZ3Vlc3QgYWRkcmVzc10+DQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IG1vcmUgbmF0dXJhbCBpZiB3ZSBoYWQNCj4gDQo+IDxbZ3Vlc3QgYWRkcmVzc10gW3NpemVdPg0K
PiANCj4gQW5kDQo+IA0KPiA8W2d1ZXN0IGFkZHJlc3NdIFtzaXplXSBbaG9zdCBwaHlzaWNhbCBh
ZGRyZXNzXT4NCj4gDQoNCk9rLCBhYm91dCB0aGUgYmluZGluZyBvcmRlciBjaGFuZ2UsIGRvIHlv
dSBwcmVmZXIgaXQgaW4gdjcgb3IgNC4xNy1wb3N0LA0Kc2luY2UgaXQgbWF5IGFsc28gbmVlZCBh
IGZldyBjb2RlIHR3ZWFrLg0KDQo+ID4NCj4gPj4+IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3NldHVwLmgNCj4gPj4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0KPiA+Pj4g
aW5kZXggMmJiMDFlY2ZhOC4uMzlkNGU5M2I4YiAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vc2V0dXAuaA0KPiA+Pj4gQEAgLTIzLDEwICsyMywxOSBAQCB0eXBlZGVmIGVudW0gew0K
PiA+Pj4gICAgfSAgYm9vdG1vZHVsZV9raW5kOw0KPiA+Pj4NCj4gPj4+DQo+ID4+PiArI2lmZGVm
IENPTkZJR19TVEFUSUNfU0hNDQo+ID4+PiArLyogSW5kaWNhdGVzIHRoZSBtYXhpbXVtIG51bWJl
ciBvZiBjaGFyYWN0ZXJzKFwwIGluY2x1ZGVkKSBmb3INCj4gPj4+ICtzaG1faWQgKi8gI2RlZmlu
ZSBNQVhfU0hNX0lEX0xFTkdUSCAxNiAjZW5kaWYNCj4gPj4NCj4gPj4gSXMgdGhlICNpZmRlZiBy
ZWFsbHkgbmVlZGVkPw0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gICAgc3RydWN0IG1lbWJhbmsgew0K
PiA+Pj4gICAgICAgIHBhZGRyX3Qgc3RhcnQ7DQo+ID4+PiAgICAgICAgcGFkZHJfdCBzaXplOw0K
PiA+Pj4gICAgICAgIGJvb2wgeGVuX2RvbWFpbjsgLyogd2hldGhlciB0aGUgbWVtb3J5IGJhbmsg
aXMgYm91bmQgdG8gYSBYZW4NCj4gPj4+IGRvbWFpbi4gKi8NCj4gPj4+ICsjaWZkZWYgQ09ORklH
X1NUQVRJQ19TSE0NCj4gPj4+ICsgICAgY2hhciBzaG1faWRbTUFYX1NITV9JRF9MRU5HVEhdOw0K
PiA+Pj4gKyAgICB1bnNpZ25lZCBpbnQgbnJfc2htX2JvcnJvd2VyczsNCj4gPj4+ICsjZW5kaWYN
Cj4gPj4+ICAgIH07DQo+ID4+DQo+ID4+IElmIEkgY2FsY3VsYXRlZCByaWdodCwgdGhlIHN0cnVj
dHVyZSB3aWxsIGdyb3cgZnJvbSAyNCB0byA0MCBieXRlcy4NCj4gPj4gQXQgdGhlIG1vbWVudCwg
dGhpcyBpcyBwcm90ZWN0ZWQgd2l0aCBDT05GSUdfU1RBVElDX1NITSB3aGljaCBpcw0KPiB1bnN1
cHBvcnRlZC4NCj4gPj4gSG93ZXZlciwgSSB0aGluayB3ZSB3aWxsIG5lZWQgdG8gZG8gc29tZXRo
aW5nIGFzIHdlIGNhbid0IGNvbnRpbnVlIHRvDQo+ID4+IGdyb3cgJ21lbWJhbmsnIGxpa2UgdGhh
dC4NCj4gPj4NCj4gPj4gSSBkb24ndCBoYXZlIGEgcXVpY2sgc3VnZ2VzdGlvbiBmb3IgNC4xNyAo
dGhlIGZlYXR1cmUgZnJlZXplIGlzIGluIGENCj4gPj4gd2VlaykuIExvbmcgdGVybSwgSSB0aGlu
ayB3ZSB3aWxsIHdhbnQgdG8gY29uc2lkZXIgdG8gbW92ZSB0aGUgc2htIElEDQo+ID4+IGluIGEg
c2VwYXJhdGUgYXJyYXkgdGhhdCBjb3VsZCBiZSByZWZlcmVuY2VkIGhlcmUuDQo+ID4+DQo+ID4+
IFRoZSBvdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBoYXZlIHRoZSBzaGFyZWQgbWVtb3J5IHJl
Z2lvbnMgaW4gYQ0KPiA+PiBzZXBhcmF0ZSBhcnJheS4gVGhleSB3b3VsZCBoYXZlIHRoZWlyIG93
biBzdHJ1Y3R1cmUgd2hpY2ggd291bGQNCj4gPj4gZWl0aGVyIGVtYmVkZGVkICJtZW1iYW5rIiBv
ciBjb250YWluIGEgcG9pbnRlci9pbmRleCB0byB0aGUgYmFuay4NCj4gPj4NCj4gPg0KPiA+IE9r
LCBzbyBvdGhlciB0aGFuIHRoaXMgZml4aW5nLCBvdGhlcnMgd2lsbCBiZSBhZGRyZXNzZWQgaW4g
dGhlIG5leHQNCj4gPiBzZXJpZS4gQW5kIHRoaXMgcGFydCBmaXhpbmcgd2lsbCBiZSBpbnRyb2R1
Y2VkIGluIGEgbmV3IGZvbGxvdy11cCBwYXRjaCBzZXJpZQ0KPiBhZnRlciA0LjE3IHJlbGVhc2Uu
DQo+ID4NCj4gPiBJJ20gaW4gZmF2b3Igb2YgaW50cm9kdWNpbmcgYSBuZXcgc3RydWN0dXJlIHRv
IGNvbnRhaW4gc2htLXJlbGF0ZWQNCj4gPiBkYXRhIGFuZCBsZXQgJ21lbWJhbmsnIGNvbnRhaW5z
IGEgcG9pbnRlciB0byBpdCwgbGlrZSBgYGANCj4gPiAgICtzdHJ1Y3Qgc2htX21lbWJhbmsgew0K
PiA+ICsgICAgY2hhciBzaG1faWRbTUFYX1NITV9JRF9MRU5HVEhdOw0KPiA+ICsgICAgdW5zaWdu
ZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdHJ1Y3QgbWVt
YmFuayB7DQo+ID4gICAgICAgcGFkZHJfdCBzdGFydDsNCj4gPiAgICAgICBwYWRkcl90IHNpemU7
DQo+ID4gICAgICAgYm9vbCB4ZW5fZG9tYWluOyAvKiB3aGV0aGVyIHRoZSBtZW1vcnkgYmFuayBp
cyBib3VuZCB0byBhIFhlbg0KPiA+IGRvbWFpbi4gKi8NCj4gPiArICAgIHN0cnVjdCBzaG1fbWVt
YmFuayAqc2htOw0KPiA+ICAgfTsNCj4gPiBgYGANCj4gPiBUaGVuIGV2ZXJ5IHRpbWUgd2UgaW50
cm9kdWNlIGEgbmV3IGZlYXR1cmUgaGVyZSwgZm9sbG93aW5nIHRoaXMNCj4gPiBzdHJhdGVneSwg
J21lbWJhbmsnIHdpbGwgYXQgbW9zdCBncm93IDggYnl0ZXMgZm9yIHRoZSByZWZlcmVuY2UuDQo+
IA0KPiBCZSBhd2FyZSB0aGF0IHdlIGFyZSB2ZXJ5IGVhcmx5IGluIFhlbiBhbmQgdGhlcmVmb3Jl
IGR5bmFtaWNhbGx5IGFsbG9jYXRpbmcNCj4gbWVtb3J5IGlzIG5vdCBwb3NzaWJsZS4gVGhlcmVm
b3JlICdzaG1fbWVtYmFuaycgd291bGQgbW9zdCBsaWtlbHkgbmVlZA0KPiB0byBiZSBzdGF0aWMu
DQo+IA0KDQpSaWdodCwgdGhlIGhlYXAgbWF5IG5vdCBiZSBmdWxseSBmdW5jdGlvbmFsLCB1bmRl
cnN0b29kLg0KDQo+IEF0IHdoaWNoIHBvaW50LCB0aGlzIGNvdWxkIGJlIGFuIGluZGV4Lg0KPiAN
Cj4gPg0KPiA+IEknbSBvcGVuIHRvIHRoZSBkaXNjdXNzaW9uIGFuZCB3aWxsIGxldCBpdCBkZWNp
ZGUgd2hhdCBpdCBmaW5hbGx5IHdpbGwNCj4gPiBiZS4gOykNCj4gDQo+IE15IG9yaWdpbmFsIGlk
ZWEgd2FzIHRvIGhhdmUgJ3NobV9tZW1iYW5rJyBwb2ludGluZyB0byB0aGUgJ21lbWJhbmsnDQo+
IHJhdGhlciB0aGFuIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBCdXQgSSBkb24ndCBoYXZlIGEgc3Ry
b25nIGFyZ3VtZW50IGVpdGhlcg0KPiB3YXkuDQo+IA0KPiBTbyBJIHdvdWxkIG5lZWQgdG8gc2Vl
IHRoZSByZXN1bHRpbmcgY29kZS4gQW55d2F5LCB0aGF0J3MgZm9yIHBvc3QtNC4xNy4NCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

