Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB04F4866A1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254102.435630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UYA-0000c2-13; Thu, 06 Jan 2022 15:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254102.435630; Thu, 06 Jan 2022 15:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UY9-0000Z4-Tj; Thu, 06 Jan 2022 15:19:33 +0000
Received: by outflank-mailman (input) for mailman id 254102;
 Thu, 06 Jan 2022 15:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+KX=RW=epam.com=prvs=30058094e3=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n5UY8-0000Yy-Io
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:19:32 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa2cc9d-6f04-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 16:19:30 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206DmPcG010268;
 Thu, 6 Jan 2022 15:19:26 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ddr8whhfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 15:19:26 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6767.eurprd03.prod.outlook.com (2603:10a6:102:e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 15:19:23 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 15:19:23 +0000
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
X-Inumbo-ID: 0aa2cc9d-6f04-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyvuZnD5cCXvshdavPspi+JTu1Yahtc0FIH9fEU1vc7+41PLaUccyuXOkekRoTEPq1RA4fbUWIxplZ9HeV6NFG3sAcC9J7+6NGkmVNJYIH5IkXob1zzx/IvJ+whG1s0wFAcZDdnCTg/njGnhnqV31IYsTnPH5WmeMsu3cFIzHX3yCd0Lnbr6EhGHoQeNzPkJbS4nsM7pa71zBEZ+5BV9eJh6Okalzgwb4Gf5K5orud7niRCVmCrWL8Q4bgJbG86QFgfakPobqYKk/sWR0YiJ42JTk5KS/wlICptk8GfZ2XBzrMRtvWuybcifzGJKHECzKHGECuS8os1W4yx/mhIAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUSeFxG9j2RjbRhyr/Mz2Hx+yawNICPVAj5uR9bde+U=;
 b=UICyxjk5o24J72gAAK1wAAR8qtxy0WjgKkmoyNdvVcPrnMjoSy7Qo1ZeLMQ6/DTreewRwwteAohK6C5Hz3797Un0Zxu4nxp4FmtHxwQuzMryY8f8jhP4WItFRo04dl8gOEuqubyaQ+4Np87yWMv5Lff+u9xBTIWWy3t1CmBGDlVr9Am72dubagOoLTxdeOnsE2rI9XuqJAsmqM/KBEiuJZf6z9ZZ96umvTGj9uhrPVpKKRtU5mUTC1B64iioMe6mb3q6xzjGNMnjjQYq1nnIqypIikjQZ2j4OtzoSsr5LQ8bLTBzqx9mC/ICub1myxb0EzL9DDWlHqD8P49i6huWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUSeFxG9j2RjbRhyr/Mz2Hx+yawNICPVAj5uR9bde+U=;
 b=kv+Q16V/phsmh9upyCa9BhhQHfX/xqKYgeXestL3Dk38bqxfwOPDyS1Tq+hdFpwyblafMXHcSzvpOszwhBoeJiWFM3IPeHZYD2tHkqptRNv85CQODg9WqiPRZlJ1dbwfSVOCbCMicICXBhcuzaU3O5Wfho7qzQSdsVaQNEgsYrxZQSYREkJXNantdJyhbEQ0X6Cjstc6Fk8mafwyMB/Tj1RiVKpwfkxHs0bwj6FLcfB2NbPpHBze+RIfcPx2ZHvpt1Ch6oxaHuKCnutZzBbqIHc2tIdnBCu5nsV1cGvsQPbTCA3DL5EbyTkAKkWc7d+zqRXiNM/GYonmDOc2yGnNfQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgAEYTICAAFamgIAA3WqAgAAIW4CAAAhUAIAAJymAgA+OgICABMa8gA==
Date: Thu, 6 Jan 2022 15:19:23 +0000
Message-ID: <20220106151921.GA1440956@EPUAKYIW015D>
References: 
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
 <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
 <20211224135819.GA945512@EPUAKYIW015D>
 <4bb8ee4f-8e8b-5e85-0801-ae3df93dbabc@xen.org>
 <20211224164905.GA1016129@EPUAKYIW015D>
 <d5e8a800-5a28-ce9e-cf2a-82894aae2149@xen.org>
In-Reply-To: <d5e8a800-5a28-ce9e-cf2a-82894aae2149@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 594f1de6-5b5f-486c-8439-08d9d127eb55
x-ms-traffictypediagnostic: PA4PR03MB6767:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB67676838D267193210482671E34C9@PA4PR03MB6767.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wGE7oy0BXWO1Og0FNnBGcNLBZX9erUIbm8bhge2ZqQZ03w4figmYwxD0yLDF7FhHnFKt/zxTZaIYzqHpsh5NMpaf/nOo1z5ZGwrEyJ4R8hCGLDxRjCo594BbYPx7Okcu7kImLCarlMiDbc1rYy2M/1Q28UhBP1/H7ej9GQq497s9fmkdehkvLQdus6ik13esxn6iVRk/D8hqB+ObeeDF7CfsZtyL6SlnmJ9fabINur6+Re8WHZ5Wb3JIjV5jHFmAQTt+Jx1QFvqeDt84rzrtH+jTYVPXokfCBwzmYpZfK38EtOneBEVc1jgmgH+4ap50P0y69NeIw0hnsmX/sBZPxQr9q35HK+4tmXOHZKqiSxr+12HviGNb2OtJa1ZggAt95VT2+x7siycjLhLjhRRvRv+fO0qidZOYEkRHKvGsaCGRrlH+cu7NHW/2KrY51dJ+TzDtkaSDFghEG1kABsTJqwYNzUJtfxMul5EE6qqvvY/eNnRPv+EWk6JoosVPd8vgYc0eCicVPbk6yRe68S2e1IaAx4AL8PCGPT8q++GHKDYO8zm1XH3wjtPjUwZlHOlDQSRk91ZANMBe8cOQhNPX8UeB5a2f0AZW+F5F/zXaMrkiOWySw7apCb0xgFznP0TxV6MlfZ22luEpfQRva4Mtaq4FCOhQsY9f7Q9RiLC3QEHxgcGSVSbJRiqmiiQNp8voWL8i282LDa1BqPaTlHfzZtpHaBgqERkxdzT73SJq+6k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(4326008)(186003)(53546011)(6506007)(9686003)(71200400001)(6512007)(2906002)(38070700005)(66556008)(33656002)(316002)(6486002)(508600001)(33716001)(26005)(1076003)(54906003)(6916009)(8676002)(8936002)(66446008)(83380400001)(5660300002)(38100700002)(91956017)(76116006)(66946007)(64756008)(66476007)(122000001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?l4SRDyMwN8iJ/+iTXmD5FFk+xbkhzsYXQ4kSuJlk4pOyBTGtr53eiCXfSh6S?=
 =?us-ascii?Q?u0Y4RwMfebmAXrSemJED9jWhVR1NFFSKlSi+GVWlNvcbgfmD0udAAqx3cQYX?=
 =?us-ascii?Q?Nt5js8vGEYaFFM5+jeioT+DSSSNaYUPNwOeAGw9YyGzUu1dOg7H9D83IA0Hz?=
 =?us-ascii?Q?rupZIeH06PRJIc54fQLcRtZfiiAzJLzB6KCa13dO9h9L6NFJDUWY4WgbSwQh?=
 =?us-ascii?Q?PsUHDtT1iLj3MMxKzzm7V1tYioAz4DeDvLbj4QApJ6UJJbX8f5SNMfssf0vL?=
 =?us-ascii?Q?0fJJYrJda5FxYIG84aF3kMA2mnQqLaGooFXttTQEHHs+sJXEZHpH0g0FTE/d?=
 =?us-ascii?Q?QjuDCmbYZNaTLuAdcUhL1/YLdYPM5/XplYy2V8Q7cDIH9eQOZxgSCC/trmuc?=
 =?us-ascii?Q?xsLv3SNQ1H+PWezggRvKL/TyD41AOyTvUqhUM3I+ufdjhe9nuAhiOy4NwhcK?=
 =?us-ascii?Q?S25vLId5s3mpYvgWeJt4fV5npi4gLx8g7ZNTRaGIeipNM2UE5y9UrhFV+GJ0?=
 =?us-ascii?Q?wnc4qeb/yoqjT+Nonc9bUM/aeQFtQwlit1Ko5qBXSNsF+el65ACeEU4dUVk5?=
 =?us-ascii?Q?QHHyARozhxS3OO8pg7z+oP7lRCRk5w44bG67EBh6omXPC8jRlkZCw7WX8Qy6?=
 =?us-ascii?Q?nwEZ5z1BUvhrQfkPKlPV/oF3nCc5ZexhQnxSskUszy6VpAarTiI00mUz5hLZ?=
 =?us-ascii?Q?X/rDUkrzLmz+Xd5X+MO1lkPBgvMnC5zjjRlqu8SwoO73fM6NITb5CHOL98L9?=
 =?us-ascii?Q?zw6clN8XYHer4rB400RSSkjKlIEdBUjawMv4fp5chdfTXBem8qpyAstjcSv/?=
 =?us-ascii?Q?OqAFRaxu/GAu8njTmGUUZXMdVwoTfExSVVeEmRdwF5UKrPamBQHc5+27wKJB?=
 =?us-ascii?Q?kEghT7XaVNQDcO32EQcVNi8t2oXI4Z6yjST/V5vjUdfV2PAkYnn6RIVYukbz?=
 =?us-ascii?Q?vZ9+TXl+E9fjRkkVIwtOWNzsjEYQskqHsqSZsgqVACZLjYAifjMrmwYczElb?=
 =?us-ascii?Q?3GphQ8yujjJdl7qxV3NvnYo9m5cEWjFEDRQCqbaQi8oqfZNexmEdLGpdwHS2?=
 =?us-ascii?Q?eCaoPLmgNGZRvegR1Kvwacbsjge1WddVfbbnzQ6NOzbTtN/cJdfflex8W7CP?=
 =?us-ascii?Q?rPLQnP8JQe8cvedXidMGq9SCzg0NYGizxTxs8qSY/QhNSuY7scwK7cWslIBj?=
 =?us-ascii?Q?Ujhdt+X9ltPW+3SY3w9ML6RpWPyLUOOyysFoILUwiaqg79cwG6pLyQYFaduJ?=
 =?us-ascii?Q?E7mCP51GiIefmVA6HUnskGLZs3meCmu8+LWmqFqbmRFUUEXU60EDVn5HWcM0?=
 =?us-ascii?Q?IZkm3J5H8eymSP1IXXLMeT2T7jmF88TBp2kwTR2T51tYVZTGiv5UqlLUFaJr?=
 =?us-ascii?Q?iSrRoaLZywWdimLJJaaIZUNo3SzDXQoJmiMu8Eg7gbJL7VHclRRSwlW1ulc9?=
 =?us-ascii?Q?A/ryiLYXEdOwH1+gFBiiwsbi4g9AR15hLTWO6jgXOcbELygbaW2ZmFGzkMAP?=
 =?us-ascii?Q?8bai69gjACwROH9BseIht7bEJVAMFrgwrqmZbqkOxbzDn9Q/PFNseybsBl04?=
 =?us-ascii?Q?S7CShzDIYpiKlKLZkOzFH++MPJRgqzQscdw5RS1MViOOicHzonQxWtXgH3Kk?=
 =?us-ascii?Q?0UIk5PuLbimSbI309/zHgwo4XB6P6GNlZWOgONxg6FMmXAZoq14NDeYenCnF?=
 =?us-ascii?Q?uWCKBK/YBa5T3xXkvYd7KZ1sPGY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51D16B2E2472954E9B549450E80F8245@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594f1de6-5b5f-486c-8439-08d9d127eb55
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 15:19:23.0878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a74PaBrT0IfZxw9p+93G5I8ehc9saP/ADXp8kdLUmYWdTU6I7qHu9hGscbXYIKSC41b2bYgf4bLpLTrHIn4rYJ1wPcsnmsVEBfsraGYysow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6767
X-Proofpoint-GUID: HBZWmCDOUudf1RNFHhf-8oSVZr5Um6kE
X-Proofpoint-ORIG-GUID: HBZWmCDOUudf1RNFHhf-8oSVZr5Um6kE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_06,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=883 phishscore=0 clxscore=1015 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2112160000 definitions=main-2201060107

On Mon, Jan 03, 2022 at 02:23:01PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 24/12/2021 16:49, Oleksii Moisieiev wrote:
> > On Fri, Dec 24, 2021 at 03:28:56PM +0100, Julien Grall wrote:
> > > On 24/12/2021 14:59, Oleksii Moisieiev wrote:
> > > > Hi Julien,
> > >=20
> > > Hello,
> > >=20
> > > > On Fri, Dec 24, 2021 at 02:29:13PM +0100, Julien Grall wrote:
> > > > > Hi,
> > > > >=20
> > > > > On 24/12/2021 01:16, Stefano Stabellini wrote:
> > > > > > > One more question: As you probably seen - Jan had a complains=
 about SCI
> > > > > > > term. He said SCI is ambiguous with ACPI's System
> > > > > > > Control Interrupt.
> > > > > >=20
> > > > > > I see his point. As a term I see "SCMI" often and sometimes "SC=
PI" but
> > > > > > "SCI" is the first time I saw it with this patch series.
> > > > > >=20
> > > > > >=20
> > > > > > > I think of using SC (as System Control) instead. What do you =
think
> > > > > > > about it?
> > > > > >=20
> > > > > > Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC=
" alone
> > > > > > doesn't give me enough context to guess what it is.
> > > > >=20
> > > > > I might be missing some context. Why are naming everything SCI ra=
ther than
> > > > > SMCI?
> > > >=20
> > > > Because we're expecting other interfaces and transport to be
> > > > implemented, such as for example:
> > > > scmi_mailbox, scpi_smc, scpi_mailbox, ti_sci_smc etc.
> > >=20
> > > Oh, now that explain why there is a layer of indirection in Xen. It w=
asn't
> > > very clear from the cover letter why it was present.
> > >=20
> > Please see below.
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > Or we could broaden the scope and call it "firmware_interface"?
> > > > > How would this be used? Will it be a list of interface that will =
be exposed
> > > > > to the guest?
> > > > >=20
> > > >=20
> > > > The idea is to set mediator type for each Domain, so for example Xe=
n can
> > > > use scmi_mailbox to communicate with SCP, Dom0 and DomD are also us=
ing
> > > > scmi_mailbox, but DomU using scmi_smc mediator because we have only=
 3
> > > > mailboxes in system. This is not implemented yet, right now, we are
> > > > introducing only scmi_smc support. In future, multiple mediator sup=
port
> > > > can be added to Xen.
> > >=20
> > > Ok. So will there be only one interface at the time for a given domai=
n. Is
> > > that correct?
> > >=20
> > Correct. The idea is that we provice only one interface to the Domain,
> > so different domains can use different protocols and transport
>=20
> I think this is similar to TEE mediator. Specifying in the guest
> configuration the TEE protocol (e.g. OP-TEE) allows to sanity check what =
the
> guest wants match the host. However, I am not convinced there is a need t=
o
> expose different protocols for domains running on the same platform.
>=20

Yes. You're right, I based on TEE mediator during implementation.
Please see below my thoughts about different protocols and transports.
> > Those
> > interfaces can be different than the interface Xen uses to connect to S=
CP.
>=20
> I can understand how this looks appealing. However, it may not always be
> possible to convert the guest protocol to the host protocol. And even if =
it
> is possible, it is increasing the complexity and risk.
>=20
> > This allows us to vary the configuration.
> > So for example:
> > Let's take system, that support only 2 mailboxes and communication with
> > SCP can use only mailboxes as transport. We intent to use scmi protocol
> > to manage HW. In this case we use 2 mailboxes for Xen-> SCP
> > communication, and for Dom0 -> Xen.
> > Domu can be configured to use
> > scmi_smc, so the communication should be the following:
> > DomU --smc--> Xen -mailbox--> SCP Firmware.
> > Let's say we want to add DomainX with OS XXX, which using yyy protocol
> > with zzz transport. Then we can configure DomX wuth yyy_zzz mediator, s=
o
> > the communication will be the following:
> > DomX --yyy--> Xen -mailbox--> SCP Firmware
>=20
> I am a bit confused with your example here. From my understanding, I woul=
d
> say 'smc' is the transport. But in your example above, you suggest this i=
s
> the protocol. What did I miss?

Sorry, that's my fault. I merged 2 exapmles in 1, in which the first exampl=
e
shows different transports and the second one shows different protocols.

The first expample describes the use-case when we have firmware, using
mailboxes as transport, but the system we have has number of Domains >
than number of the mailboxes.
Let's say Firmware and all Domains are using scmi protocol.
In this case I see 2 possible configurations:

1) Firmware and some Domains are using mailbox as transport, other
Domains, when all mailboxes are occupied, are using smc as transport.
Xen will be responsible to receive smc message and send request to
Firmware using mailbox and vice versa.

2) Firmware using mailbox to communicate with Xen, all Domains are using
smc. In this case only one mailbox will be used.

Number 2 looks better from my standpoint. In that case we have scmi_smc
mediator, which exposes smc transport to domains and uses mailbox to
communicate with Firmware.

The second part is that we can change protocol when it's simple and
safe. But now I see that this is not a good Idea to make Xen responsible
for protocol converting.

>=20
> > Where Xen knows how to convert message from yyy protocol to scmi protoc=
ol
>=20
> As I wrote above, when possible, converting protocol could be complex and
> risky. So do you have a concrete use case for that?
>=20
> That said, changing the transport (e.g. smc <-> mailbox) would make more
> sense to me.
>=20

I think you're right.

> >=20
> > I considered the alternative way, when we can configure domain with
> > several mediators, so each Domain can be configured to use, for example=
,
> > scmi_smc for power-domains and scpi_smc for clocks and resets. But I
> > don't see real use-cases for this configuration.
>=20
> Do you mean a platform using both or exposing both to the guest?
>=20

Yes, that's the alternative way I see. Similar to linux kernel, where
you are allowed to use for example scmi for clocks and scpi for resets.
I don't see the real use-cases for this config, but Xen can follow Linux
kernel configuration approach and allow to register 2 mediators: one for
scmi_smc and one for scpi_smc.
In this case Domain configuration will look like this:
sci =3D [
    "scmi_smc",
    "scpi_smc",
    ];

So both scmi_smc and scpi_smc mediators are exposing protocols to the
domains and communicating with Firmware.
Current implementation supports only 1 mediator, but in future I think
we should consider the posibility of having several mediators.
Where each mediator has it's own channel (transport+protocol) to
Firmware and exposes transport+protocol to the guests.

> >=20
> > What do you think about that?
> So I am a bit unsure how "firmware_interface" would be specified. IMO, th=
e
> user should only specificy which interface the guest will use (e.g. SCMI =
via
> SMC) even if the host end up to use a different transport (e.g. SCMI via
> mailbox). IOW, the option would not tell how to convert it.
>=20
> Is it what you had in mind?
>=20

Yes. That's what I mean.
firmware_interface can be specified in xen Device-tree. Different SCI
mediators can be implemented and added to the device-tree. Each mediator ha=
s channel (protocol +
transports) to the Firmware and exposes protocol + transport to the guests.
Protocol to the Firmware should be the same as exposed protocol,
transport may differ and is implementation specific.


Best regards,
Oleksii.=

