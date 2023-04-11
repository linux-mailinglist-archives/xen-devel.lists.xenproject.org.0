Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474D6DE75F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519961.807092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMdu-0003My-AH; Tue, 11 Apr 2023 22:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519961.807092; Tue, 11 Apr 2023 22:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMdu-0003Kf-7T; Tue, 11 Apr 2023 22:39:14 +0000
Received: by outflank-mailman (input) for mailman id 519961;
 Tue, 11 Apr 2023 22:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0V3=AC=epam.com=prvs=8465a122a0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pmMds-0003KZ-Mg
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:39:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad00b5c5-d8b9-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 00:39:11 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BEvnMg025232; Tue, 11 Apr 2023 22:39:01 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3pvr2vmgca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 22:39:01 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GVXPR03MB8425.eurprd03.prod.outlook.com (2603:10a6:150:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:38:57 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 22:38:56 +0000
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
X-Inumbo-ID: ad00b5c5-d8b9-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvJjmrM7M3IQZEKpfk/1/0fX7L+q3Hpr5kVbX5otyatiHmap6aWNVzCv3UWCIFHo84zOqPb2DL9OrWWBoa3sBhiGK0BQHPemLXePDcpaj0dRtxcVdymd0Q/6xf4LXcAtRPbSd1s2YQgDufk3F1wrT5GK2ENkt3tJwRutRCD+wj1GdgcPkkXooc+sZe5dQT1NLlfVLhycmQwCoeKv6jvfGyuZ8Ea+obmyep/v7dOZt1gH0DyIzrWhXaFQFlvc4yPk0SJiPtxeHSgmX5oe7+56IGK7iJOEYM3zYLPdg1Xu5Fh3X9MMJlJxJ6oREIuBjxUcYWK1I43GTj6yK2r8TjQZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVMeI+YDw0P+RLQYwajulzk0QC6yTYde2vQfAduLjHg=;
 b=TV3TpcHLdqKn1LvUqmrKQRvANg4jmrh+kb1hvNiPU1KECCjK1I+RvvkLMA7skNkH3CSs2gcq0ki1oeudY6EYyWuoDw/afdFbtDgPneAobBLf8lEphoAB3j+DUk6ml380oNtXJp1t4uV8M6V1Ev7EzKy9w9cVUezVpr9GUZX6TeqzKERDKvcch9ZILdAZZM4fXlzFHCAkVQk9q+GQ5ZoMzHw9OVzB4wNkZhPKgEF1qtMotjM+7u+aEfpszTme6fI0dD4WAhBg4KQcpJXRtPpdj/EyvSkDmsDz5Wul5q2WyhT2re+IWciY090z4uCa9I9wV1XUXZKTrRYvK9MRMsrqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVMeI+YDw0P+RLQYwajulzk0QC6yTYde2vQfAduLjHg=;
 b=TRC9N0pKEFakCEQcosA1+oR6wtQ6Vk4qMRgN5wlHEKSNWaHnG6czy/LKIVd23zUcw+QU7tf9PLONtUSz4rlLRmJQgZBVaPSft9fpILfq3z/Cj4PdhsmSFbYooUCD/n65R8KMeR2ikNnQEVF7as3bQHtHkSItrp4/jGWcBYfkGlxj0CJ8Bk9RgCnxBfeeiV/+2cGBrWA1xsWyTz+PCbHxxdaS5bRccZGgFUpZXXbMpH7tPXRvIool04o31fvKMKCsUA6gfnRjwTZpVQuBiXrQdSCH1Xgh9eK0ASlZXsIwoauQ5e+tbtt9ANnvGspEkWTTjIdn2hOYgAqbpO96bJm89w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Thread-Topic: [PATCH v3 1/6] xen: add reference counter support
Thread-Index: AQHZVrdyBx9pogLqRUq3RbhGdjZNSK79pIaAgCk3xwA=
Date: Tue, 11 Apr 2023 22:38:56 +0000
Message-ID: <87a5zexcw0.fsf@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <57c7c2e4-ae68-19c4-2140-f5a41fc1a6d3@suse.com>
In-Reply-To: <57c7c2e4-ae68-19c4-2140-f5a41fc1a6d3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GVXPR03MB8425:EE_
x-ms-office365-filtering-correlation-id: 2a2fc1da-2c54-474f-1513-08db3add8921
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kU/Txwe+dAk1M/l+7jEholiJn3Oz0mP3gb+cKtxlXml6sW5zy0Dwmk/H7Ln7tEBv45db919C6kx1gBDT7o81Pn9rvG7IUSG7xcQXbWuN0Q+RNxw36Nql7Ms57+M3E2BzQu3me2yusckCR4v8OgcnTzD7VMJVuaiJlyvGLFp/c/DRKSr3Dj0JtjJf92N8B2ojnkqnq1ys2UBh5CmIrplc00K0YS4+Sor1mLlBB/xjb6i1I0pwG5KzHwbzRlpH/ZWexbubd3fkk7uJXWeU7Q1mZRWlQZSWueWpHV2fy6iNhyDJo20Jkj/ekmoOuvZAufXPqEKYSFD9oRbeJ1Yv7fg5mHao9tkxrI3Iq/C8KvKX19B+QS9axzoajFfXTa4kp6LdZdFWzQMwB6aH5YEYsPQvMCh6KdwmJTEzgr1bv/TDxYJTQAj87kODpx5667cOuHgxhw3vUZfpPm2di55ZMamt0VdeK5dC+mOmH9lCFgMOdZlmaHxiG6hjx7hgKVql7J44VnJ0fmjG86RYxvEaC03LmlJ7aK6pZJrRuQ6Twgmou+obetyGCRINKYEVNMDZiKJfqJWSDqA1Sxr7eq++3jOc1nAPT4fBIyKKw2ISmuK+Lma9kAqj+p+PWiqQylvP2Ljd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(53546011)(55236004)(478600001)(26005)(54906003)(38100700002)(6512007)(6506007)(186003)(8676002)(8936002)(316002)(41300700001)(66476007)(66946007)(66556008)(64756008)(6916009)(66446008)(122000001)(4326008)(76116006)(86362001)(36756003)(71200400001)(6486002)(91956017)(2616005)(2906002)(83380400001)(38070700005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3f7QP3NMdyqKNHAJXTIEhib5iE7Y6uhPluRIyYF4EUyQsiuez5w6uSEje/?=
 =?iso-8859-1?Q?edYwGvsmCnhO/X6UbtiI0RFxMtAXztaNh9u6Y/I+TIxXx+so0R8xm6Jvgt?=
 =?iso-8859-1?Q?dXgNgv+OhbrGv4B8H8PTMEPr9MELYVm6opAtzGeo4iJjAC2Ss9oHTwh883?=
 =?iso-8859-1?Q?rANJDbHqcPezlu5IaY6iMAxZllkxtyXLvegMn4Wf7l6uGZ+lTKpyDgVoiK?=
 =?iso-8859-1?Q?6V/aAzZr+GwzwjmCIymLJBpdTDPwoOcwmqK+79pM9vFaQX4T7I8Y/S14oS?=
 =?iso-8859-1?Q?ilQeeDw8cTqpE9VwBAabFlqUhoiNXid/AeLnxN3w5NYYz2uDIiOQAvClgS?=
 =?iso-8859-1?Q?NmWz39Elz/w6CyHowirjI259M09De5Yj6A09XHyeQepquK0y9SpmppR19H?=
 =?iso-8859-1?Q?DegePslURKznI9MYavTok7alANncLq8+Jkeg0kIHlK9I+MIDy2QstoFmRl?=
 =?iso-8859-1?Q?AHR9MFYlx4torF+C+9u6m/VhrXTVSMkzLHFYfWGJEFvo30wCHvP056pGo+?=
 =?iso-8859-1?Q?yZs3Oc0MB5n2Azf4CeVI11/P4uFQZZOe36rW6o3kGiLIeeT8ZxDqVfknHm?=
 =?iso-8859-1?Q?lirnlHphSPJyQm1zycvXI42HIU282dFETlFf4tXd0PCRnPUbI/u+cPbzFg?=
 =?iso-8859-1?Q?c2RzEfOJK/XkgMUBlkp9PJoIcJl+rpKtG8S5q03InfGI3gO4HraCKTIg8S?=
 =?iso-8859-1?Q?8Zs1mICf0OB0TCQY0YzOxeXtlU9bUXHUOIuFCJH3crYwAMmVAcq/pzF3Dl?=
 =?iso-8859-1?Q?N6YR/HnKtWnUvk0ELcxiwcLxi3F8dnngnC5pnudhXSUuoF2qGeq7Y3nkIu?=
 =?iso-8859-1?Q?lBYB+Jw6uhX74V8Ckg1tv7/T3QwfTcqEGLvEqxEGkc3Scum9gc5JQwDaav?=
 =?iso-8859-1?Q?WF0J/evKz3ET626DNSL3Y6zBmFz222EGUf+Dh9m0xQi4BAc7PEt32v4zHS?=
 =?iso-8859-1?Q?FfI2FtopEMiRKRCI/kQ6bLkHAb6a9WL5FvIukVGACtAjCusL709tTM/OKm?=
 =?iso-8859-1?Q?moPgNqTwb+XjF8Pse/aJ04f/A1G4Fx4kl7Dj4LGM1qX5jTt6mG2MELAiI7?=
 =?iso-8859-1?Q?qJkbGYC3OjN53fUKXdwPkSbWgTmEjLDhZF5MnV5XCr4q/MtsDmoEm4iyRT?=
 =?iso-8859-1?Q?gyy9t2G2mBIw9eUKvO/UqY7mOCkZLWzV3IlAF1DbL3MnGjbr5zvA24r+uh?=
 =?iso-8859-1?Q?8eJ6EFgE12Q7R839I5TOMrBMJhE4W7249NC41vCl2vnqS3ujFBN5Adk3ft?=
 =?iso-8859-1?Q?HE4KhhTQKESE04eSNa3M6+/wSDH8pyYba0VMFBs0GDDPE/D7UBvYYXxoc+?=
 =?iso-8859-1?Q?YsP7Fgv/oo5ZUoZsFj2gy7SOgStk2sQZLXiBBiF0u9jBktJDz0Xk5b5a6t?=
 =?iso-8859-1?Q?9ukSx4U63wHw+L1MlqAiQTwhk6LAxJtIN303Lby/4Oj/aTDqQW/+GnFmj7?=
 =?iso-8859-1?Q?yySdmvG4B/ddU2YoFSe51tvN06Xmr+44mX81tT3kwwXuw3yiTQjAUNDl2G?=
 =?iso-8859-1?Q?lZgCUW8gnQsdpPZKyvOTqmcmb1FEjE0pxRbOB8B7BNXrpHpJqot3443MK+?=
 =?iso-8859-1?Q?zWfotLTs984clx9TbIOInLP/6P1iC7RU1M+lEGQPwBa3XupR2QCtSU3ZFg?=
 =?iso-8859-1?Q?+PEEDYs2LeyDj6l+W9mKTrJTwYvRcTG4HjsI93MDH8NgQi6RRbYqNfYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2fc1da-2c54-474f-1513-08db3add8921
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 22:38:56.5586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: As8uLz4ga5JNBtS2OoY4lER6g8FAz3d2rgnzwWGOhBa4hcTIGL+BwgtTOQ2NatYQLl4TbJY6+ux11ReUTLAnoXfQQNNdg6wvx3xS/rtLRTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8425
X-Proofpoint-GUID: GQyNidjuNw7Zjaqc_mizmRHmaTxCBT2b
X-Proofpoint-ORIG-GUID: GQyNidjuNw7Zjaqc_mizmRHmaTxCBT2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_16,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=900
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110204


Jan Beulich <jbeulich@suse.com> writes:

> On 14.03.2023 21:56, Volodymyr Babchuk wrote:
>> +static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refc=
nt_t *refcnt))
>
> Hmm, this means all callers need to pass (and agree on) the supposedly
> single destructor function that needs calling. Wouldn't the destructor
> function better be stored elsewhere (and supplied to e.g. refcnt_init())?
>

I tried to replicate Linux approach. They provide destructor function
every time. On other hand, kref_put() is often called from a wrapper
function (like pdev_put() in our case), so destructor in fact, is
provided only once.

>> +{
>> +    int ret =3D atomic_dec_return(&refcnt->refcnt);
>> +
>> +    if ( ret =3D=3D 0 )
>> +        destructor(refcnt);
>> +
>> +    if ( unlikely(ret < 0))
>> +    {
>> +        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
>
> It's undefined whether *refcnt still exists once the destructor was
> called (which would have happened before we can make it here). While
> even the atomic_dec_return() above would already have acted in an
> unknown way in this case I don't think it's a good idea to access the
> object yet another time. (Same for the "negative" case in
> refcnt_get() then.)

Okay, then I'll remove saturation logic.

--=20
WBR, Volodymyr=

