Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB947EF5E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 15:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251389.432710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lDz-0000WS-Vh; Fri, 24 Dec 2021 14:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251389.432710; Fri, 24 Dec 2021 14:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lDz-0000U3-SN; Fri, 24 Dec 2021 14:07:11 +0000
Received: by outflank-mailman (input) for mailman id 251389;
 Fri, 24 Dec 2021 14:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uFu=RJ=epam.com=prvs=2992704931=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0lDz-0000Tx-8h
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 14:07:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7ef160f-64c2-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 15:07:09 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BODeqKH019858;
 Fri, 24 Dec 2021 14:07:05 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d5afjgvv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 14:07:05 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7422.eurprd03.prod.outlook.com (2603:10a6:102:108::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 14:07:01 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 14:07:01 +0000
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
X-Inumbo-ID: c7ef160f-64c2-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L49oTesLnmUtaH2ZG5k+BYqEC985CE8vdOwgHdhh0+8AKAK13/8HNQY6ho6c0X7Oq5puhvQL/QCL9r6ZWpp8Z4FDP26SoshKlP0syWl3StGWqRJ7ftAmxTIr08HoyRrDOdtIe32+4REWrYVXAikWuiK4Z5U8QqEEo3pL3rAemwivYVEQDIMdw0Qo7YCj9fYpA1GTBCY2dM/t6pKR+4D4cnrmD9CVZ/y04q1PVFHgqc0O+CFA2CQ0AnKbJkpIPWkASKcDDEF9YUdPpCAII6N5xgCVAO8cpeiIiJ9HXdffIxSSa1QGXSy9EqpQGnCqiC/jQPl7Ywjic8urjOwr46oLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6oQ/DOqB82kiNlSAy3FlaSMHz0qdM7jINYAJcobIn0=;
 b=RqmPQ05Fy0fAWaxCb6PcTXZzFZHMeyLzKrKRZZz+m8Jt/BqKptcET/v1XzfdtZEBH4I1esumwNXKO90MAi8loeQhQHDoZvi6GWKaIM02HyJ1x7O+XFrIX0XM/ROgJPBnsXG+5fCkCCOAXPsy/YDO73qXt7kxORLV1rfsLp+wtTcETW0NuZjIK4HNngZZ3XwRnGPZnXFujYIazhPfBApk/4J6VAh+7bqPkz6DPFDE5Ja/rY5Po1ckCOTeF+szhRbq1Fv/HOFG3HxErBzSGCdqEp8qOh/U1lMXfMLco8yBdHB8R+OQKQ9wAdFynSQyY04WroRzzOr+NujpktQPT7BqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6oQ/DOqB82kiNlSAy3FlaSMHz0qdM7jINYAJcobIn0=;
 b=CEuDpEscIoq94AC2gxURV9XHPiTiqBt267qhHFgQvSfQJAqxuTn1S92FVOn7sHMKSlFLdkv36KvtN074h4/0ZAVyrAzn0Ay0Gc3/TPTKqKXnnCSFf7+g3Jri5YmuFTUH7Md+PHhCXChHStL5xhJLdVa6GPOLfpGa067+bjfNprcnaZlCcfmNEBwsVPpsfqC1ikyuX/KFeJfIvz02JUM4DSkatF2tDjf4IcdnFN6PhEPTjd8N0VRROsHXjX7RR8ODwXln9hGcaV68d5L9Mt1H8jn7xFWck2AAIaFHlBcyoWXSM6vJVNw6+PgP3vkh8mTXgy7UP2T8M1jWG1VuXd4p9w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgAEYTICAAFamgIAA5/qA
Date: Fri, 24 Dec 2021 14:07:01 +0000
Message-ID: <20211224140701.GA953282@EPUAKYIW015D>
References: 
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5781a05d-7515-4349-9dd2-08d9c6e6a862
x-ms-traffictypediagnostic: PA4PR03MB7422:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7422208AE22EB57C50B7884FE37F9@PA4PR03MB7422.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t8N4EeytOvcjmC6b/V7PhzELlW/TyyNP/NfqS++090gmESouKnc9JaDb19iQ8+kK+CooVA0Hk0to/PmA4XxDdF46lrsW3Ts8lfufFmxyMoo3Klqe3sPLhv9fbX27alVGI7yr7rngTg8Dh9CgmFatN765jXy9hLABqz9LT2h0kLgO8UGD+HwGQxJjvtPnzH80GIiefoxXEL8HKkeWaaVszs9W3Cif9myVIR+S+Znh5DE4GZ3mNTfGQ1i9eaYq0ctZ8wHFaU+35eU57iZ19WiquowhiVtrF2/nD0FMHYxQL3dg0JZFazzEVvC18Kk+WHdMLXokZMh1zufw3Uxh2ceJ0htrtyzRFk5n523tWiaxBZHj1CX8lvlgfDcQAFg2rIsx/IBR0qVMCcmX589Z6YWfEckU0IvqKTSkl8IoXQFHZAMhX8xT//+3C1xGfX5moupQe1ic3f8+gySX8Mqu+5V1P138UiRfvSdOfjfJqyHSfnXkYbG3TvI716e/8erL1EoVFdl+O8vN5I7hbm4Njj6uqE6xWrtX0xh4EingLomysJzp/5goLxBjOW8ZXLnR3YvHPlJtMq8s46iMgqoFZU5A/n5LZ6djv155W2wnjR1ApytT9/11S2W3HLxiZEVJ91GzrODI/xiNoxxJ9YXMgnbI/VTV8S53furConX5SLMoINZ2ETaZsDn/k1z+7dKWa2dLxBwi0Fkmvzh7Y4HVdtsLOXov0GOmQbi/tbT3TvFGoATiDmpWtYFbHelg5CM48utzLXjgQUzqkrxltC4Go78pYEuD3IhWrJDEF+tTzIJCCpt3qqFxXcEL6s+l//sngIyo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(76116006)(66556008)(30864003)(6916009)(508600001)(38070700005)(122000001)(26005)(38100700002)(86362001)(186003)(66946007)(66446008)(9686003)(6512007)(966005)(64756008)(71200400001)(5660300002)(91956017)(316002)(33656002)(6506007)(4326008)(2906002)(54906003)(6486002)(1076003)(8936002)(33716001)(83380400001)(8676002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MMxhKEw5GIEPsAr3klhxwv9fsMFGdCTF2xOTNz33YVtNMGmBCcE0sI7sX1xC?=
 =?us-ascii?Q?fhJtGSMnKNkWQXxbvfaC6MJ4wT0HmRN5Uy6ecx6mPZ2dq1QJjUyHb81bYK9v?=
 =?us-ascii?Q?43ZRMdOVWbvuHlTiIOi1UDmhhQj+FPfwwMxwR5/PXixaey+NitznNDv1DQf/?=
 =?us-ascii?Q?vo0ktGvveuKLmXg5ursu5m1HsIe46yxVx8YEs0g5hubP+zIUbpjG14vah8gs?=
 =?us-ascii?Q?1UHjhEzCI8kNrbG+6FabfXohQFIWMcb8s/VQ7ZBaIgwxKiPnFgE+chz1987y?=
 =?us-ascii?Q?n20CKstOK7yehZvFz7nD2pR37A1hc64X/vdlmWIbTExIcbyKlqpTbDfrnR7p?=
 =?us-ascii?Q?9yK9C+d3zzkzM4B5OtuE6DKZ1dlXVELk6OyxGjfoSznrdIzNCByBQg74bfW1?=
 =?us-ascii?Q?5fbcaXtcaOqUkXbvL+5Usr85xpJn2Ty/b5r7cgxdfGN6I6FY39PSVWQK1Y1W?=
 =?us-ascii?Q?3S4UsINtx/ed3+AIc1a9L2dZR3VAr4IiDK3jHvzIj0PNq1OynTA+b1j5ntwv?=
 =?us-ascii?Q?FdzmUkeL/a97M7NqifI6VlOgEHaFq57a8SPU51jhmndYhaCa2kQ2eehEhDZp?=
 =?us-ascii?Q?jJ6cEVw1s0ugqRU3QvvvqpdYsrPZt8/Nl0VbkOtHDcQ5hmYJVVsdrMiEnEQl?=
 =?us-ascii?Q?Fe7aDgE7PfbjfMGP5xxmZK/tdMNZBVfmkL1OTFtT16/JWuv7DMWzLZvJai6f?=
 =?us-ascii?Q?0qIPAYHP1/LS3e5lKtOsNZIy8it22mvUeWakj36DHi7ua+COZ+5IiPQw1Duz?=
 =?us-ascii?Q?glCPKsxGxqER9sAHIY7Q+vYw2ipTJYSSwCU65DdWa+xUW+xuiGpPdm23TDn3?=
 =?us-ascii?Q?cWZlyXIwf2BnYlVt+Qnu/zS0PEHGoSunkdOT8nGI9On2Gv6GURpCD00kmqZO?=
 =?us-ascii?Q?hBUVT4ttrGi1ZI7er5tHRxIzbJrbI4ahJXcGSwvyu5xsngbBlROYki8OyifM?=
 =?us-ascii?Q?P8yCQks8UNgC6k1nRzPY8mrOHYWlqBAvOAoDWcqqU5XjzzFTVW+jQ7fKCrPx?=
 =?us-ascii?Q?m1ilubpbeDCJTMW7HeI3SI0zMhO297Yx4TLaHKNwq2hpXzMPF9FHA/5Raldi?=
 =?us-ascii?Q?bVpHcc0S2FDHVsdaoIu3D90aaksKiTPzlMz4sc29vbFPrLfDfmu+pEML2bCC?=
 =?us-ascii?Q?wKKwtP6x2pCm4PPE0ev4HnHivHmJm+fwl/HJE+aRO9eJkB3GdpYE4R7wGsaF?=
 =?us-ascii?Q?8GMdr2MF+ODJ/+8O1sSsHWWgZvqBlPqUSH4++Qvl3RMLscxVr6NB5xkXJNYT?=
 =?us-ascii?Q?nQucgTA6JcKWSWlRWtIYi6rdWRWoTo4ARdmsZE5V7ELmhtNaOcv7Xxo0h1lQ?=
 =?us-ascii?Q?jxfDJcfuGm6+qkVZGTjKByr7aNfP0Pl3pzPS1D9zAMn+rk3UhIDoUps5Xkbr?=
 =?us-ascii?Q?NMlmYZMtjw2IIMiqZ+Ko3HdFuq93N1qOQJY1cuBJOrml8VGEhwPyxqVyitau?=
 =?us-ascii?Q?6tpbAtX8Ekesn4Pnh3D0OrCNIg7XFUmACKKs2cWF2Zw/LxWPM30/sPQnjo+y?=
 =?us-ascii?Q?0WeGFbjucPwjvI4dNvDfEBmWDlchfSdllCCPCGMaxgSt5QqO+zbnReyUgcTX?=
 =?us-ascii?Q?x1QGyaIiQ0BfJnTpsPUWNWOdJihLYY4SR0Hc3iqhQHi0TPBAdj1gI6wjilaA?=
 =?us-ascii?Q?9c9OSIl68i/gwAAAzkMKeTHOlClDNH30Siu7luI+7Bud9CdyxT9eggKeSIVd?=
 =?us-ascii?Q?Fd24cXtk9BoZuQxK+KmktqOHf5Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D5C8222F95EC541BECDFFBBA2545E18@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5781a05d-7515-4349-9dd2-08d9c6e6a862
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 14:07:01.8667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 267kcdbGc3KDgaWvfzQOWTQ9CkTv7iWrZ3KP+Cx9pIKaG5DmvyDZ2CJLq8TicwXJyvLMRySoM7foUqTBLPA/bqJZZME8P8oML0mYZY1QKhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7422
X-Proofpoint-GUID: 9arFuZA-jP6-di0MnsGTTTzYAeHTIMhf
X-Proofpoint-ORIG-GUID: 9arFuZA-jP6-di0MnsGTTTzYAeHTIMhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_05,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112240069

On Thu, Dec 23, 2021 at 04:16:45PM -0800, Stefano Stabellini wrote:
> On Thu, 23 Dec 2021, Oleksii Moisieiev wrote:
> > On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> > > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > Hi Stefano,
> > > > > >=20
> > > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wr=
ote:
> > > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > Hi Stefano,
> > > > > > > >=20
> > > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellin=
i wrote:
> > > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > This is the implementation of SCI interface, called SCM=
I-SMC driver,
> > > > > > > > > > which works as the mediator between XEN Domains and Fir=
mware (SCP, ATF etc).
> > > > > > > > > > This allows devices from the Domains to work with clock=
s, resets and
> > > > > > > > > > power-domains without access to CPG.
> > > > > > > > > >=20
> > > > > > > > > > The following features are implemented:
> > > > > > > > > > - request SCMI channels from ATF and pass channels to D=
omains;
> > > > > > > > > > - set device permissions for Domains based on the Domai=
n partial
> > > > > > > > > > device-tree. Devices with permissions are able to work =
with clocks,
> > > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epa=
m.com>
> > > > > > > > > > ---
> > > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++=
++++++++++++++++
> > > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > >=20
> > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfi=
g
> > > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > > >  	  support. It allows guests to control system resourc=
ess via one of
> > > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > > > =20
> > > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > > +
> > > > > > > > > >  endmenu
> > > > > > > > > > =20
> > > > > > > > > >  menu "ARM errata workaround via the alternative framew=
ork"
> > > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sc=
i/Kconfig
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > > +config SCMI_SMC
> > > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > > +	default n
> > > > > > > > > > +	depends on SCI
> > > > > > > > > > +	---help---
> > > > > > > > > > +
> > > > > > > > > > +	Enables mediator in XEN to pass SCMI requests from Do=
mains to ATF.
> > > > > > > > > > +	This feature allows drivers from Domains to work with=
 System
> > > > > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is=
 used as transport
> > > > > > > > > > +	for communication.
> > > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/s=
ci/Makefile
> > > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > > >  obj-y +=3D sci.o
> > > > > > > > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm=
/sci/scmi_smc.c
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > > +/*
> > > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > + *
> > > > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > > > + *
> > > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > > + *
> > > > > > > > > > + * This program is free software; you can redistribute=
 it and/or modify
> > > > > > > > > > + * it under the terms of the GNU General Public Licens=
e as published by
> > > > > > > > > > + * the Free Software Foundation; either version 2 of t=
he License, or
> > > > > > > > > > + * (at your option) any later version.
> > > > > > > > > > + *
> > > > > > > > > > + * This program is distributed in the hope that it wil=
l be useful,
> > > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied =
warranty of
> > > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.  See the
> > > > > > > > > > + * GNU General Public License for more details.
> > > > > > > > > > + */
> > > > > > > > > > +
> > > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > > +#include <asm/io.h>
> > > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > > +#include <xen/config.h>
> > > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > > +#include <xen/init.h>
> > > > > > > > > > +#include <xen/err.h>
> > > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > > +#include <xen/list.h>
> > > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > > +#include <xen/string.h>
> > > > > > > > > > +#include <xen/time.h>
> > > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > > +
> > > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > > > +
> > > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (=
DEN0056C) */
> > > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > > +
> > > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scm=
i-smc")
> > > > > > > > > > +
> > > > > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id=
"
> > > > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi=
_mem"
> > > > > > > > >=20
> > > > > > > > > I could find the following SCMI binding in Linux, which d=
escribes
> > > > > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > > > >=20
> > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > > > >=20
> > > > > > > > > However, linux,scmi_mem is not described. Aren't you supp=
osed to read
> > > > > > > > > the "shmem" property instead? And the compatible string u=
sed for this
> > > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > We use linux,scmi_mem node to reserve memory, needed for al=
l
> > > > > > > > channels:
> > > > > > > >=20
> > > > > > > > reserved-memory {
> > > > > > > >     /* reserved region for scmi channels*/
> > > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > > >         no-map;
> > > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > >     };
> > > > > > > > };
> > > > > > > >=20
> > > > > > > > arm,scmi-shmem node used in shmem property defines only 1 p=
age needed to
> > > > > > > > the current scmi channel:
> > > > > > > >=20
> > > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > >     compatible =3D "arm,scmi-shmem";
> > > > > > > >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > };
> > > > > > > >=20
> > > > > > > > For each Domain reg points to unigue page from linux,scmi_m=
em region,
> > > > > > > > assigned to this agent.
> > > > > > >=20
> > > > > > > If we were to use "linux,scmi_mem" we would have to introduce=
 it as a
> > > > > > > compatible string, not as a node name, and it would need to b=
e described
> > > > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > > > >=20
> > > > > > > But from your description I don't think it is necessary. We c=
an just use
> > > > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > > > >=20
> > > > > > > reserved-memory {
> > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > >         compatible =3D "arm,scmi-shmem";
> > > > > > >         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > >     };
> > > > > > >     ...
> > > > > > >=20
> > > > > > > In other words, if all the individual channel pages are descr=
ibed as
> > > > > > > "arm,scmi-shmem", why do we also need a single larger region =
as
> > > > > > > "linux,scmi_mem"?
> > > > > > >=20
> > > > > >=20
> > > > > > That was my first implementation. But I've met a problem with
> > > > > > scmi driver in kernel. I don't remember the exact place, but I =
remember
> > > > > > there were some if, checking if memory weren't reserved.
> > > > > > That's why I ended up splitting nodes reserved memory region an=
d actual
> > > > > > shmem page.
> > > > > > For linux,scmi_mem node I took format from /reserved-memory/lin=
ux,lossy_decompress@54000000,
> > > > > > which has no compatible string and provides no-map property.
> > > > > > linux,scmi_shmem node is needed to prevent xen from allocating =
this
> > > > > > space for the domain.
> > > > > >=20
> > > > > > Very interesting question about should I introduce linux,scmi_m=
em node
> > > > > > and scmi_devid property to the
> > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > > > Those node and property are needed only for Xen and useless for
> > > > > > non-virtualized systems. I can add this node and property descr=
iption to
> > > > > > arm,scmi.yaml, but leave a note that this is Xen specific param=
s.
> > > > > > What do you think about it?
> > > > >=20
> > > > > Reply below
> > > > >=20
> > > > > [...]
> > > > > =20
> > > > >=20
> > > > > > > In general we can't use properties that are not part of the d=
evice tree
> > > > > > > spec, either https://urldefense.com/v3/__https://www.devicetr=
ee.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_Ch=
owYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/li=
nux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;=
!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7=
BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > >=20
> > > > > > > "linux,scmi_mem" is currently absent. Are you aware of any up=
streaming
> > > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > >=20
> > > > > > > If "linux,scmi_mem" is going upstream in Linux, then we could=
 use it.
> > > > > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere=
 under
> > > > > > > Documentation/devicetree/bindings (probably
> > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), th=
en we can
> > > > > > > work on the Xen code that makes use of it.
> > > > > > >=20
> > > > > > > Does it make sense?
> > > > > > >=20
> > > > > >=20
> > > > > > Yes I agree. I think linux,scmi_mem and scmi_devid should be up=
streamed.
> > > > > > I will add those properties to arm,scmi.yaml, mark them as rela=
ted to XEN and send patch.
> > > > >=20
> > > > > I didn't realize that linux,scmi_mem and scmi_devid are supposed =
to be
> > > > > Xen specific. In general, it would be best not to introduce Xen s=
pecific
> > > > > properties into generic bindings. It is a problem both from a
> > > > > specification perspective (because it has hard to handle Xen spec=
ific
> > > > > cases in fully generic bindings, especially as those bindings are
> > > > > maintained as part of the Linux kernel) and from a user perspecti=
ve
> > > > > (because now the user has to deal with a Xen-specific dtb, or has=
 to
> > > > > modify the host dtb to add Xen-specific information by hand.)
> > > > >=20
> > > > >=20
> > > > > Let me start from scmi_devid.  Why would scmi_devid be Xen-specif=
ic? It
> > > > > looks like a generic property that should be needed for the Linux=
 SCMI
> > > > > driver too. Why the Linux driver doesn't need it?
> > > > >=20
> > > >=20
> > > > scmi_devid used during domain build. It passed as input parameter f=
or SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > > On non-virtualized systems - there is no need of this call, because=
 OS
> > > > is the only one entity, running on the system.
> > >=20
> > > OK. Even if it is only required for virtualized systems, I think that
> > > scmi_devid is important enough that should be part of the upstream
> > > binding. I think it is worth starting an email thread on the LKML wit=
h
> > > Rob Herring and the SCMI maintainers to discuss the addition of
> > > scmi_devid to the binding.
> > >=20
> >=20
> > Ok I will start the thread about scmi_devid.
> > >=20
> > > > I've chatted with Volodymyr_Babchuk and he gave a great idea to add=
 a
> > > > list of device_ids to dom.cfg, such as:
> > > > sci_devs =3D [ 0, 1, 15, 35 ];
> > > >=20
> > > > Using this approach, we can remove scmi_devid from the device tree =
and
> > > > just pass a list of scmi_devids to XEN using additional hypercall.
> > > > We can probably make hypercall taking devid list as input parameter=
.
> > > > This will take only 1 hypercall to setup sci permissions.
> > >=20
> > > But how would a user know which are the right SCMI IDs to add to the
> > > sci_devs list? Would the user have to go and read the reference manua=
l
> > > of the platform to find the SCMI IDs and then write sci_devs by hand?
> > > If that is the case, then I think that it would be better to add
> > > scmi_devid to device tree.
> > >=20
> > > In general, I think this configuration should happen automatically
> > > without user intervention. The user should just specify "enable SCMI"
> > > and it should work.
> > >=20
> >=20
> > Ok. This sounds reasonable.
> >=20
> > >=20
> > > > > In regards to linux,scmi_mem, I think it would be best to do with=
out it
> > > > > and fix the Linux SCMI driver if we need to do so. Xen should be =
able to
> > > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) =
should
> > > > > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Eit=
her
> > > > > way, I don't think we should need linux,scmi_mem.
> > > >=20
> > > > This requires further investigation. I will try to make implementat=
ion
> > > > without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> > > > reuslts with you.
> > >=20
> > > OK, thanks.
> >=20
> > One more question: As you probably seen - Jan had a complains about SCI
> > term. He said SCI is ambiguous with ACPI's System
> > Control Interrupt.
>=20
> I see his point. As a term I see "SCMI" often and sometimes "SCPI" but
> "SCI" is the first time I saw it with this patch series.
>=20
>=20
> > I think of using SC (as System Control) instead. What do you think
> > about it?=20
>=20
> Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC" alone
> doesn't give me enough context to guess what it is.
>=20
> Or we could broaden the scope and call it "firmware_interface"?

ARM_SCI sounds good for me.

Best regards,
Oleksii.=

