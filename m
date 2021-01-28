Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3A307188
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 09:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76800.138705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52lF-0008Hv-59; Thu, 28 Jan 2021 08:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76800.138705; Thu, 28 Jan 2021 08:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52lF-0008HV-1d; Thu, 28 Jan 2021 08:34:41 +0000
Received: by outflank-mailman (input) for mailman id 76800;
 Thu, 28 Jan 2021 08:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l52lE-0008HP-3N
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 08:34:40 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43c6083e-0f90-4c89-9f13-e7d3d381e838;
 Thu, 28 Jan 2021 08:34:37 +0000 (UTC)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 16:34:32 +0800
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM5PR04MB1114.namprd04.prod.outlook.com (2603:10b6:3:9f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Thu, 28 Jan 2021 08:34:29 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::9a1:f2ba:2679:8188]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::9a1:f2ba:2679:8188%7]) with mapi id 15.20.3784.017; Thu, 28 Jan 2021
 08:34:28 +0000
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
X-Inumbo-ID: 43c6083e-0f90-4c89-9f13-e7d3d381e838
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611822877; x=1643358877;
  h=from:to:cc:subject:date:message-id:references:
   mime-version;
  bh=EIoojLv+ntCZJjOGXIHHi5MvCvxiH+mSoftep2wA4IM=;
  b=LT7I9xpP6Nkj+R6AwN9ZrBdiQnCSFNvJDhI2V7Ruk2KA8Be/Ocy4y1Y8
   8yHlOdHblV4xtteXhZd3uJhR26oK/J658oaE/IrIEpEwGqqCs5p9tjQ0j
   fTsBidzBjZG6zx9eeOoMZbHPy9+J9MkGTdSv3DSNqDTeNb3YsXCAGWd4d
   qtohoZwTrp2Lq3R8+DvsZgwfcQTH+7k1xjVI7etgPzSVCz351AvD3MKrs
   79hCEfceM+0W/2Do/QSgF4lQN2xmG2DUIjcjx8QDecgzn4qpUwpjzcOTf
   uI6xvOdmkpP8T4/fvRI2Kl7n4shpl7a+OIQEF+Qws1XQDEqWCZ9tiwKX2
   w==;
IronPort-SDR: QuIdPdzLWuhuVH3zjdD3FSgUzpNWdsPRMeYPxHo/0XlU4gVdQh2z/JddOGT9zQzwJLAD3iEAw2
 XibjOAFwAmoyB+Xzg6Na+1VuTsd1VJYRN6tTumqolKHZ0kQ3maRvNlomfA4o+BH7wbVVPYgnef
 /7RTlzymEiHhNfp8L2thUSxmBr3rzg7BfJnLPhYBxqUqF1PTFSHFODMyUc2VJA+ywkm3jXO/F+
 qe+y7iCxi9ett70HempLYAo0heBe3/D90+erIC6XtBPzNpmXzFaZJUHMHM4enMLUtK8tpzwwZ4
 LkY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208,217";a="158525790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCo5/SJvFmZclaIxrbairwYR7Fx5xNedUqZGRii6zx22h2oLIJmi3QvcZffTIOgqrtQynH/dr9SdNeW+tc9ty+Agd1KJ9SWx1zEvhXN0NY2JEPTEXyOaUi0EIIdHyaqZyYivEBiv1oauQcKjCajzkIpJnQtW60KKkiBmuTjn2NnFpJBMY7ukdT1AbdV9bz65OwW51BHjMm8WgQUuJ32RQa35TbflWanKBnYqt5FvmjALQTmEADnUHbtzx79nsv3rHg7BkOmmiBcrFasxQiVF9BKIADia5pCMKnLxwRM9Y/aXacA8XFOLwFMv7MYJ1a4MD/0nheNJaxC4FdlduhuWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mgDQNQRRXtFVwM4GmqX8oF5/l8qUac6jUbD4sbQilg=;
 b=d0FZfreeg0FkB5ZHh9gtWoN4Dx3wAsEXactKWZJjMYUCweJNOjgZuR5ITjunYKdfNVmW48LpWw8IXr8AFNWkKbf//o9JPZT3PeIJys6cC/tSOrgGdpgXY7Po2oPAykPq7RGutU+RfMlLQKpW6JLecwS2SONCHRV2pJbQNXCJhMlhtw2oNBSvRnKBBOO3fkp3HNwFB/UdeQObf7IHsTJjHplRHZkuW7JyPT7ZY+C6iDTTLCBdbb8Ng+atW2z9zjYcn9xnVbIs2Tn/K9z80JDbGG9BUJtXfWIWi6j/7UI42VAwSO5YZ6XwDyRLoxwMtqUTmUS4tmc3IBzRVsvKeSy4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mgDQNQRRXtFVwM4GmqX8oF5/l8qUac6jUbD4sbQilg=;
 b=xnQ/nBcAFDGEt+UwO2EpTdtUqqCI+BD9kH44D1nmyXvjH7B08U/hA1ijsQl/lRRnOq8KMLcEeW1Fc0LZi31aVsrREkRSkQ2Vam57f6aqYuKKNvEwON9ivsL2As3ENL+yDBMdrrDJ/fPBE274uaf8pSDmvdY6wMh6WnlrFuz74TM=
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
	"jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, "linux-nilfs@vger.kernel.org"
	<linux-nilfs@vger.kernel.org>, "ocfs2-devel@oss.oracle.com"
	<ocfs2-devel@oss.oracle.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: "axboe@kernel.dk" <axboe@kernel.dk>, "philipp.reisner@linbit.com"
	<philipp.reisner@linbit.com>, "lars.ellenberg@linbit.com"
	<lars.ellenberg@linbit.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"minchan@kernel.org" <minchan@kernel.org>, "ngupta@vflare.org"
	<ngupta@vflare.org>, "sergey.senozhatsky.work@gmail.com"
	<sergey.senozhatsky.work@gmail.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "tytso@mit.edu" <tytso@mit.edu>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>, "ebiggers@kernel.org"
	<ebiggers@kernel.org>, "djwong@kernel.org" <djwong@kernel.org>,
	"shaggy@kernel.org" <shaggy@kernel.org>, "konishi.ryusuke@gmail.com"
	<konishi.ryusuke@gmail.com>, "mark@fasheh.com" <mark@fasheh.com>,
	"jlbec@evilplan.org" <jlbec@evilplan.org>, "joseph.qi@linux.alibaba.com"
	<joseph.qi@linux.alibaba.com>, Naohiro Aota <Naohiro.Aota@wdc.com>,
	"jth@kernel.org" <jth@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
	"len.brown@intel.com" <len.brown@intel.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hare@suse.de"
	<hare@suse.de>, "gustavoars@kernel.org" <gustavoars@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>, "alex.shi@linux.alibaba.com"
	<alex.shi@linux.alibaba.com>, "asml.silence@gmail.com"
	<asml.silence@gmail.com>, "ming.lei@redhat.com" <ming.lei@redhat.com>,
	"tj@kernel.org" <tj@kernel.org>, "osandov@fb.com" <osandov@fb.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "jefflexu@linux.alibaba.com"
	<jefflexu@linux.alibaba.com>
Subject: Re: [RFC PATCH 02/34] block: introduce and use bio_new
Thread-Topic: [RFC PATCH 02/34] block: introduce and use bio_new
Thread-Index: AQHW9UTnc64/mAmIvESrRLPcPpiQkQ==
Date: Thu, 28 Jan 2021 08:34:28 +0000
Message-ID:
 <DM6PR04MB497297B2D0CB8DF8894EB65386BA9@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-3-chaitanya.kulkarni@wdc.com>
 <BL0PR04MB6514C554B4AC96866BC1B16FE7BA9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <BL0PR04MB6514DBA7EDB8EC87A1C20871E7BA9@BL0PR04MB6514.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:8802:270c:4b00:19c6:a569:8749:44eb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 978d65e2-3d4e-4c21-5cef-08d8c3678717
x-ms-traffictypediagnostic: DM5PR04MB1114:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <DM5PR04MB111464693CD23FB80E8B2D0A86BA9@DM5PR04MB1114.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YtVNe3W2+2aLfLtfSA9OA8bKUS5EuzRymacqrPW/HhxrlcagogsgxPJ4goHocMHcrquFy4WsNzAC2zIwBruP7m7IthnSUmI5j3ISeaVxrWXx2BpOL73T4TMVJwjiKmju8hK7SQF+6OBKeWerelHJue84qxCD6Evq8BaVTHK2Pfn/zfawC6Qh5cnudJHua7/EdJc19wtAiBub96zdzBOP7SeckBw9Jl7fVZ+mg8flDzG4r0b04OYAsc+EgKacZG79AoYvz2T16vnB0SuzaVCN1fNoMTyCpgYbZfcb+25HhL6G9ZYVTGUzGOajGvpXL9dQa+tl5271dRn1SX2i591F783+g43zsz305DdvUPuXBOeLw7XLQKVwQqynq4uMJA4aPlVezpZUpys/AzSvT8//eLVyMBabHolU07RKciw3m7k75mUvrqE0xH7qxJF5SKiCIp1iwFsy7HF7y8DDM9zV6Rx1kWZz5AnEF2pBy5Ys/mDNV+4IrwglV3wakeM2PvEQk5LTMQgSo3XZAKL3QLtaSubQYBccSwho6T1wUjcwH/zzNTMI+9ViNSj4Hb17niq6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB4972.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(66446008)(64756008)(66556008)(66476007)(4744005)(6506007)(7696005)(66946007)(86362001)(53546011)(91956017)(71200400001)(52536014)(316002)(186003)(110136005)(54906003)(478600001)(5660300002)(76116006)(4326008)(7406005)(7366002)(8676002)(9686003)(33656002)(55016002)(8936002)(921005)(7416002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?nSjkiLq41zm0esQ8DDVUjPRPdmiq+ZbmIlsnbqCwt1NtPaq0Vnw9tw0jJg2z?=
 =?us-ascii?Q?sDiU1HrP5BNUewiGy7sSTKtzaRWQZmzLbmjIYOgi7G+hupKaF8E24yQG8xn1?=
 =?us-ascii?Q?DFjccCYAV99t3fBvOrTsjES76919/Xf8YtTEL+6a9ZOC5QDvcE9Gvxd/xCaB?=
 =?us-ascii?Q?449uYM+bvQf8Vc6BRr4MHFXnuCXpnus2QkiddynyW859h+oOKwzcRj6Tt3qI?=
 =?us-ascii?Q?Zg2LJcr09KqEm0m4wWFf38Qa7m+JEeOjzaPq4TwXRwE99Ei/lHt/a4fCnhqH?=
 =?us-ascii?Q?8UgH9ri9g7pOHQTt6LLLZGVJlJq/xcFZxrBjTlxF4jsA3nk1N5BjpA6qrKFL?=
 =?us-ascii?Q?UH1o+UnIXgEKjLmHZEeQpqoBtq9ECmvnZJVxZ+/SZzS5bTVuEzIlGDm09zJk?=
 =?us-ascii?Q?VEtFy/O2l3quwBuf77r7M9pXg6w9sOJlR2DPC/aNvaMIIXM6t2d/Jxi+9aSW?=
 =?us-ascii?Q?i0uXTLcUWasH1YKRz8lzyvN9Mn2H6NUZk9eTsYWF5M0MKXo1141VOsq9rRrZ?=
 =?us-ascii?Q?IiUQrevuIeKABqnVn5dchwrO9SIt3xOqUQro5zAhfUuJ4m4OUIDq/WOaSmL2?=
 =?us-ascii?Q?nP1F0s+wGYZEy4w1yWNxUfHPJBsvTX9ViL1pjc/acoijwp6xxZjfmMgfOzWN?=
 =?us-ascii?Q?GHNVTjeRb+RX9uwUaXx9i177L7BI/SO3I5VJDR/DrWjfmR+l3mhfiODJ4pQC?=
 =?us-ascii?Q?XlB6yc/qxrmEn0bX522NFPhx+N4DzELTAfjANe3PDLm/n+aWbn32UKJLBXLt?=
 =?us-ascii?Q?EL4q5dCcVULTCrY4hs68lfH5fcB/UGMGRF/bDzUtmuKV66HUPNAJjKYwpvXf?=
 =?us-ascii?Q?zpIaVz5LqP27oMNzNIggx4lbjBN0r1179K+qQgHRclk/Ttt/qp30A00PRAW0?=
 =?us-ascii?Q?ycXqqUT6drdcQGugzQKIgPw+qWPMEJrgjFW9Sg7svB+RX+nfmDQiPerIOfw5?=
 =?us-ascii?Q?/sFIiJJW56LxNwun204iaP5BaSIG9L13YCkMqxR6P83M074jeVhA13fahQ1v?=
 =?us-ascii?Q?xeVmeBlVEGZzup2Uj/AFOjuupztWNoZITAUDhRbuJ/EwGqXzxeGRYtyfqPfh?=
 =?us-ascii?Q?+Vc+amKk2etB3zRKzD3W3vzUVwIvorFhC/vkg6MB9LkptasEmLn4eahh5iJD?=
 =?us-ascii?Q?Gx/VTA3cjut4iiwSlAUhlMnxsnxfIvMpbg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR04MB497297B2D0CB8DF8894EB65386BA9DM6PR04MB4972namp_"
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978d65e2-3d4e-4c21-5cef-08d8c3678717
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 08:34:28.7664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Xam546gszbEFO8oYDat64TQDlpIs22yxwb+LuFp88Uvtlt+RJdak/GCQfIXADtruGdwXVfdDrsBSMftWAQsbepic9n+7nRZHvVV+mryu7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1114

--_000_DM6PR04MB497297B2D0CB8DF8894EB65386BA9DM6PR04MB4972namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 1/27/21 11:27 PM, Damien Le Moal wrote:

+
+       bio_set_dev(bio, bdev);
+       bio->bi_iter.bi_sector =3D sector;
+       bio_set_op_attrs(bio, op, op_flags);


This function is obsolete. Open code this.


And that also mean that you could remove one argument to bio_new(): combine=
 op
and op_flags into "unsigned int opf"



I did that initially but kept it separate for RFC, that is much easier than=
 having

an extra arg, will change it in V1.

--_000_DM6PR04MB497297B2D0CB8DF8894EB65386BA9DM6PR04MB4972namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div class=3D"moz-cite-prefix">On 1/27/21 11:27 PM, Damien Le Moal wrote:<b=
r>
</div>
<blockquote type=3D"cite" cite=3D"mid:BL0PR04MB6514DBA7EDB8EC87A1C20871E7BA=
9@BL0PR04MB6514.namprd04.prod.outlook.com">
<blockquote type=3D"cite" style=3D"color: #007cff;">
<blockquote type=3D"cite" style=3D"color: #007cff;">
<pre class=3D"moz-quote-pre" wrap=3D"">+=0A=
+	bio_set_dev(bio, bdev);=0A=
+	bio-&gt;bi_iter.bi_sector =3D sector;=0A=
+	bio_set_op_attrs(bio, op, op_flags);=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">This function is obsolete. Open code=
 this.=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">And that also mean that you could re=
move one argument to bio_new(): combine op=0A=
and op_flags into &quot;unsigned int opf&quot;=0A=
=0A=
</pre>
</blockquote>
<p><font face=3D"monospace">I did that initially but kept it separate for R=
FC, that is much easier than having</font></p>
<p><font face=3D"monospace">an extra arg, will change it in V1.</font><br>
</p>
</body>
</html>

--_000_DM6PR04MB497297B2D0CB8DF8894EB65386BA9DM6PR04MB4972namp_--

