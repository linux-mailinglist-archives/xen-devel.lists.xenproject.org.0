Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D944B8F82
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 18:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274338.469780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOJH-0006gF-Cg; Wed, 16 Feb 2022 17:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274338.469780; Wed, 16 Feb 2022 17:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOJH-0006dO-7s; Wed, 16 Feb 2022 17:41:47 +0000
Received: by outflank-mailman (input) for mailman id 274338;
 Wed, 16 Feb 2022 17:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ai2G=S7=epam.com=prvs=4046428260=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nKOJF-0006dI-0u
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 17:41:45 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23e9fe9-8f4f-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 18:41:41 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21GGhIeg022350;
 Wed, 16 Feb 2022 17:41:31 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e90eh1dst-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 17:41:31 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB7PR03MB4185.eurprd03.prod.outlook.com (2603:10a6:10:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 17:41:25 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 17:41:25 +0000
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
X-Inumbo-ID: b23e9fe9-8f4f-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA4EFxD2fVNCIHoClymZrLmPngOvJTPvnXIjrowXoMSTGqtVTrqSRxRDfruNbF+WUXF1i4KNkF5B+v3mJRandXcIi3xQjWcPKZavrfZBy2MY39COjDffXSjePeT5St+8VXbjWzFht/hRmd9iJo3QT/bRHST0a20lpIUOO5tl5W9z9xCdrnr7AEwNUQBV3wkxs282JpdbVYlLkLUXcZlMKITQLREJeMa+nYVTzjuB29MFitvGfLcj5jnn2TVDLIsaVs9qftINPZ0t8heh3sbcAuiENX2oTUVfnrgMWvL2QM/t4tnTXpLXo8BiMVUFx72E7Q5q/+h2vOF4AHNrJzCNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX+SaukE6/joZlH4ugSUUza9ISs4abl66HQvh0Dilms=;
 b=MkiULN1i/B/XrhBjDCPIe7ufYXIrVStojAe3FjGTs5YXBYZbY0iPNgDp8oMFeWGEJLLRlIb2FynJ9RFFHzEWvU4bWu4bV6ebWwMhDOMn5UyZRdBFJ6aG7E79LlX9PfunYryoV2xQ152VUHp9PoAf+hGyo3xs2D0Fwgc1Ape53TahSDBggFzdgnOuPJdkm/alyeokDyTQEg8WlITVhqkMF8UejewHzo/WpaxaXcA7smnMp1D85Ul5tv2c2q0eFL6tPaIOYBA51nHG41FEQvSQqm+tZBVBLXtaopI4DyJHHEb2e5rZPEWCNHCy7MTvNQNfRjn7CjE/q2+9SmaO5pe6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX+SaukE6/joZlH4ugSUUza9ISs4abl66HQvh0Dilms=;
 b=RZB/QDBDyc5n7/oalqZi+H/RQyuH+ADmTJWja+SIwT1UAdRSkYvAQH5qJjgg5XNgdLlWvgV2C3nwJKvaxTO5B+i9HbCsGxFKGsDe71bITwpPrxH08vieFPhSqrUsnyJfnVJr/O0xNsy/InkTp9IDdFyAKF19SWNKmzD/6Zn973cs8vBac8JB3cnvS8lNM26ZDLi8sxqc6w0tZRwHeabbK1rCCSN3LB7h4339jG7ucVJw3uMX29GjnAR63bWwJxHC5AMIv678K4/Kym3MA0Xa7Q9j+WBvKWqAmFR8H46066+jx/ci3wuYijxu2qwePuKhiydL7kZpZb+XkOjkURfEJg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Julien Grall
	<julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHYHRW24Dmb0qV8ZkqAv39Pf6/nVayODW6AgAAg+ICAAAmzAIABqiEAgAMLQQCAAAQDgIAABruAgACrggCAAtruAA==
Date: Wed, 16 Feb 2022 17:41:25 +0000
Message-ID: <20220216174124.GA651931@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com>
 <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
 <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
 <20220214111300.GA3615313@EPUAKYIW015D>
 <E78206B4-3793-498E-A580-F0561DF6D4AC@arm.com>
 <20220214115127.GA3637134@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2202141355150.4183037@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2202141355150.4183037@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71c67647-1fbd-4dbd-3f70-08d9f1738dd1
x-ms-traffictypediagnostic: DB7PR03MB4185:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB41856BFBD587046E34BEDD70E3359@DB7PR03MB4185.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4oQvI9bKTcYy656L9h/aR/GGAWt3s/2SrnJWWwVAxp0Yw6SEuuYC4frlTtahc/MG5CWy24/mE/Z4R4u5gQ750hr6B13v4U7pKsgUX1IgstJHAnCOCZ73Q+4miKgnp1rGeVm+jprh3YIe3PwZw7Q2VrjPR/WFuf3xkTyljpgzOO+rbby3W5xN5aIqIfKjUDbosZwfIVhDzLTmEo/6xmT9iDZteLqpLDLm7EL3s4GvbQx0/li9wtBWWFzj2jo9LnOnpkHYJnpuFEmClTWd9hCdxc1xsCfKiurbdPQhTyQ/QGZqNN+em0OJm+V48eD/e2TM0a+EloAxyJuuoiDpkyuXeUGov8IR5nGhZO2YBgwTTDvB3v+FN2K3kw+5BV8HwpfTUrPAncU8mY90Ey1egG9CtGz4flYSPxdHjzF3gaZcTqnCY1tetpTM2LF0XBes1A9h0X9eXzUc9LmF7Puhwjr/rKTttRo8ecyLam008Yh4Q+Fj7KGn+UYMg2oKOhhK13yrqyF97w6F2w+pxY8TnWAnE+2Wb35uwrl6AhXg5R8VIP11aDW13u73uP3/XeHoGadjj3TCIzF9wbvZVtj3/k5hxiboz0I9JsEmc0lOgEbKOICA4/3cV4h4RCBtFnx7yGyMqcARs7eLrw+H4o2YydjtNK37lJeO6h4SywDaSrCj7/UyMfZFmOkPtzmWkvshP1YU0QN7VPpKrOtcAU4v9fMg1PBFF41YG92d2E/eCzc5pt9MhSasmGO1uYWw5sdWFx7+tdidI7+zXb6Yp+dPC14EUDuibCCmdEyi32icm4WhPKsRM5dJraKOYqGe3wfoAa0lYRXrN5NEgQSBRytOsysIUA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(53546011)(33716001)(71200400001)(86362001)(8936002)(54906003)(38100700002)(6486002)(966005)(316002)(508600001)(33656002)(6512007)(9686003)(5660300002)(6506007)(107886003)(83380400001)(26005)(8676002)(2906002)(38070700005)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(66946007)(186003)(1076003)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RdB6JCdqgWFUc/B2WQRX6nD44TsdirMPM6Ii54q6iD0fcJRTbxYAPRAER6+X?=
 =?us-ascii?Q?kuRIXiGxPzHhlgsmDJ+9IFDxDB1TpFsN00E9cpgkVJfuhIrFVhEyNb1Hzfjp?=
 =?us-ascii?Q?oRD5cuB0BMU+THV1RTSIftiTvKDyTojhlLaDNdou82SAS24nQcdZPVMBugbW?=
 =?us-ascii?Q?906dAbWc0e4+GEcmrcIOZSa3o61bAoJ2wv9idjaerctJHVTkVIfJOk7R5Vr0?=
 =?us-ascii?Q?RJxl8v02ve+u7EgCpoH6d4RJJtLrLBAgD4orR2i3WZN9UOT4z1dUGjFLhtLc?=
 =?us-ascii?Q?Jb/xA7SkRMw2jlGOgSzOVUzCoCbjHA0wyDuhnbAqCG7y53YGquxnNTCfKOg4?=
 =?us-ascii?Q?wSb6DGO+Htb7QHSGaYYlvJinaHtGsZ+u597iYSfjN80jrERQrSz9XbhW3QG8?=
 =?us-ascii?Q?YCK2WWiIwNKb1r9kMany162swiaRPAZmFxfZDUgz+t8HZTtm734l4Nc62QVK?=
 =?us-ascii?Q?6xJs1Sp/94CCHrFkOgQxmm5yF65JIgSaCDETWZAWSlduZXD9JiB/xEgUJHql?=
 =?us-ascii?Q?OrY0fOzB1ryNSUtsDhjZ+FmdTO4ZdP/jNWbTrbFwPWYbUjB38hKO1AwW1c/L?=
 =?us-ascii?Q?mbgnZi6JefaRwDoPZkKU990StJFUqjTy3ig98XrRRG2V15b76nbV1NVO7jo5?=
 =?us-ascii?Q?ikA8WBB7mKAEyQ1JErLHpm0jFF55b24vFBPiFvjmqlPZuJDiaTYQmgZZUZh1?=
 =?us-ascii?Q?TiMLHGrt718lqZhkuA4PsbRdWs5aFbyj71VeLfOegrR0cJ0kYamRrjFABgbp?=
 =?us-ascii?Q?Hb5puumbwdeIOJ6K6WFqz+oN8AG8AUpmtcB8EFpK+SshN5EI1RT8EwhvRalW?=
 =?us-ascii?Q?BavJJE7A4TPYgNjwS7BQrSSMcW40tpNg7xLYcbg32FWKVHoTZG9YCWWsnwSO?=
 =?us-ascii?Q?jO8wQ7L4BeBU7NoWwME/VV4nzJ1fgs/55FBhbj44nrl4lZAgO05ckPERzgyC?=
 =?us-ascii?Q?txU9ufaAki0Uglg85ozyTh3PWk0AJ2z4sRqjdP+QTGM648O8kg400YCKQc7G?=
 =?us-ascii?Q?eEfjQPUZmDuzRvBD/jr/5y7oPZClpcbUFY31T2gEHvaYCDRL/RMBnEeYw9B9?=
 =?us-ascii?Q?sNH/R5GvNbMa+x1R159AU1nOTzAHYzFzSsIIkKgQkEwR3WeCXKUvc3ZriQAS?=
 =?us-ascii?Q?Tppco1/q765EqDZx6bUSQN4ILUReSLzJfbHUQQT4R6J9VCK/ITBfqAjD6mKz?=
 =?us-ascii?Q?YazdFuTAOEMqKYUqNKPErEqGvYY63Pc/vtrIEb3W3bYi0gFcR7xQDg9FlnYd?=
 =?us-ascii?Q?iEY8HkjyvksIk5XudWq5UM+q/paS6sNMUTtxZzf4AIctLIci+YmkoV7YiYii?=
 =?us-ascii?Q?6btuKeOVq4NTjrgbJheuetVKcoYsViYAm4kdTjvDvPdLEbNtsMXwKrbGV0EY?=
 =?us-ascii?Q?JEnpieBJyk1rJYd1BYo2hsQdP/tpMn/JGXnlCt49Y8HTsWo60CV9Ku6/drtV?=
 =?us-ascii?Q?KP4gyyO733FMse4cZhnPaTsyE3bb3ohxP1WbNI9kVMHdur4fRzxLtq5aghI1?=
 =?us-ascii?Q?99lPZ1Ca9wH5r3UCGvq2aELKEAzf+CMxe77CkZDml09y3q7dkOg6KvUtTuXB?=
 =?us-ascii?Q?Z0MVQ72+idTxFHGr0ZdtkP3XQWdeQ8Q8sZoldmoJCkKXZJD/ACAzxFYOY1ul?=
 =?us-ascii?Q?xmvoKVFC2zo4zjH6cmum4r6K4CTsrE3ygygXllWjnCago+ynUAdKwLDsnNbq?=
 =?us-ascii?Q?S80q3sNZftTZ5sFx4ywad2uNw38=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DFF6AF0E31EE8248888FCB561C078CE0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c67647-1fbd-4dbd-3f70-08d9f1738dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 17:41:25.1543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwZRR42oTbdoXqi8IiNSu5OC/7h3KDXzIn8/H0iBZeBTWUUXB7ZdOd8KUqHaUHqbEgSfnaO70JjSMs0e+JtFSFunZXI0tzde9aSA1UEM/x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4185
X-Proofpoint-ORIG-GUID: E_SY76v2ChxxDTNXgVMnlBQXimE13RLy
X-Proofpoint-GUID: E_SY76v2ChxxDTNXgVMnlBQXimE13RLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_08,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160100

Hi Stefano,

On Mon, Feb 14, 2022 at 02:05:18PM -0800, Stefano Stabellini wrote:
> On Mon, 14 Feb 2022, Oleksii Moisieiev wrote:
> > Hi Bertrand,
> >=20
> > On Mon, Feb 14, 2022 at 11:27:21AM +0000, Bertrand Marquis wrote:
> > > Hi Oleksii,
> > >=20
> > > > On 14 Feb 2022, at 11:13, Oleksii Moisieiev <Oleksii_Moisieiev@epam=
.com> wrote:
> > > >=20
> > > > Hi Julien,
> > > >=20
> > > > On Sat, Feb 12, 2022 at 12:43:56PM +0000, Julien Grall wrote:
> > > >> Hi,
> > > >>=20
> > > >> On 11/02/2022 11:18, Bertrand Marquis wrote:
> > > >>> Do you plan to add support for other boards ?
> > > >>>=20
> > > >>> Did you discuss more in general with the linux kernel guys to see=
 if this
> > > >>> approach was agreed and will be adopted by other manufacturers ?
> > > >>>=20
> > > >>> All in all I think this is a good idea but I fear that all this w=
ill actually only
> > > >>> be used by one board or one manufacturer and other might use a di=
fferent
> > > >>> strategy, I would like to unrisk this before merging this in Xen.
> > > >>=20
> > > >> In the past we merged code that would only benefits one vendor (i.=
e. EEMI).
> > > >> That said, this was a vendor specific protocol. I believe the situ=
ation is
> > > >> different here because the spec is meant to be generic.
> > > >>=20
> > > >>> @julien and Stefano: what is your view here ?
> > > >>=20
> > > >> I share the same concerns as you. I think we need to make sure all=
 the
> > > >> pieces we rely on (e.g. firmware, DT bindings) have been agreed be=
fore we
> > > >> can merge such code in Xen.
> > > >>=20
> > > >> The first step is to have all the pieces available in public so th=
ey can be
> > > >> reviewed and tested together.
> > > >>
> > > >> Oleksii, on a separate e-mail, you said you made change for ATF. H=
ow much of
> > > >> those changes was related to support for Xen? If they are some, th=
en I think
> > > >> they should be upstreamed first.
> > > >>=20
> > > >=20
> > > > Let me share changes, that were done to AT-F and Linux kernel
> > > > device-tree in terms of the SCMI mediator POC.
> > > > Changes to the Linux kernel:
> > > > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/arm=
-trusted-firmware/pull/4__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyW=
ycHX0YARezTnc7aYHpGRJ8tSxHqIC0fTMUUSV$ [github[.]com]
> > > > Based on renesas-rcar linux-bsp, branch v5.10/rcar-5.0.0.rc5
> > > >=20
> > > > Changes to AT-F:
> > > > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/lin=
ux-bsp/pull/3__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyWycHX0YARezT=
nc7aYHpGRJ8tSxHqIC0eDKS3ge$ [github[.]com]
> > > > Based on renesas-rcar/arm-trusted-firmware branch rcar_gen3_v2.5.
> > >=20
> > > You inverted the links but thanks this is really useful.
> > >=20
> >=20
> > That's strange. Links looks good from xen.markmail.org interface.
> >=20
> > > Did you push the ATF changes to mainstream ATF or discuss those with
> > > the maintainers ?
> >=20
> > No. We did changes in ATF as a proof of concept.
> >=20
> > >=20
> > > The strategy overall is nice but we need to make sure this is accepte=
d and
> > >  merged by all parties (ATF and Linux) to make sure the support for t=
his will
> > > not only be available in Xen and for one board.
>=20
> +1
>=20
>=20
> > I've prepared patch to Linux kernel, which is introducing scmi_devid
> > binding, needed to set device permissions via SCMI. I've contacted
> > Sudeep Holla <sudeep.holla@arm.com>, who is the maintainer of the SCMI =
protocol
> > drivers. Waiting for the response.
> >=20
> > Changes to ATF are not Xen specific and were done in terms of POC. We d=
o
> > not have plans to upstream those changes right now.
>=20
> If this work relies on a new interface in ATF, and the interface is not
> vendor-specific, then at least the interface (if not the code) should be
> reviewed and accepted by ATF.
>=20
> Otherwise we risk ending up with an upstream SCMI implementation in Xen
> that cannot be used anywhere, except the PoC. To make things worse, this
> could happen:
>=20
> - we upstream the SCMI mediator to Xen
> - we upstream any required changes to Linux
> - ATF rejects the SCMI-related interface changes
> - ATF comes up with a difference interface
>=20
> At this point we would have to deprecate the implementation in Xen. It
> might also be difficult to do so due to versioning issues. We would
> need to be able to detect which version of ATF we are running on, to
> distinguish the ATF PoC version that works with the old interface from
> the new ATF version that supports a different interface.
>=20
> To avoid this kind of issues we typically expect that all relevant
> communities agree on the public interfaces before upstreaming the code.

That's sound reasonable.
I'll contact with AT-F maintainers. Maybe I'll be able to upstream SCMI
to AT-F.
Also I hope I'll be able to contact Linux kernel SCMI maintainers and
discuss device-tree structure.

Best regards,
Oleksii=

