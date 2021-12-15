Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCF475120
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 03:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247169.426167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKV5-0005Eu-WF; Wed, 15 Dec 2021 02:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247169.426167; Wed, 15 Dec 2021 02:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKV5-0005Bj-Sk; Wed, 15 Dec 2021 02:58:39 +0000
Received: by outflank-mailman (input) for mailman id 247169;
 Wed, 15 Dec 2021 02:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4EW=RA=epam.com=prvs=29836cc2ab=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mxKV4-0005Bd-5r
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 02:58:38 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4fda1f3-5d52-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 03:58:36 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEIor8b026032;
 Wed, 15 Dec 2021 02:58:26 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cxw3m9rf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 02:58:26 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB8013.eurprd03.prod.outlook.com (2603:10a6:102:21c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 02:58:23 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 02:58:23 +0000
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
X-Inumbo-ID: e4fda1f3-5d52-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY0BA2R54nd1d5nhqfuZH8Ep/9C48paxKlLjsT9T/q8q1ShoioU7t9tI8HxzpvJTwmhO3J7rlJKPPOnlJgX6JRQJKKc3T97ssbJ4vlAX3uzjM/D4Z0DjGJKa4zS7NHXxfOjsr03+Tt5j4ps54kdHxQRB6bFXpjEJGxpfrsy2nbUgdz7Sobl7394pzZ8ZXiuw+C+84y1CM09gkaG5ep5LcBs1ywcQGCPei2pnwqSZ0IFa/iSzqJjvQuzydhnwXlvx8gKhOug6HHHK+RmN4JZ3NW4WxMhNYa1EPQ4OtM9YmsgQgedUavJVKsPr7YdTJNzT/4XbTgNJHORhzncPBi4LmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMCT9bfFXwIARly75ze9eByLQlmhSeE6onxcSwbJ6BI=;
 b=R5H68UQzownuZPQXfjvxiJPMFcP5nN3uyEue/cc/l9MKp6EIRilQkONW8yQnWJeX2376NVRYTvywcKo2/+Y7OFa3A/PjSJtSQSL2URVvLOmrgGYTliI4uW8aIwnQRZh87g3y2Ag7S/3+PlNkURe8ibIsUsYElitwT+8dzebBRqEOWoqS+qt8LAHJfQkX83LIjeGZ8+la4nH6lRgikVt3skOlK44Gj0GdeyhBwVwwR5f9/OwuHVsGVdEjDy7YFkb4OAxWetCwkqEAmu7XQK4GznagGvyG0cM3frckdK3WqOEZjYCvQnWPTgiyApY6iWzdiFHCqgZFBVPPFzT11DpK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMCT9bfFXwIARly75ze9eByLQlmhSeE6onxcSwbJ6BI=;
 b=crFEFE4GmtaSd5/l7BWdChKINslrRGDLdkHL3+Iyr8PseBKmWRBKgZ4mM/jK5nyTzJpRFEF7xE+Res9mTM1s7OeWtlAJt2vWWPGc2nHv+FYsyl/uf8Q9X+Jz1h+OG2TKkqXvovHtHv2HgKvhgC95DgoVufqCxl7Q+DpnCY5eXf90fECUnU3+1wJPC7KW0muA1DQ6Bn9IxfEc7wK79LWdeyGpzLdd/TB5k9ftDd7zEifMXguaxoXbginSF7wm2L0mfL2C3dqoFNSWsEXm7jeWJ67DT8o2M+m7AeGUYqX0jIyttvzDwMnQJ8tVO271HWu7j2iasdcr4qbzi36ACb7bbQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Thread-Topic: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Thread-Index: AQHX47d8XeRfYSQoykqwT5zn68xBhKwy9zgA
Date: Wed, 15 Dec 2021 02:58:23 +0000
Message-ID: <87ee6ey3ox.fsf@epam.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3de576f-9011-4043-99b0-08d9bf76c1f7
x-ms-traffictypediagnostic: PAXPR03MB8013:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB80139DBCDFD9777E5893E2C6E6769@PAXPR03MB8013.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kTC1gLtueD82GF1Cqm61cpL/QPYzh/T7QjN146g/Mc7kgWlL21MdPfGhSW521pQLAWRxeaQL8kS4htod9LtV9XYIn3TbKSMEp6GeZH/1cChq3MCH7H03quJCV7HHhtYEcjeoNxrVsMDGM5Rb2ZDKMhzlLFX44ZdXH97Kec+dVoW0QkJyf2jwpRYQ84HDQ6qLdCKr0hXca86eNh0Cy6OMWqqgyo81XESXX2vEffd/7Jt9BVM2lsytoLnEYK6KuWrUs/W5DnTNJ7+Qsr+cWrCWu500zr9d9H7KarsGb20qsFwiP3zC77R35GultfI9JLKufBP5lXUJ/DrH1dmpZ/2HKM12xoVsNTuC6mTp/OQox80xEemcLRpnAK6wKsvCpavVr/3DKHVp/PECQm1cack1TadYPcRvK9H9OyzUCZvnIxcvdX+txfJEi6pjJts+37F6rJ69rleQc+P9G9ffX7vAIawsXz33rAOSit7EhsZSSu6w2Sxk7G7sl5Tc18dCouXL30xn09UBWh69JWwdefxWQGOGgqBAj+e1vL2wIC9Tmtu07cD8+ocA7igygl5jADcZZjwkQY4wvbBkoxlqkqrjqSw9yjjT/cnZee/6e5lz0ZJuPvd6yL2Ov6PEPpCfcgGi689TEzMoRCCmSLZbQ6IOz3nth98GXGt5VyUjsSp5IMvD53oCeT+0JGqfOaZ5bQj/6ciTQetmVlGovbN/K2Lxew==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(76116006)(2616005)(186003)(38070700005)(5660300002)(508600001)(6916009)(8676002)(66446008)(2906002)(66946007)(66556008)(64756008)(26005)(54906003)(6486002)(91956017)(66476007)(6512007)(316002)(4326008)(8936002)(55236004)(38100700002)(71200400001)(36756003)(86362001)(6506007)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nRVVhtRCPRpngnq11YlLD50aruy7m/8qYYJz0fWgMdRAEJM2ZWonrl2Hqk?=
 =?iso-8859-1?Q?UdACX5qUeNtFzHjxq5lQYEF6oNDMq9zlCTzeBiOI7NKch/LlHNNVDWlyZj?=
 =?iso-8859-1?Q?MKPs6y+uTv6ozhlfJYP7lv9VSiEz8T7JnpUpjJCVFETLhx2fEyXTOz8pG2?=
 =?iso-8859-1?Q?JdCBfnhLC3EIho0C3MyVOik4Ju0dVD66gzOkIbpVZfrrYaA33k+dL7NtNq?=
 =?iso-8859-1?Q?rAFMXOGnFgFxxcqwo1dy9jXv13YX5NqoqUPYHEl/sSSeEEs1/GNkOB7Ni0?=
 =?iso-8859-1?Q?kKF914t4iw25dydo2ull5tLscEBuryeXIWP4nkStz9uXPIayCmqGtJzQ+U?=
 =?iso-8859-1?Q?/JvU3Fvy9xFfHYcLqm5JzADuvTmV5rmz2FLzd56i1J79ouKiNNnP2zfid7?=
 =?iso-8859-1?Q?zGW3XqC0JQ479jquWJZqSqde3bQ7PD0ky2KVlx+V0a4mgSNe30LYVeh62F?=
 =?iso-8859-1?Q?WksFxgvTp+LoFraUUGoCIGNjgJre41T2PhJ7bjk3EJAeSLFR3lBybjVxoC?=
 =?iso-8859-1?Q?nyqDyyhL6dHM5vJmuacVENmwibt6Yz0Z6bMV7237K+z1b+gOVju5CH9urY?=
 =?iso-8859-1?Q?lPR0P80DZdI/h+IBOuZTWW/CnDi+5PCzx2mOWKr/PGhDzSn1vLTjVKBv7I?=
 =?iso-8859-1?Q?RwWysYEW4qUif6MivJwRA/nhvujLitT1/R5uU55HtOeZeiJrnLIiG2HRII?=
 =?iso-8859-1?Q?tdHkmuYbidqH9Va18Xjgs9fV/zoZR25wgqym6bBLIhjlihzKOFvEg+VON/?=
 =?iso-8859-1?Q?srrgUcXyDm4Cv6e9XReShx63zuPUKFZHeRqSgcUfVvWQOrLwHyTIFXs77c?=
 =?iso-8859-1?Q?mKIAbIyFt/teNUTp6bMtbX5pjeRRJK39amfTAOdUdl8lcV9eKMgA0wp9Ol?=
 =?iso-8859-1?Q?myqRo0zFQ4p3DRq8/daby0cgqa7SERQKwTuSunJ+P27K2dJ4Z19enjbWji?=
 =?iso-8859-1?Q?5vkX0diYf8bHMm7b1pxGLkf8CRm8pKNHZrppCxENABk/zi2YQ9XMUMcemo?=
 =?iso-8859-1?Q?0+ppFE4Ih/hPoOVBGd9rCuo4TZ9omU1rGw3hxMgzi12kD9k/ZZ9ulbMEZt?=
 =?iso-8859-1?Q?/fZCagQk4auFEWWTRMojMANwVdVaw+wFAcw52PBEXee+/IhOGIBJjl8HCh?=
 =?iso-8859-1?Q?EPNjRbliEHeC56a2pQE3gKkwHoTi8Pthfv11VVQXSxtO3iHFPY39EIyX+f?=
 =?iso-8859-1?Q?gi/1QkPxfSrWvWVu+t+gtiUMHZSVUe+9s/lQqawbZfEX83tiXhcglWD818?=
 =?iso-8859-1?Q?kJDw9qBXAa1PDsPYVlZx/jFK2mmPkb/AkgWICqGA9wMZrglx8pjRiW294j?=
 =?iso-8859-1?Q?vVJFLUyGUiEPr+0pEQTBt7fQe6lA/0OlGdn11sGYoJE9L3MKXF0sCrlICo?=
 =?iso-8859-1?Q?vdpaSdRnaYsEWrtXcCtPBTNAl50ZHHcLdZKwBs50m0s2KsbRjn4NQOe7TU?=
 =?iso-8859-1?Q?Z8eVLZd++B8re14iDjlMQA19u8D7raztwpRo/u3ojM/me1nLoytKbiep/X?=
 =?iso-8859-1?Q?vtCG+h+m3hUNaAsI7wi1RdfIn/3EYusAXlp/97tr7DRXMPN+fmHfeu0buw?=
 =?iso-8859-1?Q?5J/TNsq4q+NuPReySxXFSuEm7n1IxhSfnQ63WphEMQ0TXE+8mzNLK2E5x4?=
 =?iso-8859-1?Q?mNR9swc1CIUS0LvkGdFELrBp8q4jvW4QGvw5FRW0CLItvvhb+gmTZ6SuHD?=
 =?iso-8859-1?Q?p0+qM0mjVuusgTedVzQDrP7Txm4d4xWXA223jJCJGUAbQ31dxiZaoiv+uk?=
 =?iso-8859-1?Q?sDpYWXmJSRgrSZAUUQUZb7K4A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3de576f-9011-4043-99b0-08d9bf76c1f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 02:58:23.0286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KykVHevTPEmxFgGldEiKRoiVhVtyjZzAi6gSYg/QPCaxXaNiEgmugbUHBQWv6tk0d5irrQJf8arAtr5tAAj5Cb7DQixzX9BdsZWXgx/4grI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8013
X-Proofpoint-GUID: Ss77gkegRp0kJomqmhSirlCsAcjo1TrJ
X-Proofpoint-ORIG-GUID: Ss77gkegRp0kJomqmhSirlCsAcjo1TrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=973 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112150015


Hi Oleksandr,


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Reference-count the micro-TLBs as several bus masters can be
> connected to the same micro-TLB (and drop TODO comment).
> This wasn't an issue so far, since the platform devices
> (this driver deals with) get assigned/deassigned together during
> domain creation/destruction. But, in order to support PCI devices
> (which are hot-pluggable) in the near future we will need to
> take care of.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 22dd84e..32609f8 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -134,6 +134,7 @@ struct ipmmu_vmsa_device {
>      spinlock_t lock;    /* Protects ctx and domains[] */
>      DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> +    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>      const struct ipmmu_features *features;
>  };
> =20
> @@ -477,13 +478,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_doma=
in *domain,
>          }
>      }
> =20
> -    /*
> -     * TODO: Reference-count the micro-TLB as several bus masters can be
> -     * connected to the same micro-TLB.
> -     */
> -    ipmmu_imuasid_write(mmu, utlb, 0);
> -    ipmmu_imuctr_write(mmu, utlb, imuctr |
> -                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMU=
EN);
> +    if ( mmu->utlb_refcount[utlb]++ =3D=3D 0 )
> +    {
> +        ipmmu_imuasid_write(mmu, utlb, 0);
> +        ipmmu_imuctr_write(mmu, utlb, imuctr |
> +                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR=
_MMUEN);
> +    }
> =20
>      return 0;
>  }
> @@ -494,7 +494,8 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_doma=
in *domain,
>  {
>      struct ipmmu_vmsa_device *mmu =3D domain->mmu;
> =20
> -    ipmmu_imuctr_write(mmu, utlb, 0);

It would be great to have

+      ASSERT(mmu->utlb_refcount[utlb] > 0);

there. Just in case.

> +    if ( --mmu->utlb_refcount[utlb] =3D=3D 0 )
> +        ipmmu_imuctr_write(mmu, utlb, 0);
>  }
> =20
>  /* Domain/Context Management */


--=20
Volodymyr Babchuk at EPAM=

