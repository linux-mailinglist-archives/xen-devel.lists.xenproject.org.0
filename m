Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC14B1FFB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 09:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270189.464392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIR6N-0004jB-QL; Fri, 11 Feb 2022 08:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270189.464392; Fri, 11 Feb 2022 08:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIR6N-0004h4-ML; Fri, 11 Feb 2022 08:16:23 +0000
Received: by outflank-mailman (input) for mailman id 270189;
 Fri, 11 Feb 2022 08:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17AN=S2=epam.com=prvs=4041139d62=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nIR6L-0004gy-W5
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 08:16:22 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3e07288-8b12-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 09:16:20 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21B7vp4a013412;
 Fri, 11 Feb 2022 08:16:18 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e5krx83j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 08:16:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM6PR03MB3704.eurprd03.prod.outlook.com (2603:10a6:209:30::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 11 Feb
 2022 08:16:14 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 08:16:14 +0000
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
X-Inumbo-ID: e3e07288-8b12-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ba//JwY5geq8hygiHmRlMtIVGB3j3SlcjmRKyMVCqdD8FWltj4MC82FeTootjO38NiBaYEbzXMbAHS/4mKxn/ts/UExe195sUWJmsF9CL/PdBM6MdQoSyEzOtB1YsuOw9eVS98Hde+C18W9r79VLU8q+6sPNOC2dzqp522r54eQ/EoE/QcXcvI/IBEpQDPJg+HY1ZbgIR4SzW6HPw2rHzO+Ra+WGdgKgyJKs+6DgZJ69PivoBqf1+O54QODjqwnuXk117i9xAm1/ODam+u6Cyn1L8ddaRDUONSp+d0QyPM4UBy6DDVy+a2+aBiqxZO+tvEzmwaelEo0CMeos+X9KLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqJeLMR7PPDVVxu2lAVtDPG0X6ZSZGr7+keXc3LyO4A=;
 b=GLprB86sLZfYoYqDquVDgiYFV+XGjK1vpXbjm4fgj6UL+Ge7TeXsIvU4cg93P6J7vYqxDi8G0m6WReG3N89HP9LONtFojkL5s0Hu/a50GtgK4PwngrBbUBKPvqntfsd3W8NH5Cmn3k6WauR2RZ6JNhssTyFn4R0k67VFq7YFgL0kXuaSJPR7XmzU1IP4PUKfaP4lvTOYhmK6t6EYHlDzbf7jTn/YWsFRAJSgh0nQFpgWAVWBWOcFZvzMv8TUXeLfTk/r/5qDSp32Jk+bFs16WYvNHzez/NH1E02oemKsLW4X9QTUOSP0SsctbrNrDkU63lfc1W3tXhwItkOzu0bGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqJeLMR7PPDVVxu2lAVtDPG0X6ZSZGr7+keXc3LyO4A=;
 b=OwVAjKtQtjwzWIySsLIoDuk5VMxRnzvFRPkMDP0CcYtrc91hqKFQ+smqdcMtnzCxUxnqItEJkJ7r/DOJ1kS9sPJb1ayJFv7tFhsDEklOR3caTpp5iTCBewzs+nky6xn2M2qdk7taIUYbDUJTaUi178yIaEzqv+mRZ69d02d1WPgH4F43qKE8Wd3FOGG9bA3UzmcazHegPYOwZuJ/n7fNObWfc08HFX9g8plHKfmZ/1MU30btyKMvihCg6jJiDXTet3nJKmIDE5lbT4Fvqi5XHvUprO5ncTaCDYEDYzl9V5vJ8ymcLwYJyKPU4PSA/jAfb/nSzIU1zTfDjetKeEFzxQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
Thread-Topic: [RFC v2 1/8] xen/hypfs: support fo nested dynamic hypfs nodes
Thread-Index: AQHYHRW07SkrMxyT/k6/hhSCHW7RmqyMZwEAgAGeF4A=
Date: Fri, 11 Feb 2022 08:16:14 +0000
Message-ID: <20220211081613.GA2274024@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <8ab7e9ffd5f041c2631f754c7c596874cf6a99c1.1644341635.git.oleksii_moisieiev@epam.com>
 <74e4635d-10ad-86c4-71b1-6e46bc76a89a@suse.com>
In-Reply-To: <74e4635d-10ad-86c4-71b1-6e46bc76a89a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d054d62-de34-4e26-3a16-08d9ed36c543
x-ms-traffictypediagnostic: AM6PR03MB3704:EE_
x-microsoft-antispam-prvs: 
 <AM6PR03MB37045B589A7F9B16B2B4195FE3309@AM6PR03MB3704.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CHn8xwBTVx7DybkdAVyh+4EXyQqkoTqydX6lMOcbHJLhY6EJt0ila5ZrB63FKL2N6HkiJVUPkcsx/qlNZ34IOn3Z7ouETkxirQAg1LnzOISdFQGFa46i5TDAztJQjqlQqIPGsiVLUfh/AcZzeUPtFhIo8R3W0o/Uhg3X/AJxaaSHA/JZNCGY6Kc/YfdnvxOjqNw62m/wlJOqE2834YmviK5wzznLDEiN6367tS+jyeKoJIV4FSlpt//e4WOQj17CZ8TRwau6Wdq4S64f6CCYe1AfXt94H9QD/yLLlq5oXzP20f7OSWCPG4w66YfKyAqeF5K6rbKOXi0Jsv+xV+LifOOugTM8GV3NnLmKuxKl+9NpWziC9xqQKTsslzZXhHjKO2B4vAJbO4iq3DLR6g04V0eRrgey4ZRJL+656JMDafY1azWirJfw1BkWuJ2kOPf4julI/ARVJhks4FCW3HR/rt96RATbEKlCSqfjqExQwH++Jdl63QMD/vxufHdXjyYv4wjtDZlh2IjWzme4HaG3DenmRjlCXXrrD67fBJl/SzqfjYrAhnEsii9M9C3AsxEWZdffmMq+ENmxWrhPP2rCYwSYi5Ix+udoFRtLHhk7jO2hJXRbuV3mO5YPkvMJsKdn1g/UAAwJ6BR1IhjJcxeXGhHaHGbUiy4tuRdw+ysIfSyw78q/QZkSXCbDR75T480ouQoWCHxENLfmPmVrCZEwiw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(1076003)(33656002)(71200400001)(186003)(6506007)(508600001)(30864003)(26005)(5660300002)(38070700005)(2906002)(6486002)(6512007)(86362001)(9686003)(83380400001)(66556008)(316002)(6916009)(91956017)(66476007)(33716001)(53546011)(8676002)(4326008)(66446008)(8936002)(76116006)(66946007)(64756008)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QvAiY3Pz6lABR178ZEh+Hz8Oc1+QuFCEV+ksUp+r8KaDYOJJpFFF/cQURGOZ?=
 =?us-ascii?Q?yxSJzJ3kLerqUYyESb7QwqnEam5U/2JbShARarYeLLir2FBdwo9g3j6g7k0d?=
 =?us-ascii?Q?YS5/MTPNZVS8q/LuQNk6FwpK+y2luHaNPbMobY1/EeKUoibzk7FjLw0oEVtS?=
 =?us-ascii?Q?BPMACcpLIJ/cdWRv+YytIzymn/sfogspdM75k5feLYnKE/7rZ4QF2yya1dmA?=
 =?us-ascii?Q?dH4M3yzaUYG77pH19ZPTMZHPD4acq0B0zwEdC60sdHycE1IdkIugF+J32Nka?=
 =?us-ascii?Q?lpv/F+6v+vt2MPW0289R69ujlptLPMukj4jBGpHXV815IZ1yzcIYqYoucQW7?=
 =?us-ascii?Q?V60s564qBEX7KYFheuRofU1TuZOIb0s7C2rNzCBwSEljvvbYwRN6EarEJaSy?=
 =?us-ascii?Q?md/rc28t95MdWW47HMlOYCMwxvDi0mucoj6VITouXF2uOG/pM0g5/8VNgP4u?=
 =?us-ascii?Q?2/pb+PYFwOGrYCpfi4pa9rfm7s0w0zheP/jJS9r36TIwXqdQea0J+tynuQSx?=
 =?us-ascii?Q?fqdTzHt7XMJdAgcc4f0HzCmrNsGwy/UwPiZiBUAgEEl9UqSxDTpVgltvxGzb?=
 =?us-ascii?Q?TTO16vu6wJ3GkE7KlhbLLBHnD8BAnQ3Sfo3pivw+Qe5vn0aT0AzW9utNczAQ?=
 =?us-ascii?Q?TFhIcfOjE3Ar2dPuurRROj3SC8AuIjADkYlj0EID/uSKNZHojWgP2uVPGMJc?=
 =?us-ascii?Q?rbVFZJ7r37Qfwd/hIATkM981Qa/vKaBeOUdE9PB4cXwiWf6Jh4q+TXcmIOhw?=
 =?us-ascii?Q?fD8H0dnd+Qb3kbjQvYGwsoWni3TAw3A0FkgynlVNo1H2G+DvlUBzRNrwwPHv?=
 =?us-ascii?Q?NiJqdyXLuYpfqBizuUzKTmcXeHHil8iFnm2ttPcGBXn5ZjuQfyb2LHvS70ZS?=
 =?us-ascii?Q?zTezGCVC4EBs6Wc0UA6qlP0nG7D4HsurwLJa/O/jgTOAJAgQunN1obdhVYdi?=
 =?us-ascii?Q?2KnN7hTiIuTUxUqCDwyr1Cl7V5fXhZ5DUVrbpY1ZG0kSusYpjVTUeKmyCm8I?=
 =?us-ascii?Q?YyPVX9XlMYHF7x3GJGReTpvgc08RSe7M0x7EqE9ZlUWiLe1ozloQuKVdafWx?=
 =?us-ascii?Q?PLKIxaIfu5RKL7ZOizQXqezE/Z8WnVkZbTJxQqmkB8hx9seZFgVHG8ou2Ry6?=
 =?us-ascii?Q?xex0hvaNzcDaaKa4J9xcvS1tj5zJ78GdRa9zZ0KjKvhh7VQCviVyN4Ar3rpd?=
 =?us-ascii?Q?xml3GhD/BeD0dwLqVykyZGZ85vJWcYWYbV+qE/8/r6j3LLp2rrf0jkJr6fmf?=
 =?us-ascii?Q?rpT45evrJ81T//7Vyobdt4qb/JUpDwJaCe+3MRjU26Uw3B+ffs6q3KCoUtOO?=
 =?us-ascii?Q?mlxUpL47gCdSxW0vQA3pKu1uW7RO9HJgVj+IRx+1a0VeS3TWe+O8uE6ATVYC?=
 =?us-ascii?Q?TfopKEV4guk6vH88caslgpouX2WxveKya+5ZyJ6OG6w0Gj3KlBuMsk7RR8Hq?=
 =?us-ascii?Q?veAOXkOPyjd3ZonUt8UlgBSqPi4i53jlvHF3b4/DponMarXgZaFryaP2qKci?=
 =?us-ascii?Q?JRI1HSgQINxCnQvUgD/awkABsBFEol/S+DlfXffvjJ66OPto9R++QtDOEaj1?=
 =?us-ascii?Q?soaNZrl4QEyKQRzbW3K+ala6ukCUEw+497/11VL3yVU9IhVFHUj/f6FjqsLK?=
 =?us-ascii?Q?Vpqv3hpvRP2r9E+KVyvZi7DuEyoiIQeDnRGi6K/K5XagdGiVwVewdYsjmA7C?=
 =?us-ascii?Q?5qfl30mfypWOoHWY29P9vrc2MNk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8308B27B4F1FC74E967494808B2C6117@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d054d62-de34-4e26-3a16-08d9ed36c543
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 08:16:14.1920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcewH7+kekkj7ltcrZUvvv4riTeR+TiO44ATaJYUN2SXn6KrmESouEImi3WAcmQjLcFAuF0v+EE5qwBvigZfBcjjF5uoZTBGAbwm7Zi7Inw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3704
X-Proofpoint-ORIG-GUID: T4loW9st5Up3rf1nTAdyK2YTQBe3x5R6
X-Proofpoint-GUID: T4loW9st5Up3rf1nTAdyK2YTQBe3x5R6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110046

Hi Juergen,

On Thu, Feb 10, 2022 at 08:34:08AM +0100, Juergen Gross wrote:
> On 08.02.22 19:00, Oleksii Moisieiev wrote:
>=20

> > Add new api:
> > - hypfs_read_dyndir_entry
> > - hypfs_gen_dyndir_entry
> > which are the extension of the dynamic hypfs nodes support, presented i=
n
> > 0b3b53be8cf226d947a79c2535a9efbb2dd7bc38.
> > This allows nested dynamic nodes to be added. Also input parameter is
> > hypfs_entry, so properties can also be generated dynamically.
> >=20
> > Generating mixed list of dirs and properties is also supported.
> > Same as to the dynamic hypfs nodes, this is anchored in percpu pointer,
> > which can be retriewed on any level of the dynamic entries.
> > This handle should be allocated on enter() callback and released on
> > exit() callback. When using nested dynamic dirs and properties handle
> > should be allocated on the first enter() call and released on the last
> > exit() call.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   xen/common/hypfs.c      | 83 +++++++++++++++++++++++++++++++++-------=
-
> >   xen/include/xen/hypfs.h | 14 ++++++-
> >   2 files changed, 79 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
> > index e71f7df479..6901f5e311 100644
> > --- a/xen/common/hypfs.c
> > +++ b/xen/common/hypfs.c
> > @@ -367,28 +367,27 @@ unsigned int hypfs_getsize(const struct hypfs_ent=
ry *entry)
> >   /*
> >    * Fill the direntry for a dynamically generated entry. Especially th=
e
> > - * generated name needs to be kept in sync with hypfs_gen_dyndir_id_en=
try().
> > + * generated name needs to be kept in sync with hypfs_gen_dyndir_entry=
().
> >    */
> > -int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
> > -                               unsigned int id, bool is_last,
> > +int hypfs_read_dyndir_entry(const struct hypfs_entry *template,
> > +                               const char *name, unsigned int namelen,
> > +                               bool is_last,
> >                                  XEN_GUEST_HANDLE_PARAM(void) *uaddr)
>=20
> Please fix the indentation of the parameters.
>=20
> >   {
> >       struct xen_hypfs_dirlistentry direntry;
> > -    char name[HYPFS_DYNDIR_ID_NAMELEN];
> > -    unsigned int e_namelen, e_len;
> > +    unsigned int e_len;
> > -    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id);
> > -    e_len =3D DIRENTRY_SIZE(e_namelen);
> > +    e_len =3D DIRENTRY_SIZE(namelen);
> >       direntry.e.pad =3D 0;
> > -    direntry.e.type =3D template->e.type;
> > -    direntry.e.encoding =3D template->e.encoding;
> > -    direntry.e.content_len =3D template->e.funcs->getsize(&template->e=
);
> > -    direntry.e.max_write_len =3D template->e.max_size;
> > +    direntry.e.type =3D template->type;
> > +    direntry.e.encoding =3D template->encoding;
> > +    direntry.e.content_len =3D template->funcs->getsize(template);
> > +    direntry.e.max_write_len =3D template->max_size;
> >       direntry.off_next =3D is_last ? 0 : e_len;
> >       if ( copy_to_guest(*uaddr, &direntry, 1) )
> >           return -EFAULT;
> >       if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
> > -                              e_namelen + 1) )
> > +                              namelen + 1) )
> >           return -EFAULT;
> >       guest_handle_add_offset(*uaddr, e_len);
> > @@ -396,6 +395,22 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_=
entry_dir *template,
> >       return 0;
> >   }
> > +/*
> > + * Fill the direntry for a dynamically generated entry. Especially the
> > + * generated name needs to be kept in sync with hypfs_gen_dyndir_id_en=
try().
> > + */
> > +int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
> > +                               unsigned int id, bool is_last,
> > +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
> > +{
> > +    char name[HYPFS_DYNDIR_ID_NAMELEN];
> > +    unsigned int e_namelen;
> > +
> > +    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id);
> > +    return hypfs_read_dyndir_entry(&template->e, name, e_namelen, is_l=
ast, uaddr);
> > +}
> > +
> > +
> >   static const struct hypfs_entry *hypfs_dyndir_enter(
> >       const struct hypfs_entry *entry)
> >   {
> > @@ -404,7 +419,7 @@ static const struct hypfs_entry *hypfs_dyndir_enter=
(
> >       data =3D hypfs_get_dyndata();
> >       /* Use template with original enter function. */
> > -    return data->template->e.funcs->enter(&data->template->e);
> > +    return data->template->funcs->enter(data->template);
> >   }
> >   static struct hypfs_entry *hypfs_dyndir_findentry(
> > @@ -415,7 +430,7 @@ static struct hypfs_entry *hypfs_dyndir_findentry(
> >       data =3D hypfs_get_dyndata();
> >       /* Use template with original findentry function. */
> > -    return data->template->e.funcs->findentry(data->template, name, na=
me_len);
> > +    return data->template->funcs->findentry(&data->dir, name, name_len=
);
> >   }
> >   static int hypfs_read_dyndir(const struct hypfs_entry *entry,
> > @@ -426,7 +441,36 @@ static int hypfs_read_dyndir(const struct hypfs_en=
try *entry,
> >       data =3D hypfs_get_dyndata();
> >       /* Use template with original read function. */
> > -    return data->template->e.funcs->read(&data->template->e, uaddr);
> > +    return data->template->funcs->read(data->template, uaddr);
> > +}
> > +
> > +/*
> > + * Fill dyndata with a dynamically generated entry based on a template
> > + * and a name.
> > + * Needs to be kept in sync with hypfs_read_dyndir_entry() regarding t=
he
> > + * name generated.
> > + */
> > +struct hypfs_entry *hypfs_gen_dyndir_entry(
> > +    const struct hypfs_entry *template, const char *name,
> > +    void *data)
> > +{
> > +    struct hypfs_dyndir_id *dyndata;
> > +
> > +    dyndata =3D hypfs_get_dyndata();
> > +
> > +    dyndata->template =3D template;
> > +    dyndata->data =3D data;
> > +    memcpy(dyndata->name, name, strlen(name));
> > +    dyndata->dir.e =3D *template;
> > +    dyndata->dir.e.name =3D dyndata->name;
> > +
> > +    dyndata->dir.e.funcs =3D &dyndata->funcs;
> > +    dyndata->funcs =3D *template->funcs;
> > +    dyndata->funcs.enter =3D hypfs_dyndir_enter;
> > +    dyndata->funcs.findentry =3D hypfs_dyndir_findentry;
> > +    dyndata->funcs.read =3D hypfs_read_dyndir;
> > +
> > +    return &dyndata->dir.e;
> >   }
> >   /*
> > @@ -442,12 +486,13 @@ struct hypfs_entry *hypfs_gen_dyndir_id_entry(
> >       dyndata =3D hypfs_get_dyndata();
> > -    dyndata->template =3D template;
> > +    dyndata->template =3D &template->e;
> >       dyndata->id =3D id;
> >       dyndata->data =3D data;
> >       snprintf(dyndata->name, sizeof(dyndata->name), template->e.name, =
id);
> >       dyndata->dir =3D *template;
> >       dyndata->dir.e.name =3D dyndata->name;
> > +
>=20
> Unrelated change?
>=20
> >       dyndata->dir.e.funcs =3D &dyndata->funcs;
> >       dyndata->funcs =3D *template->e.funcs;
> >       dyndata->funcs.enter =3D hypfs_dyndir_enter;
> > @@ -457,6 +502,12 @@ struct hypfs_entry *hypfs_gen_dyndir_id_entry(
> >       return &dyndata->dir.e;
> >   }
> > +unsigned int hypfs_dyndir_entry_size(const struct hypfs_entry *templat=
e,
> > +                                    const char *name)
>=20
> Please fix indentation.
>=20
> > +{
> > +    return DIRENTRY_SIZE(strlen(name));
> > +}
> > +
> >   unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *templat=
e,
> >                                       unsigned int id)
> >   {
> > diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
> > index e9d4c2555b..5d2728b963 100644
> > --- a/xen/include/xen/hypfs.h
> > +++ b/xen/include/xen/hypfs.h
> > @@ -79,8 +79,8 @@ struct hypfs_entry_dir {
> >   struct hypfs_dyndir_id {
>=20
> Please rename to struct hypfs_dyndir.

Ok, thanks.

>=20
> >       struct hypfs_entry_dir dir;             /* Modified copy of templ=
ate. */
> >       struct hypfs_funcs funcs;               /* Dynamic functions. */
> > -    const struct hypfs_entry_dir *template; /* Template used. */
> > -#define HYPFS_DYNDIR_ID_NAMELEN 12
> > +    const struct hypfs_entry *template; /* Template used. */
> > +#define HYPFS_DYNDIR_ID_NAMELEN 32
> >       char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. *=
/
> >       unsigned int id;                        /* Numerical id. */
>=20
> What about the following change instead:
>=20
> -    const struct hypfs_entry_dir *template; /* Template used. */
> -#define HYPFS_DYNDIR_ID_NAMELEN 12
> -    char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. */
> -
> -    unsigned int id;                        /* Numerical id. */
> -    void *data;                             /* Data associated with id. =
*/
> +    const struct hypfs_entry *template;  /* Template used. */
> +    union {
> +#define HYPFS_DYNDIR_NAMELEN    32
> +        char name[HYPFS_DYNDIR_NAMELEN]; /* Name of hypfs entry. */
> +        struct {
> +#define HYPFS_DYNDIR_ID_NAMELEN 12
> +            char name[HYPFS_DYNDIR_ID_NAMELEN]; /* Name of id entry. */
> +            unsigned int id;                    /* Numerical id. */
> +        } id;
> +    };
> +    void*data;                          /* Data associated with entry. *=
/
>=20

I'm not sure I see the benefit from this union. The only one I see is
that struct hypds_dyndir will be smaller by sizeof(unsigned int).
Could you explain please?

Also what do you think about the following change:
-    char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. */
-
-    unsigned int id;                        /* Numerical id. */
-    void *data;                             /* Data associated with id. */
+    char name[HYPFS_DYNDIR_ID_NAMELEN];     /* Name of hypfs entry. */
+
+    unsigned int id;                        /* Numerical id. */
+    union {
+       const void *content;
+       void *data;                             /* Data associated with id.=
 */
+    }
This change is similar to the hypfs_entry_leaf. In this case we can
store const pointer for read-only entries and use data when write access
is needed?

PS: I will address all your comments in v3.

Best regards,
Oleksii.

> > @@ -197,13 +197,23 @@ void *hypfs_alloc_dyndata(unsigned long size);
> >   #define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof=
(type)))
> >   void *hypfs_get_dyndata(void);
> >   void hypfs_free_dyndata(void);
> > +int hypfs_read_dyndir_entry(const struct hypfs_entry *template,
> > +                               const char *name, unsigned int namelen,
> > +                               bool is_last,
> > +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
>=20
> Again: indentation.
>=20
> >   int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template=
,
> >                                  unsigned int id, bool is_last,
> >                                  XEN_GUEST_HANDLE_PARAM(void) *uaddr);
> > +struct hypfs_entry *hypfs_gen_dyndir_entry(
> > +    const struct hypfs_entry *template, const char *name,
> > +    void *data);
> >   struct hypfs_entry *hypfs_gen_dyndir_id_entry(
> >       const struct hypfs_entry_dir *template, unsigned int id, void *da=
ta);
> >   unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *templat=
e,
> >                                       unsigned int id);
> > +unsigned int hypfs_dyndir_entry_size(const struct hypfs_entry *templat=
e,
> > +                                    const char *name);
>=20
> Indentation.
>=20
> > +
> >   #endif
> >   #endif /* __XEN_HYPFS_H__ */
>=20
>=20
> Juergen





