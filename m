Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20451F6EC
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 10:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324282.546257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyys-0004Qa-96; Mon, 09 May 2022 08:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324282.546257; Mon, 09 May 2022 08:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyys-0004Ng-4O; Mon, 09 May 2022 08:43:02 +0000
Received: by outflank-mailman (input) for mailman id 324282;
 Mon, 09 May 2022 08:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCc2=VR=citrix.com=prvs=1217d4990=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nnyyq-0004Br-MB
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 08:43:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067514e2-cf74-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 10:42:58 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 04:42:55 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BN9PR03MB6187.namprd03.prod.outlook.com (2603:10b6:408:100::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 08:42:54 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:42:53 +0000
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
X-Inumbo-ID: 067514e2-cf74-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652085778;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=NsDYcOpl7cB4xnZK0SlA4GMcWWFt11cgRIwWu/b++LA=;
  b=Oawk3+OROb14SFWZc8EGUxV6V1jIqumwkVhzIB2zbvYyz+6Ef+mDkV92
   25SvhipVH7pr0ddUALo0vu5eGLKlL1PeExtlT6M52Vp/wb7t9fxfa/caQ
   C+bBiOlZemEnlq8pAcMgl/RIx+vBx5tNipTRbKPeqw5uhpUw9UyLfoglh
   M=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 70255180
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/mWJz63SVEN63NXk+vbD5XZwkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/3j9kJTu8TTztNrT1NsqS1gF39E8JuaXIqSfkytNH7PdJbNHR8/s
 JgUNdWbfcloESfSqBmnbbTo8Cgnia+BTbb1YAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 PujrpSCM1T5gWN4Pm4YsPiJ8U0/4aX5tW1J7gM3O6kVsg6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqp6iLgtSBOS60TGm0hK6YYD76vR5jnF0g/9T2MY0Mx8N0W3Ux4Apk
 r2hiLTrIesXFvyU8Agie0Ew/xFWZcWqL5eefBBTGeTKp6H3WyOEL8dGVSnaDqVBkgpDOklc9
 ORwFdw4Rkvra9RaYl6MYrIEaswLdKEHNW6E051q5Wmx4f0OGfgvT0hWjDPxMfhZas1mRJ7ji
 8QlhTVHQRrjaR9sY3IuVL1nrMa2lyPgSz0BgQfAzUY3yzC7IA1Z9pHIaYKQVvnUAMJfkwCfu
 37M+Hn/DlcCLtuDxDGZ83WqwOjSgSf8X4FUH7q9nhJoqATLmipPV1tLBR3i+ajRZk2WArqzL
 2Q79y00oqV02FGtStDldxa5vGSFrlgXXN84/+gSt1nXl/eNs17x6m4sax9MZ916sPMKYBMy+
 Fuss5CzDhVmmejAIZ6a3vLOxd+oAgAXMGsDaCksXQYDpd75r+kbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lXjFjCilopzhRws89ALRGGmi62tRZoSoeoip4ljz9utbIcCSSVzpl
 GMfh8GU4eQKDJeMvC+AWuMAGPeu/fntGCLYqU5iGd8m7TvFxpK4VYVZ4TU7KEI3NM8BIGfte
 BWK4VIX44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 c7znRqEZZrCNZla8Q==
IronPort-HdrOrdr: A9a23:KWRGjqtUaoPctlVt0QS54Do47skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,210,1647316800"; 
   d="asc'?scan'208";a="70255180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5zWYniBJg8kPKiQ+APn+X1uE9VlocRJHgCnEqeqGX612obHwJlv6TT5S1LY8HRIcVsrsGOHXO94OT1rqxihzIq79Xp7u0Zsujy5ApL/uuaZZ6zADKrSrrKm7MKl5hMtYMDtWuHJ5Mn/ZY7gGywQ8UwHkcKFCotiHCwLgJg7tLz0DVI4W8j4JsJ6mEQsyoTs8eK7RrLbVjGmjEdge3DZMX52sVt3Mh08atXpqLmULoMdCw+cD0oTV1+B9uCVmqfGe+QONnAafBGP0GtpVE1rLw7U8LJz0vH2UwwscBaNkV+lQUoRRprl3YjfNAcdbSgLG7CQiWGodHSENKinz1br8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnPwht9zsyhzIHBlQqBJ/kjjwTR50im8scQl/KiiHLY=;
 b=KpkwHDkAb3GJtxWrLMXa3KUJK/X+nOQn6AQsmV2zTbsX5nNZ2Q5qAT3Mvy+RcCdqRqI74MD0P0WvV/Q/6q/PgPidS0qiPs8LlHPLIJ0A13Xa7yZZR++4ZYMgDsInjvI7KsoTEfhQaOsR0TJqBCn6oX1OogD45FhVzmvec1JieVuRqWFs3bwk0PfwzD5Eef0V+J6XfQMWkpewRjiJ3ba+xe+ppI2RZnYl2E0jABq9hvN68W05vyw+4vArwU3QqAN2ULNZdGkLtpAinNWppFC4FEua5ndbClTpcEdt/jx/67/xNPu/JgD5E2vMZigqdRwkz7B9bOYKPK8orCaM7j3hlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnPwht9zsyhzIHBlQqBJ/kjjwTR50im8scQl/KiiHLY=;
 b=Pqw2yYWqbUzCEA9DVz5AtbcBCAJFyJM+HEX41p7G2QSerNNwUpwGMtvZ3V4MXwswvm2XJEbf7kIVmoewNREZXUYB1itMDrh0WHao/SYNhssbC1pxDB0zFSWPzqM+4SyFjltas0+GTWYO6fucVVIySyrJorpaSXB+E/tCtnypJHc=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] docs: Fix SUPPORT matrix generation after a5968a553f6a
Thread-Topic: [PATCH] docs: Fix SUPPORT matrix generation after a5968a553f6a
Thread-Index: AQHYY3vOnJXgy22N0UmeoXtzBuT6lq0WOoyA
Date: Mon, 9 May 2022 08:42:53 +0000
Message-ID: <A57E9481-97D6-451D-BB5F-DA36B36F9320@citrix.com>
References: <20220509080707.50926-1-julien@xen.org>
In-Reply-To: <20220509080707.50926-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 329e2d44-b23e-4ba9-42c6-08da3197e8a4
x-ms-traffictypediagnostic: BN9PR03MB6187:EE_
x-microsoft-antispam-prvs:
 <BN9PR03MB6187837D62AAEC3BF0E0A63599C69@BN9PR03MB6187.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lye3d0afSoszHs1Vi9xTdx8ngQjinARGdiSQjsHBbai0RveYsVV38h6wA0ZEL/fXgMWaH7BGxWyH0xaS+1b4hHDvBFFIglYswMR4+PoBduSi9QDxn0tHAcIPPcU9mrtC6GIM2ed+5sgvaF9bXnOslMiTxm259vK82gr1DR6rXJChhWmKNmak806tdzLfC5BNYSNu+Rv/BH6Gs/sKzSTDc1/Yw2zTfWZrvYSXr8LyEJQSp8bERfYc8DoklmLrSnllWu2NfinTNRE4iyUTyMLeBd+mxpN+BihrVN9UvalEUD9jOPtXk6ZZpiGPkGYAPsx6TUBaA9F0HdQps2mVVEvNo1anTb3g2BAPo3LrSjd5QE+nIRDfZ3/j0dDOKHZDc32j+qNHvR8NGhCl6NpZka/OB5Y2+CnEPQtK/4gzfrouaITElHp8tUkED1YicePrvI9VF5H54LmQ7TU5Nh6/8Sd10TngYP1FaSfkIm/2hhFwZc74UxtuH41EWMfvpmH1PZ//nFbhKYDTDzetpCuDrE2WGTcVHlkVp027xZsSVRXI2mLoXUoCCGg2ZALCoR4UYHk3cmOQRmuPKt6M7bHvaUODRVSfdMTLMg2aTqwmKDZcIRPTu7LBh+ppb6q3YFAeH1yQCMHY8ngXtEtA0RCAnL8bJrXcl48T+x95XvyBH8attUEiVoGSbsfnVNf7hYujOBRu94RT0526F9vv8QI8j3xTHJUUqdqumF7HxALqBArnCyS+Q+oN27jrThYiAqk6LFeacWAZPqiMFE94zETG74vxzloIr8/lT+NSzbqtpPZnxQc/EMcJ3pmnNXwsk1WbmNaFztXlXh8LviFRwc7/kjN5yRXxPfieIlbtyJrx/Dmk5697Jk7onFSsQvY1xDO/q/RK7CL2aOeeLZbfVXAes48t9Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(966005)(6506007)(86362001)(8936002)(6486002)(33656002)(53546011)(5660300002)(71200400001)(508600001)(83380400001)(99936003)(38100700002)(26005)(82960400001)(2616005)(6512007)(38070700005)(122000001)(186003)(54906003)(66946007)(66556008)(316002)(66476007)(91956017)(76116006)(66446008)(64756008)(6916009)(4326008)(8676002)(36756003)(98903001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Zw0lX5SpobM8HYyoVUJKlDjFHY5tXVtHGLpktDQn3QXvjq1PR332OyJvijZ4?=
 =?us-ascii?Q?AvRIhqEbNNjRhMrGm4NM1cxkH3+pFIF9WOtvt9NvEKTbhdXGAJaoa4IFfcQ1?=
 =?us-ascii?Q?+em38DoX+2noUMkbXDt8NDjjtSnRLw1AIE5uUhq6XiPyafba1nrqDvo6+Qey?=
 =?us-ascii?Q?GLCvWdBtXTwcbQOf2zfHuM+d+p7IYuSkgQTJEEoN1MgiupGLqztJm4SW1+Kk?=
 =?us-ascii?Q?zypu0T8Neir3W8iAa3MuCf/KdnAVDJeQ0qWpMA4bP2WmHvGGqNETnwnbKufC?=
 =?us-ascii?Q?miJx+J8q0Xvyywpd4iL6mkUy7zdUfMA3mETh6mqP1pgAXi5pI31AuVl32zHz?=
 =?us-ascii?Q?MAwAF7/Yt+mIKegJiuTligZ4XUjDzCDl9hxdlCsoQdW7WhkoV60d+r8mHmk9?=
 =?us-ascii?Q?bLhz3hG1BxgYOrk84Ggx3/RThoNcbckB69/MzFnFlYv0U5vwXNDlb+pSsevw?=
 =?us-ascii?Q?Eizyc9dDObetQpnzvBnpk0LhLlodmh1x6cwsQr1Gbd8C4fhe+0lDM2Kb80Eb?=
 =?us-ascii?Q?0m9J7dS/oGXxI66Rj5R4hSXsNk7xz343o+zZTUOhZRDHHxCzItBer46zK/XW?=
 =?us-ascii?Q?ovWAZfVgh6W2yv2ws6atT+80Bu2Uhg/C+gnuTvcAJW9RqMFyUugsgca6+djW?=
 =?us-ascii?Q?q3Glg7JlZWrEcFNF726oJaOrOl3k1SP/p69ZfNUAprQi344n1x+mZph7SrlO?=
 =?us-ascii?Q?iLD1AwfsZOepNNOYs/x+3Y8/Yd8Gczxlo4EgSw6NculYcKKWiTIcmSsj9R3U?=
 =?us-ascii?Q?VeG5bJQcZJ64oNuKbVcgWDTFPp2nrKWOjpqD0LpkF7d8k19HavHMSyNQYZYa?=
 =?us-ascii?Q?DggQxAVFdEKmFsDAnRrbBKCQAc0RvFoGUj7sHH6QNs71q21aAt3yUiUuDnS/?=
 =?us-ascii?Q?2DqJn7ENP+CLKSTzDLzjYrN95Ea35lhjGENqrg0kgeR1EmJSWzKs3CQ2CFWI?=
 =?us-ascii?Q?nrkwgGo6fVLCxHWaCdbKaD0Zt512kOkljsHuZrZAoD/EubY3a+oedu8Sk8I5?=
 =?us-ascii?Q?edR8E5ncaZ3BdUJapWBGH1XqlRHcoI4PTOq4JZIIjPLNqxnH3a5GVWKiGVSX?=
 =?us-ascii?Q?P0MbwR9n9DH3dSoKmqBucmL5Qi9U18uudMn1vyPnkZXCCm9vp8eGPghHG93t?=
 =?us-ascii?Q?um4FVv6FUDI/uH8JAJJD2geqfgYLk16rZ+aLSDGfhOqykpbCy5hu4enz7Eac?=
 =?us-ascii?Q?7osjnZJjY329L4HrI5r8/AFyoXcpZfBpfxHsCzIVKZ1yg6kFMCN0EeX9Pygj?=
 =?us-ascii?Q?Cga7vcyhCmbkG+b1MrjpWqRknvxnnj9nG5NaBitXTzCJE8EQIZ8g7XqsPZrs?=
 =?us-ascii?Q?Rh1WP+LqNws9Hnc45mU9xZOPOq6YGyhsj/zrApOHPOXN3/qTaSGjoK5G5ARP?=
 =?us-ascii?Q?mUC32EyWjMrjulK77g6kzzlYhGmSDIMuiTbc3olPeUIdEIerDNX8SaVaPa/q?=
 =?us-ascii?Q?2oCKgyoDsaU1Bwcg25hlPNtj127EoX2p7S5y7BeOspeE+2veV6tjCSeHZT0P?=
 =?us-ascii?Q?K6LjusodsaF3QBrJXxS4ZPs5ZY2RXp1NnEzSzN3x6UAZxFZuq/ckLSHe1tFn?=
 =?us-ascii?Q?YuBx/9Kq4zlkmflPbuMl0NBUwXwgsU7vkjvhcQ5swpSZMb3o2ObgRQQyEcJ0?=
 =?us-ascii?Q?qtRvTuFlYRBVyvu0IDKnzstLYz4mdyTmExo79LuuFn/S5IWcYETOK1qCXSn0?=
 =?us-ascii?Q?c2F+gM8Fv2mIlaoA7MaFQAH9zW4xklYnEMUp29q7ynXz2Se/5mqgSM8x+rv/?=
 =?us-ascii?Q?W8wZveKJLTFl0BBoC4LM1iVzySysstA=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4316FA7F-0966-4832-906A-544C64B3E387";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329e2d44-b23e-4ba9-42c6-08da3197e8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:42:53.8936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqsV5BP0FU3VjpTpCKVQiC/EqKu/7nwbWUzhElAJ6EkUzoaxuAIBZWnXakaXaLiCGcawz3s4Y5Ika1RQZVtlRW9dqjZFdyWl/8Il81jlziQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6187

--Apple-Mail=_4316FA7F-0966-4832-906A-544C64B3E387
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On May 9, 2022, at 9:07 AM, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory
> supported for Arm" added a support statement split over two lines.
>=20
> Unfortunately, docs/support-matrix-generate throw an error for it:
>=20
>    Generating support matrix (origin/stable-NN )
>    + docs/support-matrix-generate HEAD =
https://xenbits.xen.org/docs/unstable/SUPPORT.html origin/stable-NN =
https://xenbits.xen.org/docs/NN-testing/SUPPORT.html
>    Status, x86: Supported up to 8 TiB. Hosts with more memory are
>                 supported, but not security supported.
>    Status, Arm32: Supported up to 12 GiB
>    Status, Arm64: Supported up to 2 TiB
>    ^ cannot parse status codeblock line:
>                 supported, but not security supported.
>     ? at docs/parse-support-md line 172, <F> chunk 1.
>=20
> It would be good to allow split support statement (to keep lines below
> 80 characters) but my knowledge of the script is very limited.
>=20
> Therefore, workaround the error by describing the support statement
> in one long line.
>=20
> Fixes: a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory =
supported for Arm"
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_4316FA7F-0966-4832-906A-544C64B3E387
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJ41AcACgkQshXHp8eE
G+2Adgf/TVuk7sM2ac1pDZFoAbJaLQEqMG+L1LNMupeso2hYBLiZnLmahclA4U12
HsHkCJYDwTgwzrIVQeeVaEEqTLz8DlfIRkRndgRSpuv2BSgqWTRPhku8sFjDe/MT
JzHkDd8UMmkGSnfDI1PRVgNJ/OcEEpoSU8dpgkZ6zWa4oy1OpnsSuNv3D8PSVyzL
m9LDJQsnvYPsevNm+gl29+z+4bhgPQsm+/kh3qwdDO0/1qC/vU8wjqbC7LQOSK7W
UFzZQ69LWlzNulVqy1FuOomy232/vTOxcJNlDsqhxlbxhHcjJ0lIF3JmgAzleyz/
ROTwU8qwHHfSPGmwvG/sPiwaSoD1SA==
=L5d+
-----END PGP SIGNATURE-----

--Apple-Mail=_4316FA7F-0966-4832-906A-544C64B3E387--

