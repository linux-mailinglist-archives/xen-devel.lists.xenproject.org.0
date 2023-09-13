Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5C79F5BB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601712.937828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZgV-0003LI-Hi; Wed, 13 Sep 2023 23:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601712.937828; Wed, 13 Sep 2023 23:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZgV-0003Jc-Ew; Wed, 13 Sep 2023 23:54:15 +0000
Received: by outflank-mailman (input) for mailman id 601712;
 Wed, 13 Sep 2023 23:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A9Ma=E5=epam.com=prvs=3620db259f=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qgZgT-0003JU-Q8
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:54:14 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d556e79a-5290-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 01:54:11 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38DNlq5F003360; Wed, 13 Sep 2023 23:54:02 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t3q2br08w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Sep 2023 23:54:01 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (2603:10a6:208:4b::31)
 by DB3PR0302MB9087.eurprd03.prod.outlook.com (2603:10a6:10:42b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 23:53:57 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3400:7d:60cf:5bb9]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3400:7d:60cf:5bb9%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 23:53:56 +0000
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
X-Inumbo-ID: d556e79a-5290-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YppZ0symDO/kQKM3NE6dNCDhZlhAw6lLJvaZQtadlEtNwrJIxnTUrxyWfKuhlLFOPcBt/WNb+m8h68gbEQrJlXhL/mvLVf5vIiYVq/47qBFJy8kkWXd/kY0lwDsuanqnOiMWMeIUDwRuubrUySTmwjsYxQrt0Dy8xDoSA/+Sr+XDfsz8L6zikbPk4SGFtfXrNp7aWm5nHGUizQ4H9j18yK0D4mGviT63DKnMumwxVsDlD6rRJA9zJWt4teKWJT9SgDev2foOexzy9MgNwhVQs6I7tvfkqwfUBLw9H4t59xlCoqd3futiTSgMO5lV2VxqeNTYhMyJrsCo7GyLmEJelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8jphZXcJoUURiNVR/XYzjWprHsv9k8YGB7Cs5IEUP4=;
 b=l5LGtgXaVj1n6G+PvJ5FmPd4zWUiSPNebvHKtPNdxsULPyXvZ9oZt5bO+yVoFjpGTa2HD/D+X2iBuRYz/P4oNtjYdqMGFiaWdyG7hcDLgBlhGO6gNtn5pFFQbtpcf/i103NlsKPHk9J8FSPkmoNmnTm5xnpFjtQFSKo+L/j7/Kkld1K8dNxRoiLc9qv++K/CclsIm8FkmEhhNXMJoxBpqgGAQserPMLG1/uBYwmxWDiKxd4/erZel19nE6mzfcFk8YC2TlgMmbHOOar44UEf/23W2+lRTEsiRwAad6qobcjgXov/l0/QmbARv0SAwFSmz343CfpVhHBvKmQ8H4GVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8jphZXcJoUURiNVR/XYzjWprHsv9k8YGB7Cs5IEUP4=;
 b=XjlU6zRyLkbvXywfNOyJ9bN0HVlK3SgTDgq0NNFbBz4vQVkuWe71TrbFTwyCtRmazpb/pkreZLMEdFSdWwUP/+guIKIc77V5O1hodelyndn3V/gPVa6/XFZkTSMkxgRwG6RuMJLXBYGPCNxVOjd+l6qtCrqh7tuScWMzzaWhL/98ZGw8AS8Zf9GSlBg2uoNp44oAGzjoUVpVlZT7yf1DQ1xDAnaKJdAixlxBpEiU//ZUUa7PTKleIxs+/tukxPqWdg3/lNdeXyKsOBTDkTEAOsFgVlP2X3IKCzcyBfNiiLV0fBAWdZ1yuCC6zkw0VZ+Lam/0S0HH3tOBQFb/JAncCw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZ2s9Kc9kNunOnfUurMYypVVbdQ7AXA+KAgADqFoCAAGrqgIABKtcA
Date: Wed, 13 Sep 2023 23:53:56 +0000
Message-ID: <87wmwthbos.fsf@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
 <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com> <874jjzhsd4.fsf@epam.com>
 <1f57bbf2-d6f3-2e3d-61e0-049b8e2e070a@suse.com>
In-Reply-To: <1f57bbf2-d6f3-2e3d-61e0-049b8e2e070a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB3699:EE_|DB3PR0302MB9087:EE_
x-ms-office365-filtering-correlation-id: f4a07357-95d5-486e-efed-08dbb4b4b149
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s0/p16vZ9IMUikSamFHXiwc8uCZ7MAJ2813U6N83uTwTr9Ikjr3ZIvQfUkKwwzE74EtSW/wuZbQSvMq4CydnkjTLHIYHB8fG+kHU3qm9aRO6c8vwrQe07gnqwgG5tivl8mbqgEt840N/m+YfNjnMONtwjGpiCvkOmPpf5xHpiyYmbr7ZyeOKs+hon77XK7ptlDgyhGTKWVYbtqbiHHxer97Y8WOcNIWxiJFFV5Qg8Utx+VvazFX3XBHCZHZCyWHTUcOjb9KcdUVzXvaSq99W3F06077b1W4iVMEpQhUZl0TdWR02YBNCUCYua63fRTegSSEbv8uMpsUmAVAgswRvB+Wjf9L0spnEGSdEOaiOxXgeo088PEkcAfP84BcLkAyGTnyVdJKLL2nU2DyDRtTbHHedf5ownJ9zogmLoRluPherO6ey4TzgsWDDE1mU9ygxZxdp1HJdOSnvXNAqN/RS3LZ2+8isoCgK6QlZgD0b3HVwM9QqHJAb9oEKxZcieQWLbmESF/EZMQlGkknhAkGLUbS5R0dl5U4EzEmIvFUNT9iWSzUvcUfsFg46MPJGOgTDvJujvUCevIeG77r6LV4j5fsgYBrgeqi7Kz/disivGvPsdOVkjpoUZjetXz5T2BnM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(186009)(451199024)(1800799009)(8676002)(6512007)(66946007)(53546011)(55236004)(6486002)(6506007)(38100700002)(38070700005)(76116006)(86362001)(91956017)(71200400001)(83380400001)(478600001)(2616005)(122000001)(26005)(4326008)(66556008)(66446008)(2906002)(5660300002)(7416002)(36756003)(316002)(64756008)(41300700001)(6916009)(54906003)(8936002)(66476007)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CGzay8nRIGmlR4pz+g98FQsiwD6yCDRKX+aEtEfzkHXlfugtLyPeyVuSvk?=
 =?iso-8859-1?Q?SH0ImiOnvkqWDSYHj4SMm3KXrSOfBDCF1d+IB17DCL0mtJHDvml85x6IvD?=
 =?iso-8859-1?Q?2+2cAAPnj696urqcGfTRkN/6oeI4Wz3ZNlqcqVwx8dlBmEsKQhfJ5a1ofv?=
 =?iso-8859-1?Q?DA81Q1kzMukDumHndiRwgbZvSnilt9221YBoamo8DVSQ/OrGVYLEGA7MRA?=
 =?iso-8859-1?Q?fF/5RRfvd3cm9CRRGf9gYE81sAwZnVL0P7L5PWKlEnj1cSvZ7IRuVjN9EH?=
 =?iso-8859-1?Q?a8svCpx8hu24KQxl4605L6Pn+ZizYD4Gg//2zqCrzIqsrTwd/HySTPkYnY?=
 =?iso-8859-1?Q?yBVE+jLoAtKFuOShi+sZY0YuNdPWqNjrj18WFnac173hl32BadtDgRAXDo?=
 =?iso-8859-1?Q?Bt7+tXZoKyD8CB4C+M5EP8xCOw2XHOrSbgXEZzX7BX6uEQBZaUxWiWGy+f?=
 =?iso-8859-1?Q?HJRdT0GRE8PJvIN+RggnNiMkT7im697y/xfVq3Lp51tMPhOT8WAxcsua2q?=
 =?iso-8859-1?Q?KKUCLXlKLGDz4T3Ppc+3p7iV/S3dA1b32Ak//rHODIdlZH7Z+VYl79tJwe?=
 =?iso-8859-1?Q?SQHZivCcyq9yLDnszKS1PGRc2ShKIUO/urNeaoPlr/T5rnKyr+6dwywGxL?=
 =?iso-8859-1?Q?GKfV+5uyuJ4HrTYngB6893QX8339UhY8QBDb0BVpmbOsRrJuuxQC0utiRl?=
 =?iso-8859-1?Q?MGTnGrdwuU1lYApBa842HNFpUa1rK4boDNGMzyHyG8gM+l4t4erYzRBV2C?=
 =?iso-8859-1?Q?78ZIaYnyB3JAtPMF7kFHeNvIEwNdyDUssJok4D69wiynflNglcOkQm0C2T?=
 =?iso-8859-1?Q?xh3afT40Wl9wZG/FywtcR+ogS2pkg/tHyuIPR3sUsae8WXyaJfClY507+3?=
 =?iso-8859-1?Q?MSWFxld/EvrBbsTkiHdtNZrJYeB4NMU7N5o20XEt9XoRZSnUobaOgwWKaz?=
 =?iso-8859-1?Q?dLOdUyo51amVZ4TcFDUUDOxXrwcaxf+G0DuQG6DV6xDlEVqW9LEeQ2b3zA?=
 =?iso-8859-1?Q?mSl6816jHoJT8PoyicohMs2zwdloYNkMY9/q5B1TOA9Ai02WflP60Sf04k?=
 =?iso-8859-1?Q?UsC6NcNa6HDbIiawDr2h/7Zk/trM8PJXtZUe095NIsC+Vg3+H4HJZwuKll?=
 =?iso-8859-1?Q?DsiuzCyrXf3XmOPisVDd4r9kYwHyi/f1ecXqVvINCQNp2K8xKAiMuOnOSt?=
 =?iso-8859-1?Q?qHi5AV9b6vT/peV4bmn4PIuvCYpa+XG2oiwUEbtMHCd3FeNe4DWqLWC+QW?=
 =?iso-8859-1?Q?hI2wPXjYFA5npClBHLUWne3+yY5FobOnScOm6QI15e/Y84JdyIiddhenc+?=
 =?iso-8859-1?Q?Xjy/G06ApIxiuxbSOCINmXI2G9WbcrQ5RxwtnC4L4fRkqJAy46vbFJI5Pa?=
 =?iso-8859-1?Q?cZ/oweYdv/P44i4JvhaHAVqpadmZWM7ced4O70VTtasOS2TTOLXnhQADEA?=
 =?iso-8859-1?Q?RW6vjIbzvR3jtnCloG8JoSOs7xqocbeoNgXnrdfdkNyIWoGP3CrmKfM9qm?=
 =?iso-8859-1?Q?m6nKw5R8WyQ16dBHzq9f6cCepLce+13xgK5xY4+v1Kgd9BmGmRxKa6Tfbc?=
 =?iso-8859-1?Q?wrD28Efzu0/ApBopAV9oKAiHstOgtOB3tOGxc7AiTSS2oQfsAl3jcH60kc?=
 =?iso-8859-1?Q?azvm6SnJb5fsGxJVwW2puiTT8/qU0YEmHIGqhpsM5ebXTEt4Oki2cn9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a07357-95d5-486e-efed-08dbb4b4b149
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 23:53:56.4402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74h/m8FZabt00CGMP9hepq1qRU8thfadMMdMpAwwgpc1jZKFLZDp9EMg75aOia+VruL9noFL443pk+c+DFXzUIGzqArM4cUC+LKfIjgORSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9087
X-Proofpoint-ORIG-GUID: hU8iIBKrOsuZuRBBCtVsHMOApRCqDQsB
X-Proofpoint-GUID: hU8iIBKrOsuZuRBBCtVsHMOApRCqDQsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_18,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=809 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130198


Hi,

Jan Beulich <jbeulich@suse.com> writes:

> On 13.09.2023 01:41, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 30.08.2023 01:19, Volodymyr Babchuk wrote:
>>>> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 =
seg, u8 bus, u8 devfn, u32 flag)
>>>>      if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
>>>>          goto done;
>>>> =20
>>>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
>>>> +    {
>>>> +        write_lock(&pdev->domain->pci_lock);
>>>> +        vpci_deassign_device(pdev);
>>>> +        write_unlock(&pdev->domain->pci_lock);
>>>> +    }
>>>
>>> Why is the DomIO special case ...
>>=20
>> vpci_deassign_device() does nothing if vPCI was initialized for a
>> domain. So it not wrong to call this function even if pdev belongs to do=
m_io.
>
> Well, okay, but then you acquire a lock just to do nothing (apart
> from the apparent asymmetry).

Yes, I agree. I'll add the same check as below. Thanks for the review.


--=20
WBR, Volodymyr=

