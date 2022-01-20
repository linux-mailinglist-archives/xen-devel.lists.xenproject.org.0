Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A419494B9A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 11:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259016.446664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUdG-00048c-C9; Thu, 20 Jan 2022 10:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259016.446664; Thu, 20 Jan 2022 10:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUdG-00046K-8z; Thu, 20 Jan 2022 10:25:30 +0000
Received: by outflank-mailman (input) for mailman id 259016;
 Thu, 20 Jan 2022 10:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqpm=SE=epam.com=prvs=3019806f6f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nAUdE-00046E-9Y
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 10:25:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b2a979-79db-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 11:25:26 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KA0hTK015143;
 Thu, 20 Jan 2022 10:25:21 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dpxy7h36e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 10:25:21 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM5PR03MB3041.eurprd03.prod.outlook.com (2603:10a6:206:17::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 20 Jan
 2022 10:25:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 10:25:17 +0000
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
X-Inumbo-ID: 47b2a979-79db-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO0mlRJtvKTG4UFnMD8mesYQpgZD3hEIc+FSlkUisd695m66fGmWvnsrX9ChZ/cI5h5La5IMBbnqKyyBko9SPZXXZHpE9G5iks9rR78gUKsNE5aBug3IMJVoGxYD0mHwv7L2Hi9m6j+LxWJWGE9ddEvE+FaXcw72ymM9sqN/O3K6fw/+E/CZ/bJKdqBYmx0xyGCvkBZ1BkLJCi+g7yuQfsSUoZBjQtv3SU7Zot5EM8tEpOuqDsKfqgrXOcsxCa9J5nqtiHXpjOQCI3Zh2rpQXVt0ZuLaFwXkTc2lgav23S4p/lrko3GRuvKzkS1fIxWfP5KQRMXx28FTX6CwYPrvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhLNhiSU1aVebUVKe98g2OAl40IQJdfNuti5nr/SUEc=;
 b=Lx3xqudQDlxEZI+CPyvl2o/jy0M0rN+Mq0RmDa8FaIhgHUZEIJv4pXuy6EElIfvY2yh09gDeGapoHNQgtUUWZnguFx4a1C0Ex4Jjou+LF2LCU6VAcSq2H304iWSoCkXEufIJ1Ry/isTIv03mPARa55tFlcy4ajtVGvBNInlIwKs7eO+Bacj4gcP3BCh2NYjEEwBQ/vBysRFstj6mI2AzQM/twcLV1nZQgkRU2eWMh0SebaYie4WlCOTdBdwSwtLcvgox5c6uFmnAhTog5E2fX+YsTR7KKwIoLcJo/O9MG3NDuGUnI4sUXNj+jyZnVfPl1qv7C6TrXW4ook7B5KE4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhLNhiSU1aVebUVKe98g2OAl40IQJdfNuti5nr/SUEc=;
 b=Q0xx8kUfwCYI7ces+vHd1YhAzJwVZh3bea9OVcKvTv8qyMvQTSnK1KLa7HR6iDxr+0Rn1dPpa4ZZZKt4M79o/IEfdU3TW3IQ6JR4JH9VAz4L/bpblv60nKP5IDgjjy85vzYtJdxifgbzI0pYfw4DA0TuiDPfhoYzp/PzBV3uHZxDlDZW55u+42szw4+ComxWrifRngn6ic9V0KOsm52KlNzBcj5C+1S89Dftd8o5kxBYd21o9a9/OENI17ixIkAmiIMhQpgE+uwj8fzPKfKReUOoCIqlatJK5JzMYFOb1tW0/Gf1V1B8SQFsLcfu7SgRhNdfat+WKT4a4fJ3V2wfrw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4CAD3d9gIAEwfEAgAACbgCAABxaAIAABdkAgBQS24CAAQTTAIAAiikA
Date: Thu, 20 Jan 2022 10:25:17 +0000
Message-ID: <20220120102516.GA4187695@EPUAKYIW015D>
References: <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
 <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
 <20220106135328.GA1413532@EPUAKYIW015D>
 <55954632-e2c7-5455-6538-29c7990c8f62@xen.org>
 <20220106154338.GA1460271@EPUAKYIW015D>
 <548d4954-96bf-6522-6cfc-98b4a0e02b51@xen.org>
 <20220119103715.GA3772829@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191755250.19362@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201191755250.19362@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd8b120d-2cfa-4182-4c63-08d9dbff276f
x-ms-traffictypediagnostic: AM5PR03MB3041:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM5PR03MB30415E023286D3428EB8454FE35A9@AM5PR03MB3041.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DmKtpiIn+gafVF6q2whm7VhInex+PSQQha08vyxbvLlJ8/a9CPTCWaVLaFF3QvmeIO9HEnh0QMZnMW2VStRb5Dr1jNYFVQDOPTCD4FtJKBHq5BvhHUX0dz3RF4YOL2sTxEIGqFEK+GfpgUk/++jN4QJqm6MlLM2qt/o/J2eJyfVAk49Qi0jMS6ZDA7/Tk919BEB2TgKkbifFC112EbT4V+gSm3bXTe/2ec4wfPWdK2ebXtlNZmu8e5IT57nCvehmxpEp+eWDN+QHuj2gxUhHRCrgFPtiofVf50VE1lgAFBv9g/sU3YQeXAcCtNPHbJBsJUZulyQKnSOP4hJJZdqOx7LxEuWukKTtFKIFRsTU7+tFKESNlxRytI4fQ9Qg/n7lvqhUrtoCJPGK7Jtc3/duN4CiNldohwkTXcLFR9kBtwt9lFFUNPxpzN9nNw8/WabSlAeUns3P2aWCEFCZruh4nn7P8hTwikmvQIj1NXRBiWfByzE7pdwQb0ck269rFwH60cPu9OFrT1GWRMExWSmgtlnvoIwMk4TDFChtNXfz0ZGB3n62FCT6l/vKocAZRzSaBX2/z0gdLqWZzkVscAYhj0chUxx3HODO+4eQ3jxKe0Zz5SdAEyLZg5rv/gW+KIgERFxTNbBAU0E687C4QdWknrbUh1corbzqLaSSPcZ83rEiJi5fxjbz+1KTN4yOeMFTj2b+Z+C7Wr0NcTpDgft/Gdz1BdpkptkqG/rBLTQIWdpHwx1EX3SjYviLXp8DCs54Qcxi4QdGMwub1faW5v8FDOzPXIwWIbU5yHmBpk1Xfzs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(53546011)(33656002)(71200400001)(6506007)(64756008)(6512007)(66446008)(5660300002)(26005)(122000001)(86362001)(316002)(83380400001)(54906003)(66476007)(4326008)(38070700005)(186003)(76116006)(33716001)(8936002)(66556008)(2906002)(8676002)(91956017)(9686003)(1076003)(6916009)(508600001)(66946007)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xqC4I4u9KXei3gSfhwmb6JOy64bX4XYM54tocPHERIPCHdvrKmUbeX6+nWBL?=
 =?us-ascii?Q?UqNj93iglVqj83fUtsfk7kzMRw3jlD8Yd3UXJf2ryJuyIV3GKCoaSzd473fS?=
 =?us-ascii?Q?M6cVPk0LbQpUrrDifv+2ktz6A0IG1GOfgXimAeTjUK8h4hHt5+X5wAenUD7x?=
 =?us-ascii?Q?k44+4u0bhjNdHUvn77ZNEqBmqRH+HII3Uc8TjGI1y94C4b03qhgDDSWQRHM/?=
 =?us-ascii?Q?KdVszqm6j4RO231NtsnXIKSNyFgs8aGM9EOcjCVYTp1G4G1LkrdrTfV2Oi74?=
 =?us-ascii?Q?pSBbkW+VkbRkcpel4L2ZW1ARCNTXNZ90T/uqpYPUI0nOnc2pGn3CAWF2DEB1?=
 =?us-ascii?Q?Nag83StnfOj3mD8YiCwnfoQPTDjVZB20AzAGlnGUCdzQn1jab2+l8FvgQ0HE?=
 =?us-ascii?Q?yW5p6i+OJUjn29T8igHqqmHqFo5qnbOXYaU5HCAjnpdeZ/lCQRlSFEhG7B0i?=
 =?us-ascii?Q?yfAhqKNpyioo4wBV7j7TZb54ZsVr4uWD48ITgnGw66LDQwNntUPZYtzipMLJ?=
 =?us-ascii?Q?nLuy2z9vfIkQbP9xLkiOSgHnWaKUjSpFG2Una8SrbnzageWfe5YXl0KfI0cZ?=
 =?us-ascii?Q?Uo6yJeZgnQOLWKh1LsLcrjkr48rKofDZ058uuHN3+tpn/w9eYmXnJW+9GEEe?=
 =?us-ascii?Q?oMVFG34NntuOwzrWuEMsSdLMSJ7nnwdwAFkR/adtRu1p2hKFgEO5wmINXAEG?=
 =?us-ascii?Q?9NxH0oYjn6BEG7/3ioyL/CoJvp80ImoIFpADp1D5s9+JY7ysvMfcRwX3A4Db?=
 =?us-ascii?Q?pkK61Y+0eGIQp5BzfwDwYCOoYN+QGcCaJbClAXZPKNNIHYxOsaOi9ArPRjIF?=
 =?us-ascii?Q?RzbkApZ5lBCNoVNxrCjLhuHccCIjVMJhx2rq+HMl/z7PCgtI4VfDmA0ugqnt?=
 =?us-ascii?Q?yRM47GBPCBguNWv2lxzqAXUURLa0rNPQCdl2LWS7PaGD2M765hXnO/XWVa2T?=
 =?us-ascii?Q?n7RNrElZdke2DcnlPn1ADxr2htJAtdCMsCTRM91B6Xj81wIv5cok8s/6F8Dh?=
 =?us-ascii?Q?EIOvFOgpDUriDxuv5xNneUmajAryyHwwM5pHAnRhCLtikOvEsp1ajVg/eB8C?=
 =?us-ascii?Q?nuXxgEBiCx1Hx2ASkbw5+mEbg9Te4i4Jq8V733KV6LhSOqg1moR7+zsbvncC?=
 =?us-ascii?Q?CBVHLx8ORwe+7OR8MZJ6PplPQDBgEJpJBI10xKoajTxQx0atjWHLomXcFkYT?=
 =?us-ascii?Q?88SqnOK/LQal2mLG/eycNfTtDydB2h6a9RrxDgwOfAICGe8PJSDn2uBWsjBT?=
 =?us-ascii?Q?wot0HdUEsWtMjrjxAXwJhOQd5ckg7y31JZoDNmiqcb/E79QrkHdzrcfFasGs?=
 =?us-ascii?Q?yq/oeFBjlp1RmOQf2FvbhCwXwurjXWqxXXDfM70JUvS8Y3DZ1WAbjJmX3q5D?=
 =?us-ascii?Q?LhD+a7sANxeBCNleyHN10Zwrmb41PbCrPIxVgd/0zAzqeEHbBpBDrR04Oxuk?=
 =?us-ascii?Q?R8+GQTLmWvnjmCfAxayWP7/TZM7KG2wNKxC0VH+fYeLKJtQW8brMAVWewt23?=
 =?us-ascii?Q?c3yLVc21st5A12XLpFY90MD5Vqt2s4sqS2W046+0FcZ5TzArzfrkou7vwGtH?=
 =?us-ascii?Q?RQP8IJV8RJp75jSJa8b/WIZ49I02646nyTKzOwvfMBIPGmAR6mlf7shLEcqO?=
 =?us-ascii?Q?hzc37XdEIrHKPJGdEKXA6rpU2N3Dqm1agdKkz5OU+q62RGPMFPkRK1YyWZTb?=
 =?us-ascii?Q?nCqtlc95LKrUUSpWGqR15TQTfbE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E5699F484ED2D4E8810766159E9530B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8b120d-2cfa-4182-4c63-08d9dbff276f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:25:17.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bruTYPrQjo2ZvMNFivpiepTp6ERhzxF460FnQ1tUdUS8+s1OlrsdD6PYxGtQNGz9fVah2B11YgBda3vjJSPN/J/YOuHGXtwxWLEa+eAWuik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR03MB3041
X-Proofpoint-ORIG-GUID: ihTgqgVfVxE40HM8RwsbfPzaKn0OW8x2
X-Proofpoint-GUID: ihTgqgVfVxE40HM8RwsbfPzaKn0OW8x2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_03,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200051

On Wed, Jan 19, 2022 at 06:10:46PM -0800, Stefano Stabellini wrote:
> On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > On Thu, Jan 06, 2022 at 04:04:34PM +0000, Julien Grall wrote:
> > > On 06/01/2022 15:43, Oleksii Moisieiev wrote:
> > > > On Thu, Jan 06, 2022 at 02:02:10PM +0000, Julien Grall wrote:
> > > > > On 06/01/2022 13:53, Oleksii Moisieiev wrote:
> > > > > > Hi Julien,
> > > > > >=20
> > > > > > On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> > > > > > > > On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrot=
e:
> > > > > > > > > On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > > > > > > > > > >       2) What are the expected memory attribute for t=
he regions?
> > > > > > > > > >=20
> > > > > > > > > > xen uses iommu_permit_access to pass agent page to the =
guest. So guest can access the page directly.
> > > > > > > > >=20
> > > > > > > > > I think you misunderstood my comment. Memory can be mappe=
d with various type
> > > > > > > > > (e.g. Device, Memory) and attribute (cacheable, non-cache=
able...). What will
> > > > > > > > > the firmware expect? What will the guest OS usually?
> > > > > > > > >=20
> > > > > > > > > The reason I am asking is the attributes have to matched =
to avoid any
> > > > > > > > > coherency issues. At the moment, if you use XEN_DOMCTL_me=
mory_mapping, Xen
> > > > > > > > > will configure the stage-2 to use Device nGnRnE. As the r=
esult, the result
> > > > > > > > > memory access will be Device nGnRnE which is very strict.
> > > > > > > > > :w
> > > > > > > >=20
> > > > > > > > Let me share with you the configuration example:
> > > > > > > > scmi expects memory to be configured in the device-tree:
> > > > > > > >=20
> > > > > > > > cpu_scp_shm: scp-shmem@0xXXXXXXX {
> > > > > > > > 	compatible =3D "arm,scmi-shmem";
> > > > > > > > 	reg =3D <0x0 0xXXXXXX 0x0 0x1000>;
> > > > > > > > };
> > > > > > > >=20
> > > > > > > > where XXXXXX address I allocate in alloc_magic_pages functi=
on.
> > > > > > >=20
> > > > > > > The goal of alloc_magic_pages() is to allocate RAM. However, =
what you want
> > > > > > > is a guest physical address and then map a part of the shared=
 page.
> > > > > >=20
> > > > > > Do you mean that I can't use alloc_magic_pages to allocate shar=
ed
> > > > > > memory region for SCMI?
> > > > > Correct. alloc_magic_pages() will allocate a RAM page and then as=
sign to the
> > > > > guest. From your description, this is not what you want because y=
ou will
> > > > > call XEN_DOMCTL_memory_mapping (and therefore replace the mapping=
).
> > > > >=20
> > > >=20
> > > > Ok thanks, I will refactor this part in v2.
> > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > I can see two options here:
> > > > > > >     1) Hardcode the SCMI region in the memory map
> > > > > > >     2) Create a new region in the memory map that can be used=
 for reserving
> > > > > > > memory for mapping.
> > > > > >=20
> > > > > > Could you please explain what do you mean under the "new region=
 in the
> > > > > > memory map"?
> > > > >=20
> > > > > I mean reserving some guest physical address that could be used f=
or map host
> > > > > physical address (e.g. SCMI region, GIC CPU interface...).
> > > > >=20
> > > > > So rather than hardcoding the address, we have something more fle=
xible.
> > > > >=20
> > > >=20
> > > > Ok, I will fix that in v2.
> > >=20
> > > Just for avoidance of doubt. I was clarify option 2 and not requestin=
g to
> > > implement. That said, if you want to implement option 2 I would be ha=
ppy to
> > > review it.
> > >=20
> >=20
> > I'm thinking about the best way to reserve address for the domain.
> > We have xen_pfn_t shared_info_pfn in struct xc_dom_image which is not
> > used for Arm architecture. It can be set from shared_info_arm callback,
> > defined in xg_dom_arm.c.
> > I can use shared_info to store address of the SCMI and then use map_sci=
_page to
> > call XEN_DOMCTL_memory_mapping.
> >=20
> > This will allow me to reuse existing functionality and do not allocate
> > extra RAM.
> >=20
> > What do you think about that?
>=20
> I cannot speak for Julien but I think he meant something else (Julien
> please correct me if I am wrong.) Exposing addresses via device tree is
> not a problem.
>=20
> Normally we pick a fixed address for guest resources, for instance
> GUEST_GICD_BASE, see xen/include/public/arch-arm.h. We could do that for
> SCMI as well and it is basically approach 1).
>=20
> However, it is a bit inflexible and could cause issues with things like
> direct-map (https://urldefense.com/v3/__https://marc.info/?l=3Dxen-devel&=
m=3D163997768108997__;!!GF_29dbcQIUBPA!kvNsu9pjqIwZ42N2q6aSQhTT_zA3OCEDkr7D=
wmAiuldEMwj2UiFReaPI8XlxsG-HOZ6v$ [marc[.]info]). A more
> flexible way would be for the SCMI guest address to be dynamically
> generated somehow.
>=20
> I am not sure how Julien envisioned the address to be generated exactly.
>=20
> Thanks to Oleksandr's work we have a way to find large regions of "free"
> address space. It is currently used for grant-table mappings. Maybe we
> could use a subset of it for SCMI? It might be best to wait for Julien's
> answer as he might have a better idea.

Thank you for the answer.
I think it will be best to reserve some space and generate address for
SMCI. Hope Julien will advise how it can be done.=20


