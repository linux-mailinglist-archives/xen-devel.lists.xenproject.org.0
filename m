Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C24AD37E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267667.461412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLvE-0007Bv-8h; Tue, 08 Feb 2022 08:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267667.461412; Tue, 08 Feb 2022 08:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLvE-0007A5-3a; Tue, 08 Feb 2022 08:32:24 +0000
Received: by outflank-mailman (input) for mailman id 267667;
 Tue, 08 Feb 2022 08:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHLvC-00079z-6k
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:32:22 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15f9b4e-88b9-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:32:20 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2188Ntd6012327;
 Tue, 8 Feb 2022 08:32:16 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3myg817j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 08:32:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5568.eurprd03.prod.outlook.com (2603:10a6:803:11a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 08:32:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:32:12 +0000
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
X-Inumbo-ID: a15f9b4e-88b9-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leLeCDVdfoCxKFzIhl0ZHoRgBq9YMz2fSfBVcGLuIA++G845e6kDRpfTblx6XzJFvnxSIQGuVAP32ueBWu0QGDTvei6Jv9/QZHe+SHlhVxUDDXExqShz67L2Q2dLNRQCPV2W6PCYifrWQemx8ZheMK32IdwBZhbaVxHJLy+Pg8bAbJVkQypDGJDbGlZNfa/BFUQfiIJFP5JbLaQFG3DvE3uszkJWgSr7JtjaVJfGrShI8Mho2gaUwXqz9jvK6qWXkQUT/OXWnTPqrlwVXAyIzmoSEXTnY5E6Ed0AJK3Hoq1Yj2kh5+ZhKwfeznT9124SrJlfz9bezvsW6jxvPZmeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEBK7Y5VIxevNiBEHlqkr7/GKIvefWR9lNVpLA60g/Q=;
 b=LgICt82DjfNhOj9kmru3SojLvb6ZjvjzfQhRBBG4tjYtqeIufkgN/3X025B9+kBmmC9NODBSTu35jxYLlmM/2As8PduHNt0qHWE8tm8D3w5eiLs+YGicgdGYmF+YjWqKsr1qkoblG98tqOeUWh+85rNAUbtOZO5ezqBgDCESvnB5/JjqB1o3OhjmHvllsaXRVPiIlH5YKBdarqQCuY0zdq9Eou6281nztzZ5zwD3vxp7IkQsP+jOaNB/xJKZgcwLhDOdKzTtjJEepdhUucdFD6mu2TmUoWI7TDYd6ohhK/HEbCYjEvBbyOmGuIzOgeoiacGGLWTX18gM8umulBTlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEBK7Y5VIxevNiBEHlqkr7/GKIvefWR9lNVpLA60g/Q=;
 b=aY8TYnU2mnEksGvyZ2ABvIIV+0t0klVVee9K18k7kZ4YTfHthqsFFnoZBhh7Xdvt6OH8NoNEPnwY1Y4mOUEuPoHJQ+7pVh3fVaL16nnZ99uAg88plIdrIMiDh6BMesq1rR125DS8VZuFCpkrYbgkofxJr3xsprX5WZ/n6iD318M+RyHtdzNbOD7QUaGEqiWpDa6YyxIWdXmf4GJ5fbL9tTsHYQ2pUqFDQaf0mynTtJmgUi3R9As/2cd6BVXdM1ORZ5eBZE3yCxMp2H3h/6Al/ZnDU3AdScSm4eACOaaZmRyNOS+Z8dI/jc0FqhOfaD0l8/pvO/I1z3W2E6SKvGu1gw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNIA=
Date: Tue, 8 Feb 2022 08:32:11 +0000
Message-ID: <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
In-Reply-To: <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1873c5ac-191d-40d7-2289-08d9eadd80db
x-ms-traffictypediagnostic: VE1PR03MB5568:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB55682F1577CF99F62CA28816E72D9@VE1PR03MB5568.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s3OzUmvr0+VA//WMtWgJmPzcoy2avOOeeDYbLdcDf21IByq570GLmU1YzabjkjNNS2/Ou6pXoJBYHFv1ezhPEHMboWV6me7MvvFAltfpuKOEeEj0HLBDMKJ+7UK2BVa0YYH6ZD/pdzjA1EejfiEbmUJe6w6hUx+ctZ56JVYzFYnQ3SEY7BTz7KkH6IjAdx6YYOs3WMqtKWEo5oZQE9QZ77g1uYHFNkrtRC5r6AKlWixO3iQUmlY6Qh2XovcnmLyffOMjQtlwKl3YpCZ2iJRG0czcnnuEvq+U5h6jfyJGPigNNKLHdsSBHTbnQ5EIX34UZdvK2P/6/ur1D29zBhEMa3QR91dxU6R0aWzUlQX+/FSBd/dTBAmQODZZCXZa9ZyDMk1hiUZArTYon+AxgY0YC2lFXJA5RzsVAiLybewgVfIMtKmE/MT3W75uTs0LEKgIeBZTv98vyMa1vvtIefHkCROzUTq+X3E9p7RBN3Aa3NyrfGyz9XAz8J8eQHGVr3C2/2xWuES6DU+p2hCXY8SxDxvuWp0lPyThIbmkupDyO40jB03qm6TOnonBUAGdnqCqOy+uta9KNIY3CrPOWVHJQz0zuM5jcYFMsDSz/LN7wvQs/ioZoUGsRli0or3DxZOS8tGZy4SgPFqQbJFsgkIi0AXbpqIHfaTrijg99eAPXcd8At+WNaHRnXgjJCXWlHiZYCBqvVZyhCzgB3nDKlWR718k+r0dGy0x5GImBPkvKT/8nEjXyCbalzxPtWUx0jDyBIoIUp6fMBRZeJ3NbZFqgsmplXMPvYHIis6eREbMobE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(71200400001)(2616005)(31686004)(55236004)(53546011)(122000001)(6512007)(316002)(508600001)(66946007)(6506007)(2906002)(186003)(26005)(54906003)(38070700005)(5660300002)(36756003)(6486002)(7416002)(66476007)(8676002)(91956017)(76116006)(86362001)(4326008)(6916009)(31696002)(83380400001)(8936002)(66446008)(64756008)(38100700002)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aVZ0N2RYbDZzT1FJeDlURDk1L2U1SlZvd295a2NrYkFsblFkQ0dwSHFmNlVC?=
 =?utf-8?B?aElWS203WmYxeUUwcVN1WWNnblpONHc5djVrRkx3cW5KQWoxTUhIZ1F2ajFP?=
 =?utf-8?B?dTJhandGRTR5aStyQXlMeWcvaEVnNjNTSXFhTUtwY1cxVDlhZnlSazZyeHBR?=
 =?utf-8?B?TVB4VHRtRGozMklXRjhqbWh0NjMxVm1EbkxrNXdsUXZXdVI2ak84My9DK3ls?=
 =?utf-8?B?UjN1aWdZU3NRUVg0cElRRXdlQ2RTOUt0UEtudEhJei9PblFjK3JMNkNNaHhs?=
 =?utf-8?B?RktXTlFqRkpFbjd4WXNDVXFBL3FOYTF4MFhSVHd1MkxiQmFvaXZ5V3VqTHhG?=
 =?utf-8?B?ZlB5d1ljV3BYblJLN3EvampGQWY3VGZYd2NncmE5WEN1YkdvR1ZYdU8wWG0w?=
 =?utf-8?B?ZUIzZysvWUloUERSbG1xcm5tKzczTFpDK2lYbTNkRWhqcUdENGlRS2F1MjJP?=
 =?utf-8?B?cHI3eG1PRmc0MnVIRW5hWXVxMGd6SmdvNFNzUm9YcWtWakJHUkxON0F2SEZC?=
 =?utf-8?B?bDBEbzhkR2hDNysrTy9kQ0w0c2EzQXVVLzAyVlcxTFRtYVB4UjBvMXdLQ1Bs?=
 =?utf-8?B?eTVseTAwMHZTeFBlc09naEFSRUNBWk8yVXVRUk9XWXlXV1dXanhDb3lUK2w0?=
 =?utf-8?B?UzdYcnpDQUZxTElDd0ZvV2ZYMHZ2TXA0UGhBd0g4RFM0VmdkV3JLb1pwaHlH?=
 =?utf-8?B?VnRSZk9Kdm0zc2w5cTEvSUE1enpUZnZIWGNQdUNwZURBSEZEWHJxTUxwU01B?=
 =?utf-8?B?bUxSZHFubUZTOXhjSExObWp3SHhYYStBbmFiMW5ZSnp3dTVpL2ZEWTlFc2ty?=
 =?utf-8?B?WEVGbVRneXA1Yis3L0VPUUxoR2pVdjZxZFJYOVpyeUZOTTlmeGZ2Z1JHaHNq?=
 =?utf-8?B?ZVdKVnFDK1JkRk5IMkwxd1BIM0phZW5GTmd4UnptK1ozNkJvckx1YkFlaVE5?=
 =?utf-8?B?c0NMZHdJLy80N1VpVUIvdjFIbjhlcmZXOElVWFk2Si9MRitzU3FPTTRCQW1O?=
 =?utf-8?B?a29ON1pUckczdE1oSkpDWmFoZzJneDlUNTBBa0RwS2JUTEViSHdKbndIU2Vi?=
 =?utf-8?B?bkx4TitidTFuN0Nic2JqNklhUjJEMloxV2tseGtuUEJ6dlpxZmZRZkhKVHNP?=
 =?utf-8?B?QjRCbzZHc1RwK0NwQjF2NSt1VmNncTVoSStQK3kzOVJ5bEZMcHZNVk85UXVa?=
 =?utf-8?B?Ny9ON3NsbDBEZmxQbVZ4cWw1RkpPZTlXcEVkZG13SFBVVk1TdldMeHRwMGtX?=
 =?utf-8?B?MTJWTzk5RmI0ZThOR3kzT294WlNFYUY4Z2pUYWxSYWxHcklyVWVaa3I4MERn?=
 =?utf-8?B?SG5CR1lNK1BwWlFtNU40Zm8yV1NyYitlTndaajg2Zm4rdWxVanVzdWZGSFpQ?=
 =?utf-8?B?WjYxZk1OL09qUXJDbWN0MUhmc1NmSUJaNi9qdjFVMEtjR3NsdHNFNERib3Iv?=
 =?utf-8?B?VFNFb2NQSkd6Nm1WRm9sdjI5UGdJZFJZcUNRREVjZ3dVcXp5UFBZck9kMjZT?=
 =?utf-8?B?SFVkL0cySSttbnIzYVF4djZ4aWNPaklHL0xiSC85RzhENmVzaUFUd3kwZUlD?=
 =?utf-8?B?d3JFQlZuZmFhbWRDa3ZqdFIxNXhET1g2b3pwRjlvdHZJNlJ1TnJLNXhhdGEr?=
 =?utf-8?B?anR3TkFGeDUvUzkvcTdJWmJpcUtMR1J0Z1hiU0lZa1hrcHRtVEhYZmNMOGZq?=
 =?utf-8?B?dld3Yzk5ZHUwdjNEZ1JIZTg3UDQ5YjJ0TG9TNDBnSWNqd0NHaU5jZU9jam1X?=
 =?utf-8?B?ZmxzRFBGalZNKzhFb0REU3hNckhhN2xMTGtBa3Y3WUdmbmV1Vit4RlB0eWhq?=
 =?utf-8?B?ZUxSQkhNU3ptV0RGS2xVeGFVQkJBSTFBNll4S3VKQ2hTL0JsSnVQVG0rZDN3?=
 =?utf-8?B?WENXMjZPZ3BWV1IzMVQyeUZEeEVxNERVQ1g5a0c1Qks0a1ZJdFZhQW5nQ0Rh?=
 =?utf-8?B?cjBuOTFHUFl4ekRFMmpVSEhOVkNyRU84TDZaSDBDNndUMHdiV0ZROW1tU1RZ?=
 =?utf-8?B?bEs5WlJXVGRWQURpbFlxVXBINnJsTkEydFQ2TWFBOWRHNEt5MGxUR2RWQWxM?=
 =?utf-8?B?eFFKZ2kycmx0eUlJaU9NTnJWZmMzSjcrSU1URHhWQjhwN3hYcUEyQkJMVUpF?=
 =?utf-8?B?MEhSQ1NTSU11MEFHVE1IbnA3eURaOWRIaG1na1JpYVZEdW1EclJzT0FJV2tS?=
 =?utf-8?B?YXBKWjhuK1ROcUc1MWN5MUZlU2xRQ3ZJMnZMTHk4VGtGRUppb2ZaaU1Dd0pR?=
 =?utf-8?B?b1puNHpjNXMxRjVsMzZjRk5TRHppZ1NOQ1Uvam51eGt3QnpoeEVDeGpWZitS?=
 =?utf-8?B?Z0lJczFOYzFLM0l4dWdGWVdWKzVkUDJjL3NwMmdMSlFnVTlIVm9FZi9jbzQy?=
 =?utf-8?Q?4IpXOxLneiYRg2yk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C447B1F74D8FD647878A52914CB19AD7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1873c5ac-191d-40d7-2289-08d9eadd80db
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:32:11.9059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQeTVFSCODuMz8bs4H7I5113ZybXFoKmC4HINvN2sqP4c8KKtoilU76UXR/jY11mrR12LtGsJsDpyiY+MFX1bW+U1A0Ldlx6m52IwDDMwJSR9HY65cb6RHJTyewssluH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5568
X-Proofpoint-ORIG-GUID: VDmZLeJDp9V9oBVmpPCl64Xov0eHjJnY
X-Proofpoint-GUID: VDmZLeJDp9V9oBVmpPCl64Xov0eHjJnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080047

DQoNCk9uIDA3LjAyLjIyIDE4OjI4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBAQCAtMTUwNyw2ICsx
NTExLDggQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBz
ZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICBwY2lfdG9fZGV2KHBkZXYpLCBmbGFnKTsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArICAg
IHJjID0gdnBjaV9hc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KPj4gKw0KPj4gICAgZG9uZToNCj4+
ICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIl
cGQ6IGFzc2lnbiAoJXBwKSBmYWlsZWQgKCVkKVxuIiwNCj4gVGhlcmUncyBubyBhdHRlbXB0IHRv
IHVuZG8gYW55dGhpbmcgaW4gdGhlIGNhc2Ugb2YgZ2V0dGluZyBiYWNrIGFuDQo+IGVycm9yLiBJ
U1RSIHRoaXMgYmVpbmcgZGVlbWVkIG9rYXkgb24gdGhlIGJhc2lzIHRoYXQgdGhlIHRvb2wgc3Rh
Y2sNCj4gd291bGQgdGhlbiB0YWtlIHdoYXRldmVyIGFjdGlvbiwgYnV0IHdoYXRldmVyIGl0IGlz
IHRoYXQgaXMgc3VwcG9zZWQNCj4gdG8gZGVhbCB3aXRoIGVycm9ycyBoZXJlIHdhbnRzIHNwZWxs
aW5nIG91dCBpbiB0aGUgZGVzY3JpcHRpb24uDQpXaHk/IEkgZG9uJ3QgY2hhbmdlIHRoZSBwcmV2
aW91c2x5IGV4cGVjdGVkIGRlY2lzaW9uIGFuZCBpbXBsZW1lbnRhdGlvbg0Kb2YgdGhlIGFzc2ln
bl9kZXZpY2UgZnVuY3Rpb246IEkgdXNlIGVycm9yIHBhdGhzIGFzIHRoZXkgd2VyZSB1c2VkIGJl
Zm9yZQ0KZm9yIHRoZSBleGlzdGluZyBjb2RlLiBTbywgSSBzZWUgbm8gY2xlYXIgcmVhc29uIHRv
IHN0cmVzcyB0aGF0IHRoZSBleGlzdGluZw0KYW5kIG5ldyBjb2RlIHJlbGllcyBvbiB0aGUgdG9v
bHN0YWNrDQo+IFdoYXQncyBpbXBvcnRhbnQgaXMgdGhhdCBubyBjYWxsZXIgdXAgdGhlIGNhbGwg
dHJlZSBtYXkgYmUgbGVmdCB3aXRoDQo+IHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlIGRldmljZSBp
cyBzdGlsbCBvd25lZCBieSB0aGUgb3JpZ2luYWwNCj4gZG9tYWluLiBXaXRoIGhvdyB5b3UgaGF2
ZSBpdCwgdGhlIGRldmljZSBpcyBnb2luZyB0byBiZSBvd25lZCBieSB0aGUNCj4gbmV3IGRvbWFp
biwgYnV0IG5vdCByZWFsbHkgdXNhYmxlLg0KVGhpcyBpcyBub3QgdHJ1ZTogdnBjaV9hc3NpZ25f
ZGV2aWNlIHdpbGwgY2FsbCB2cGNpX2RlYXNzaWduX2RldmljZQ0KaW50ZXJuYWxseSBpZiBpdCBm
YWlscy4gU28sIHRoZSBkZXZpY2Ugd29uJ3QgYmUgYXNzaWduZWQgaW4gdGhpcyBjYXNlDQo+DQo+
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+IEBAIC05OSw2ICs5OSwzMyBAQCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgIA0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+
PiArDQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArLyogTm90
aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+PiAraW50IHZw
Y2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+ICt7DQo+PiArICAgIGludCByYzsNCj4+ICsNCj4+ICsgICAgaWYgKCAhaGFzX3ZwY2koZCkg
KQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHJjID0gdnBjaV9hZGRfaGFu
ZGxlcnMocGRldik7DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgdnBjaV9kZWFzc2ln
bl9kZXZpY2UoZCwgcGRldik7DQo+PiArDQo+PiArICAgIHJldHVybiByYzsNCj4+ICt9DQo+PiAr
DQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgZGUtYXNzaWduZWQgZnJvbSBndWVz
dC4gKi8NCj4+ICt2b2lkIHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgaWYgKCAhaGFzX3ZwY2koZCkgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICB2cGNpX3JlbW92ZV9kZXZpY2UocGRl
dik7DQo+PiArfQ0KPj4gKyNlbmRpZiAvKiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCAq
Lw0KPiBXaGlsZSBmb3IgdGhlIGxhdHRlciBmdW5jdGlvbiB5b3UgbG9vayB0byBuZWVkIHR3byBw
YXJhbWV0ZXJzLCBkbyB5b3UNCj4gcmVhbGx5IG5lZWQgdGhlbSBhbHNvIGluIHRoZSBmb3JtZXIg
b25lPw0KRG8geW91IG1lYW4gaW5zdGVhZCBvZiBwYXNzaW5nIGQgd2UgY291bGQganVzdCB1c2Ug
cGRldi0+ZG9tYWluPw0KaW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCit7DQorwqDCoMKgIGludCByYzsNCisNCivCoMKgwqAgaWYgKCAhaGFzX3ZwY2kocGRldi0+
ZG9tYWluKSApDQorwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQpZZXMsIHdlIHByb2JhYmx5IGNh
biwgYnV0IHRoZSByZXN0IG9mIGZ1bmN0aW9ucyBjYWxsZWQgZnJvbSBhc3NpZ25fZGV2aWNlDQph
cmUgYWNjZXB0aW5nIGJvdGggZCBhbmQgcGRldiwgc28gbm90IHN1cmUgd2h5IHdvdWxkIHdlIHdh
bnQgdGhlc2UNCnR3byBiZSBhbnkgZGlmZmVyZW50LiBBbnkgZ29vZCByZWFzb24gbm90IHRvIGNo
YW5nZSBvdGhlcnMgYXMgd2VsbCB0aGVuPw0KPiBTeW1tZXRyeSBjb25zaWRlcmF0aW9ucyBtYWtl
IG1lIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGUgZGUtYXNzaWduDQo+IGhvb2sgc2hvdWxkbid0
IGJlIGNhbGxlZCBlYXJsaWVyLCB3aGVuIHBkZXYtPmRvbWFpbiBzdGlsbCBoYXMgdGhlDQo+IG9y
aWdpbmFsIG93bmVyLiBBdCB3aGljaCBwb2ludCB0aGUgMm5kIHBhcmFtZXRlciBjb3VsZCBkaXNh
cHBlYXIgdGhlcmUNCj4gYXMgd2VsbC4NCnN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCnsNCltzbmlw
XQ0KIMKgwqDCoCB2cGNpX2RlYXNzaWduX2RldmljZShwZGV2LT5kb21haW4sIHBkZXYpOw0KW3Nu
aXBdDQogwqDCoMKgIHJjID0gdnBjaV9hc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KDQpJdCBsb29r
cyBvayB0byBtZQ0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

