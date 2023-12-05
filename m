Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DC80439D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 01:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647360.1010412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAJgK-00015t-Pw; Tue, 05 Dec 2023 00:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647360.1010412; Tue, 05 Dec 2023 00:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAJgK-00013O-ND; Tue, 05 Dec 2023 00:53:00 +0000
Received: by outflank-mailman (input) for mailman id 647360;
 Tue, 05 Dec 2023 00:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V90W=HQ=epam.com=prvs=67037769f0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rAJgJ-00013I-Ne
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 00:52:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff561cd-9308-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 01:52:55 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3B5080kb017069;
 Tue, 5 Dec 2023 00:52:44 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ushdvs6eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Dec 2023 00:52:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB8795.eurprd03.prod.outlook.com (2603:10a6:20b:553::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 00:52:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 00:52:39 +0000
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
X-Inumbo-ID: 9ff561cd-9308-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCaR55m2Hw+t/SESfVOTcWhuCzk1BzCOCrCt+d4OLlVhKAR18wNhikJLxctnFX6NKfG5H0EhAOHNqMkVpFnvQQQzaaYzwd62NyDSfWqbwQ60ISZzUCnXRH1s1FVrXmmlkvFEl9XyBvK948tzGVdbut9CoVKeLblGJTO8TgmN9mMB3cdVS4DRokxj2YW9D80ZtmgMmJyAt3QnO9Gs9o105f1JtvQnSBCM88CM2rajD7O9zitfao5b4yp94t9+Do4r2mbAkw1Kl+HMqdHCCVN0+b6wXBpsin3rYsoHM4ejF93aigEA6T4KoFJrOWrdrUcYar3nVFmUkmfUxOgu+KJIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqwPNLlBenU8Aph9VxiP0M2gcBQwU8At8YPIwJb06v4=;
 b=Ym6IIN/EgmmZJj6OzaL8bQ86F1cyMEr5lAcE0CWevvWgfhdzLFRxWvspvL81YuzY/uaRMT5iOkrvOdTv2CULWgtxjGWo0lVCMq5wXlAwGW8ZMK/rTWU5Rt7tILr5TcSRlkOZWjaz8CoO64rRSV+5G3ZaLewmZrpTnGQ9vz8gGrDBG3LDs0WFTvcdGo6LWF+TQTHjaXjbzUON43l9y4VOIrDORTAdhKhmHcFtvC18ObXgBmCyxcIqHCYTAhxTpCDlZZDIQqE9h9/YRUyJRjODkR/vlSEQhnKihMZSKzYqBkQIetl68LU0X8aEl63b5rgQhU9mhEMdUK2OV1EIdqbIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqwPNLlBenU8Aph9VxiP0M2gcBQwU8At8YPIwJb06v4=;
 b=ChK/xxbSt6zd8yt/TUhfD2FuMf2vIBBlQd0QPDb7tXv5s7Er/ecrFq34Y5esbFmUOXLN7OUzWzXPLEUuZLmhewzj5LpYMwkOgCzZkcSHvVlRaSlkkxO5QfToiR2dDb2hPqMSBBd1kdWiVB3tI+wqKghhrPjEj1vuXy6gkrPCrj5TUqla3GVL/u+QW1dnbImorfuM6O6/sqAEMRDcGeaHUM3k/PJexC+WF/xYGBFX/dCqfoP/a0mCGa4YcnoHKMXoDKqOM6an6VQQHpqrY7WkqQ6jXlkPb9lSnzC6UrLLUkWXOcZTT9dY/iCzTwpr3NWA+VjqeDNy84UK/mQCZWxt1g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Thread-Topic: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Thread-Index: AQHaJL6oz4wJTetDeUydVFKkkhEQHrCY0GYAgAEQN4A=
Date: Tue, 5 Dec 2023 00:52:39 +0000
Message-ID: <87sf4hsc6h.fsf@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-10-volodymyr_babchuk@epam.com>
 <8d44c8f6-aa12-4aa7-996d-68aa50dbec33@suse.com>
In-Reply-To: <8d44c8f6-aa12-4aa7-996d-68aa50dbec33@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB8795:EE_
x-ms-office365-filtering-correlation-id: b5f6c2c4-69f9-4846-fb70-08dbf52c7b11
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YVi/kzECH2oZgmRFmNIW+VR3SJrVdDKgTGczyemUq8ytQq0odNjLlQh0Alce6tcZ3nZuxoc6tusvVWPXo5ifhymT8Z08zxZuQDPd/POvjEcQKPu8Q4O+y6238S0JGySxycM7ozAdElTZ3iyq70LJtFHnM3Lof9m4zyDT060EXuwbFe9oPR0ywTx9v2HxXV9Xj3BACQbHDMtDhv/s9KnjLXCcqTxDmfUzfcXE52DJPyPUjhGF9xyTCjbIhZsAFeNSoiXJbIfC90hWj1acBSNUjkQTfFMcWryyCyCBjRmbNExVEswe3kW9pEQesX3jixbsJkp99MAQ/zt5C1Uv3pZBseCM+HNY3GSn1b53zHpgm7zCtYHTIyNC3S5LY81BL3Ru6LEnDVQdYgaqTX2Yh71cHguxYcDb8unLcSzV0BMDlUkQPMqBIz+FnX3BFEv3SIfFntXFDvrAP1K7ft9y+7+AXXCk9bjLR4Y8REWBQddVi1zxZUXDEJiv9BAgHBqk272I0Ip2HiHv6J/hQ1a7TV1UhkzFdyJvbH88r5rw40a0YoM5+q8neIGgDzHdKTWwQwes6OCKeeGsxTEjKasIsveZVmYDr7G+bPz8GCXq9ZajLZWu0p0jauS0UGJ9YJP/mXP6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(478600001)(6512007)(2616005)(55236004)(53546011)(6506007)(26005)(71200400001)(316002)(91956017)(66476007)(66446008)(64756008)(54906003)(6916009)(66556008)(76116006)(66946007)(86362001)(41300700001)(36756003)(8676002)(4326008)(8936002)(38070700009)(4744005)(2906002)(5660300002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VEy58aX4w6CdidsSYM1RJA5JbgbGQruyrPU03LtyUMlX5q1jkFNBVIfMVn?=
 =?iso-8859-1?Q?2eLMdBNWoCGrTl1YJ8urV40VtWDwLOvGb+lKG6wH1LFVYid420UTZqnCEL?=
 =?iso-8859-1?Q?h8Zs7QFRzyyEpfduJp+aEHx+Ux3U2vnKin08+//jmeavyuhDcXSMSSJGjN?=
 =?iso-8859-1?Q?ifYaGS1X3Eo83wV/RfKRsQp8R7sC+BcKOnkK+8Bkl+EzhxPjc+zlOeUnGx?=
 =?iso-8859-1?Q?7y5109PBtCjvrOC4MRpc9RfjjQUrBio+eiE2R74dOKzJ0b1MQkWxp2olAa?=
 =?iso-8859-1?Q?8slHKEnjbRrGlCIslSBCCyVizVee63LVpko1hmKQ1uBs8kARifeG1MeIpc?=
 =?iso-8859-1?Q?fsf0pdKedqehAYEjuRncFoUMweSWkHPrPe7ARuRbU0nU9bmnHOrj61+Pvv?=
 =?iso-8859-1?Q?0ooUllx2MmHCkQr4SK8FLdyEdpCzuj45QKjkDGCWjxcAFA0GgtTYF9YN9c?=
 =?iso-8859-1?Q?PWyF3pGBAiIMX+7h35y4ZfJdBzuVcXBCGn/kDVe9hCWVxVPKS4MUcqN7FP?=
 =?iso-8859-1?Q?mpO6DhwRJ/7lLwyiy2ayNgJPhAHTMg5P53Fs4OggCaXm2vZ99Qib7hQE9J?=
 =?iso-8859-1?Q?FGWoXmGxDUIDREKI6DFg9oDPnWvdpFnUalhghduc1jonXDprwH9HUKB7Gn?=
 =?iso-8859-1?Q?1D7Ro4PTrMOonDv7qgYeyyBH5xrFOTk0XSFg1HBaaRKk2Dp/QSbf9q6Hei?=
 =?iso-8859-1?Q?ciZ5OQ3A4Q8hvUdqIRDns+dWdZACTLvangV5kkY9TIsSTs8TqW1n/VQhNL?=
 =?iso-8859-1?Q?Y5br9NCCj9strw47Lj+Z1gUCAyoyCvWabXqU/uiG0XTdEw0eo8yGCTc6pg?=
 =?iso-8859-1?Q?agrRHMPDQA6pedzRWw08AT038CD2z38RFjIZhRpU9zXhAI5RNfIZqYDpln?=
 =?iso-8859-1?Q?MfrHGrnmDucvbAHqUs+2YS+0gT4Q/dIaInKdl+NU7JojdZA6tZAArvit0y?=
 =?iso-8859-1?Q?ij6xeXlGJg3fhs7Q6M9+jfpXIF1NKlQoTKRT5kcQ+Lh3qf/1N/srbMCT6t?=
 =?iso-8859-1?Q?0FyIgpKiqpT5RNca8NkHga2kGl6kQeoAkdLdxnLAybI6fCyoFm9QBWYzsj?=
 =?iso-8859-1?Q?UF5gG6lmYSIhmQ7E0gdUlgWxekMMVbjcpw6vyWGegZ1eHUrm4NyZ8ve+1T?=
 =?iso-8859-1?Q?SxR9wFmDueXlcu5wS62l9lokL0S6VDeMQKe9XxZv0/XAPlzuWc+u4GhhpQ?=
 =?iso-8859-1?Q?4pg8O2+j9Lk7Q5coMFgQl8PmUuyL4bCzWNM+HXpI33tPiSuTWAUcwr7LaE?=
 =?iso-8859-1?Q?qlQi6MgLPDh8stzQrLp8sXlWWQkp/fuVlTCTYg3rsFtbUHT1+bc2B6BTLb?=
 =?iso-8859-1?Q?VDv9ZutvTGmykHosTeB2wiBqjw7rWGSbkrP/ui8rHE9t9FMtys/vOD+vfe?=
 =?iso-8859-1?Q?ZEKqXExtx0kOTev57bTbQtomOphrBHnlKAC6/suubLZi1CbfccTKieFGNA?=
 =?iso-8859-1?Q?j5xg9y9+n2MVWYzjBC2mroEv3Vx2U5CAjFam77KoiKxCn0bXOqwtaFTsIu?=
 =?iso-8859-1?Q?UMUZcXaPiPrHQdFt7S9MrKjddgfOqSDgujjzK/onTAzvmEVetzH665HJDO?=
 =?iso-8859-1?Q?jtS7rO0HamtmHRivOd3Jgamr8jl6VNhi34KhSlNTquYtdFOsAbMPyTP9fY?=
 =?iso-8859-1?Q?YPUctyRoS7BCPYNFqKmPAtSSqiaOE9v1pwuxsG0E7eYjEXrYSW+fDxng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f6c2c4-69f9-4846-fb70-08dbf52c7b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 00:52:39.4852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuaXyPkLod7BFPKXRQS/pTlcd22y79uRvhy0Uj/xY/L76R2jaSOSqM0AiHdTbTNhYOomZFsi/fzVpCusTImj3cqzODEKapmnyFPe6e2d7J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8795
X-Proofpoint-ORIG-GUID: Z2ubGJ2HDvdC2xeWvKVttMP_bM5KJloY
X-Proofpoint-GUID: Z2ubGJ2HDvdC2xeWvKVttMP_bM5KJloY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_23,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312050005


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 02.12.2023 02:27, Volodymyr Babchuk wrote:
>> This function can be used when user wants to remove all rangeset
>> entries but do not want to destroy rangeset itself.
>
> I have to admit that I'm not happy with the name: We're not consistently
> naming all predicate-like helpers is_...() (see e.g. cpumask_empty()).
> May I suggest to use something which unambiguously expresses an action to
> be taken, e.g. rangeset_purge(), rangeset_reset(), or (less suitable as
> some ambiguity would remain, yet it would be in line with e.g.
> cpumask_clear()) rangeset_clear()?

Naming this is not my best trait, so I am open for any suggestions. From
all proposed variants I like rangeset_purge() most. So if there are no
other objections, I'll rename this function in the next version.

--=20
WBR, Volodymyr=

