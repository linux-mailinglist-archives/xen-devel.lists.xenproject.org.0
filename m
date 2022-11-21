Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC46327A8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446712.702459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8XX-0006h6-IB; Mon, 21 Nov 2022 15:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446712.702459; Mon, 21 Nov 2022 15:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8XX-0006ez-Ey; Mon, 21 Nov 2022 15:16:55 +0000
Received: by outflank-mailman (input) for mailman id 446712;
 Mon, 21 Nov 2022 15:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQtr=3V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ox8XW-0006er-AS
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:16:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86cb7e30-69af-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 16:16:52 +0100 (CET)
Received: from ZR0P278CA0098.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::13)
 by PAWPR08MB10306.eurprd08.prod.outlook.com (2603:10a6:102:366::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 15:16:50 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:23:cafe::e6) by ZR0P278CA0098.outlook.office365.com
 (2603:10a6:910:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Mon, 21 Nov 2022 15:16:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 15:16:50 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Mon, 21 Nov 2022 15:16:49 +0000
Received: from c912d1320bac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D323E04-DF9B-4671-9F29-C21D68618871.1; 
 Mon, 21 Nov 2022 15:16:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c912d1320bac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Nov 2022 15:16:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9723.eurprd08.prod.outlook.com (2603:10a6:102:31e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 15:16:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Mon, 21 Nov 2022
 15:16:36 +0000
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
X-Inumbo-ID: 86cb7e30-69af-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdJfzeZ/1HN40XUuQZpgYB2EBpNQUccpK56mfhXaWlI=;
 b=5rTzdzwyeDPvixeu+9Xws3YW47E5U1zWbiRAcMk6MHcxAenCgnAMaj1xRTkwhfkexEEiXYi0gmaJXp21H9C3CsSGzMq7+56ymeIWiLlILhq2EC871+Mk9rJp8mlXT6IoBp9A+jg5hiMC4Ji3GficpR+we+m9I1TLcrFoa1/uOws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyKttmCfBVG7XyYKdHxKfG94+/4Pd2nFrDNtqUi2vPy3WNsqUnneWl83FTd+LVtr27YWt2djWkp3zpl7KyJbQoCSw6268poZnfCcr9ayzoQ2OVS+q9pNdYM1qrA4mFeSncZPp84XFVONsR46Ws826bEbiOC38R47VdLMiB+l2WjCUvLOdvzLrmiRFeT/++eq+8BivhQ2nGJ7EI2+lpwO9ogvGq8wLEt7OwtJe3vrHu4ZkCZDDRtJnjuvgJsIK/sR9B5VDi6a8Fqer1odD0Lr4QLNIvk+/C6Io1fy/b9PIJ7jkrx8RL/NOarTgPW9WzKWDim/dex1jUeeT+36Jr9G4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdJfzeZ/1HN40XUuQZpgYB2EBpNQUccpK56mfhXaWlI=;
 b=PZ4zlYoWQtHUkoiK+CUE0I1DjI3SNNql3Ng161jU2jYePTVXzUS0I0AtnAgxWoXi8WALjEfEQiUkjw9eXPhY2a2VRxNS4jXFY/INqQNqIN6QHXeLJPedEnX0TAlAtL6322KZHA+qMJ/hOAu+fP0I+gRSnEJ0ce17/H3TpWJlGCIvkoGS1Q4ay8VSiLcztANX0DTTiUvnAAIJOz99KDZ7ywmpEcnOz1bGFkxiUHIF/8wu54NGGOZD8XPFTed6VWQ5CDBoV6pI/duvpJymvuDZYIUPXG51AcPX0LPRBFUbZf85pERJfXeeivSkWcY5k/lDLwF+v2cNqkL4aB6ST9qiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdJfzeZ/1HN40XUuQZpgYB2EBpNQUccpK56mfhXaWlI=;
 b=5rTzdzwyeDPvixeu+9Xws3YW47E5U1zWbiRAcMk6MHcxAenCgnAMaj1xRTkwhfkexEEiXYi0gmaJXp21H9C3CsSGzMq7+56ymeIWiLlILhq2EC871+Mk9rJp8mlXT6IoBp9A+jg5hiMC4Ji3GficpR+we+m9I1TLcrFoa1/uOws=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/2] tools/libxl: Fixes to
 libxl__domain_set_paging_mempool_size()
Thread-Topic: [PATCH 1/2] tools/libxl: Fixes to
 libxl__domain_set_paging_mempool_size()
Thread-Index: AQHY/bbT1Aw53rbod0uWYqQTx0in/a5JdG2AgAAIiEA=
Date: Mon, 21 Nov 2022 15:16:36 +0000
Message-ID:
 <AS8PR08MB79914380261A37B7EF8F0955920A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-2-andrew.cooper3@citrix.com>
 <Y3uPFV6wszfgD4Id@perard.uk.xensource.com>
In-Reply-To: <Y3uPFV6wszfgD4Id@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AE5034E85BD89F4EACBA53E878189D3A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9723:EE_|VI1EUR03FT055:EE_|PAWPR08MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c832208-7e16-4941-36ad-08dacbd36a01
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MQQuZPWlCerfR7XDdKu6pQH+nTUlgLH07ckaqBbRvuNfMSFLViipVcQnjwjY0CvAzPOHvRTIhQuW8QLuczxVcVZiVvTN0mvh1+6F9JNlpYTqJ2H7VFsaDS9+W0XBK1OntSMXD6rb2oLaowttBmeG4+Ui7CrTtjyqXkkz9+aRpX+G9VIlb1SkWipBOwZ4dN2WImcdyf4niSWc9HOY08Qx3DpvjZkC828/r6Vz+aCTk3TgRwwhd59zNpF9nqxhJ46SnS/x3fMUUjN/AJ/1giTZtjoFYntS4GLRUb3Jwb2IjVeCJMXTSuvAQGaixIMWlXYu3sd5PYSgy5+fZIsbDwkPda9jFivWWAjpWC9Bmws49sun1FZ9Pv4I9GD5o9ciZxXLmJoXbPKOJX/HwKHdvUqVAKNi9sqB8DNC1ADNudkhG31iEvBURkRuAoISR7ZkuoaAS7ktWWhTnUQ4pT0VvtalzeV+1lTid3NZXhgM/sGS90CcWuwGzqwkcgkMZfVm087x2w14Qat3mcOI6kD+zUtwQwLrUtIZI6poNAsPw9+YieMs+BCLTprjV+7i2LXCwVAaIcHRHRj9HRjZ02IOHKKSMcyiqylRDyEFJIPJOeZZC4Q+8xuinE5CIi7PEdcV/ULJihhnUIRdloSjWF+Sh6mmKWq722Ms7cgqqLqBxYbmfnqBx8vnasvCD/TCXwNg5eJQiHTJlbhodlIXGgqTkzRNHttMIRmmFdJOoH/OuqDPmlQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(52536014)(41300700001)(8936002)(64756008)(76116006)(5660300002)(4326008)(66476007)(8676002)(66556008)(316002)(66946007)(66446008)(83380400001)(55016003)(478600001)(38070700005)(110136005)(6506007)(26005)(71200400001)(2906002)(86362001)(33656002)(7696005)(9686003)(4744005)(186003)(38100700002)(122000001)(101420200003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d06c44b-7954-4509-60c1-08dacbd361af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r/FPcjc/5jheRsF1Y/VDLsj2D60hPdm+ioyuiBArcHq7cB+F6QFBZW0iENosA4UQDofGS27LkHOBqPMXfJSVJoo3u5b6IomWE480C1FQxM2xBzF7GV20QFbZjBtNqoMwqEUth9M2VRxXyAxGqrXHu8DDxDKz3OmGtmIijyL6OA33iw8hopmiAFq55qUk6P39rMmxwCOKR66845Nmqgx5znJ96g5vjuEeRDEJ2iRrQkcyJNTIrZ0MNuKdo+yGkLkYWSuDj/u1cldlL/N5NMz8xpC8RDRrq6m05LGLSIwHAV7TiA9XfMJ6mAOR4sqpHUYCGwG8AmzeXubgy63FmtzGk7hc6qfw7rFO7vxeGPYRrmGIYmV7iqF20btkpxNCnTR4vGaw4Wq2hPBZDDVcF7wKpry0UpcW+Dx3F7Zl0LUjaOqX4btrhdIYrYYjlFixo4nsp/ItN6RACsL7phHGOLEJN8kLNCgDk3F1k3LdZZcFNQSgvrdyqa+wseifplHs6ltN3RdHYJYcp4KxklT7EJyrXNoAnzz2M9Ny3dkL1zxlA79xnDxWp5aqCygpuwmzJ68VrWGgd//pFgwCsO6K3pPvh06Lhl6SAL/PdPbo0CRccuowMxseFnQEjilkSc4cEZM0Do0FgdZAPCwZAlyaroN4XTLG8qxObTqO4lfHGwoTJ/P5q2svb2Q2vKBxLKcqcZPiQ3qyoRD+7ZxXiMgSkdG+Isej5pUtQATJ4POZ6Yo3Es9fYV1FO5kAPArpY7aax3kt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6506007)(47076005)(7696005)(9686003)(26005)(186003)(110136005)(2906002)(478600001)(336012)(40460700003)(33656002)(40480700001)(55016003)(86362001)(82740400003)(81166007)(356005)(83380400001)(82310400005)(36860700001)(8936002)(4744005)(41300700001)(70206006)(52536014)(8676002)(70586007)(4326008)(5660300002)(316002)(101420200003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 15:16:50.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c832208-7e16-4941-36ad-08dacbd36a01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10306

Hi Andrew,

> -----Original Message-----
> Subject: Re: [PATCH 1/2] tools/libxl: Fixes to
> libxl__domain_set_paging_mempool_size()
>=20
> On Mon, Nov 21, 2022 at 02:37:30PM +0000, Andrew Cooper wrote:
> > The error message accidentally printed the bytes value as if it were kB=
.
> >
> > Furthermore, both b_info.shadow_memkb and shadow_mem are uint64_t,
> meaning
> > there is a risk of overflow if the user specified a stupidly large valu=
e in
> > the vm.cfg file.  Check and reject such a condition.
> >
> > Fixes: 7c3bbd940dd8 ("xen/arm, libxl: Revert XEN_DOMCTL_shadow_op;
> use p2m mempool hypercalls")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> >
> > v2:
> >  * Retain PRIu64
> >  * Check for overflow
> >
> > For 4.17.  This is a low risk change, removes one overflow case, and ma=
kes
> an
> > error message accurate.
>=20
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

