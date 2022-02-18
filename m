Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19604BB407
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275184.470940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyUn-0003AX-PI; Fri, 18 Feb 2022 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275184.470940; Fri, 18 Feb 2022 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyUn-000382-Lo; Fri, 18 Feb 2022 08:20:05 +0000
Received: by outflank-mailman (input) for mailman id 275184;
 Fri, 18 Feb 2022 08:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mscz=TB=epam.com=prvs=4048df52bb=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nKyUm-0002sn-4e
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:20:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 918cfae3-9093-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:20:02 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21I805Bm026098;
 Fri, 18 Feb 2022 08:19:49 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ea7jcg2mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:19:49 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB7PR03MB3721.eurprd03.prod.outlook.com (2603:10a6:5:5::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Fri, 18 Feb 2022 08:19:47 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4995.020; Fri, 18 Feb 2022
 08:19:47 +0000
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
X-Inumbo-ID: 918cfae3-9093-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Om/3zlG346gMlExf/TNSV0yuxyGouFWmECsMobshYAGalY9Hr8o+j+qph+GaEOuftj0r+kKwaLFFMPwYWgBRpeiyR/1jXLYQsk58av28YQgGMdTyzDzqJfNQEN/Y0Mhx2sfGF1YGVFK84ix7Pt9ZqZ5mMR9XOpszLgc3QLW2Wp2hcyJIfCrfTsYd8HWKNBVdf+cynqPlJmFlCb17AP3dNJY8wKwi4PPhaeAdw/BB+IoNXDifEbyuvmev8TGFnG79RUbv0/O2RaAAZtpnZjZFEL1PVexjsVJOzy+93Yux/ZBDY1/+p7ZTL3UOBcxQ/lWaQQEV349xin83f7Rs/A9jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNuNB1oJK3Ejt8n4W5UHd8DtoRW5KIs+zSS07a3M5Ws=;
 b=Fet9fIz98+6uj9khjF2kyUFE6+xgkSBJ/x8Y9QHkXafol3gQszF7gGsR9Pq0OiHAhcP+jpeEIjEzIzwXciV8felMg6dj4CB3XhB6mr3IB5vWXT34u626pO0VTjWRIBmfwlOIekF5ARlOelzpmP31D4mikkqvDXqM8GafI6ODhHicnJka5kxKE25Bmlsr0WcLgPkdH1hxWOETV4AUBIHOk+0E7Sflvi1dQzw1SaXuL7w+J3l80VEuoQ067ZHpSgjUDEvBeYVbqWiXs/WHUjQsiYO6S2w3mVQ4LlgkKsc1tDmTtJEMjCyWimATVH0nJaCiQbNXKKC50toV2alHsEAKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNuNB1oJK3Ejt8n4W5UHd8DtoRW5KIs+zSS07a3M5Ws=;
 b=oa0FrPVo67z4k+vyAfMVb1cEoWOMH+SBUfnB01AM3YEKQLndv5WN3dhQJqG5POfTlY8b88Uld/PvJEEszRzKSW4I/vSIvIyCHoBr9FKv6+7QXFcO0X0LZ4YiR5AB+EEscg4O/PFlEVINH15VW/ruQt8ij7dQvJ6330WWp5EzS4MVqqxZaxwezT+N0P7BfupdUJgvic2rWzteTHn8AawJ8j/N3Dfcm4S3uadbGouqg120TWDG/6+wiMQ9OTRE8x6rNGLcS4y+HxuPigy5Xc0YoUwyDhIKfbJYWc747ZlO1TuHU00Qd4B5PuwTyzzEwcm/Ja0qiwvEuE4MmSfrFxWgyA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Nick Rosbrook
	<rosbrookn@ainfosec.com>,
        Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Topic: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Index: AQHYHRW3O86755dYV0qSgPdVO9oeMayX4d4AgAEkigA=
Date: Fri, 18 Feb 2022 08:19:46 +0000
Message-ID: <20220218081946.GA1482399@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
 <Yg5hPMd86GOPt/ni@perard.uk.xensource.com>
In-Reply-To: <Yg5hPMd86GOPt/ni@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f137eb5c-7ece-46e9-aeb1-08d9f2b76cee
x-ms-traffictypediagnostic: DB7PR03MB3721:EE_
x-microsoft-antispam-prvs: 
 <DB7PR03MB37215946BD2F037D1323E2C9E3379@DB7PR03MB3721.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QyQPJOBpTys/fv3VLqvoRXab8uKNXlUkgGmwAme85bbaGqwnb5/NOb2ptO0InlGnOq+W4tDZzLkz8u+/AJ1fLD8Mu19sC2BMwQrmrSHopYj30rCpxew3BzvEy7AR4KlrfcRZiP/EjV0ZYOeC1fN/D0mtxNb7ofaiv8jiSlS3323sMf/tUyqxP5RDtMk29bAexWHpo+ij4GuruXPsGHJSTP18rKBcNLPiqpYle4BpZNmgzaeROXjs+3rYU4RczPcBxHi2T6ieaSgDdzHSjWHkypUGdcoTG3lpWUnIYzlBShAkGE9Q6qqb1YCpEqwLF9RSfAFzmIYCoKK1xOnz9MXks4MHHeinzxLquuJXPnz8O2I9Wp+tN7n8PS5JeMHTt6JcJVSVuYv6DaqzuwmQJnSlGgs9qAv5W2mP0Hug+XzFnN6NFp/emjulng3wdnc7ECPqlsqplLRfFG7pRw+nFqqZsdG4OzNq1w/dM1M8AQ7kbESDTFjJUNiTMH51Hsn74IHX9m27AdlSwzUQho11f4fWnQXMnGEnrLrNRXBVJovm7+V0wKKfnVnOPOB5Le2Dy8hGAnlEOZaNDWIsSulKbHRQtHzpH7pzuep9AOh/lqZ1XxOCZNk117AWo7c5LaG1fwyh2pg7J8lervOteiz9WzRqnAM/DJZRGQlTuo5X9QMF84Sey9Vjec7xbzMxMUl5WjID1HjmWabsQgOUWC+GUaGeNQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(1076003)(26005)(186003)(9686003)(2906002)(6512007)(6506007)(71200400001)(8936002)(7416002)(5660300002)(33716001)(66476007)(508600001)(66556008)(6486002)(66446008)(8676002)(76116006)(4326008)(64756008)(91956017)(66946007)(6916009)(316002)(38070700005)(38100700002)(122000001)(54906003)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LoIg6EXxI+hrAlGsQeNx5Xr4ZCRHYfQZ/X2wpy4bMZRwbFtlvVfoXe5QHPp9?=
 =?us-ascii?Q?J4dkUgKgfXz0F6AB9aU9b9IlwKE2yFyFV/BdIZo7BSmuIvYSt0JQEXxSNZq0?=
 =?us-ascii?Q?Gc8KbMkMAaPKdvdh/q9Fsb80T9nObL+z0cXyTWzF12Pq5UYdKk2qRdgzP8z4?=
 =?us-ascii?Q?zKOyAEEVf01EXrqJrbuWUHxYZFq1PJ/ke4zqAZ61BLGNpIFKQgVgT3H1ZgEo?=
 =?us-ascii?Q?8oTuDXS2bnxQy+yzG8VcMPNlJv505av6LiOJUowLCOjgMRCkGQr/OwbJyXSW?=
 =?us-ascii?Q?DJDooQEaZIyCbkHsBaGb4F6PaG9GoFUjdZvsWttB4iV8bryR4up2chVw4U1W?=
 =?us-ascii?Q?NRlx0LRijVT+fmx7uDRWoyHV7sm4+ImygGf6PQgBsAt5f4lKjdcObOPq7xpK?=
 =?us-ascii?Q?jV6hWpoQCV5nLRiZooA5J1Z5o2VQnEvgakioPHDdL6XYJLMGILa58p6Ib2l1?=
 =?us-ascii?Q?SLFikcg3Ihd6CZ+sPrhDRICXMH3A2RzI8IHipGQ4/r7h2zmFLB0ziP9dhpSG?=
 =?us-ascii?Q?T1eGZt/R2HhlP5oL5SDfHZMKwvLHZX7WyM+Y/K5AzGXU03RC7SFNcji7nFhi?=
 =?us-ascii?Q?1Oz0lDqWzGXojw+fg/U2QCs4hY/7HJ/vt42GBUeQmHE9QsyY2TG74KXZ+/oK?=
 =?us-ascii?Q?tDgvxhfDLJ+JJhBR7rhgr7rSYHEBh0DB4cnDe6M54+r0sx4qmROAmNKmhF4o?=
 =?us-ascii?Q?b08FYHUyFjKKjjV+GwKqMJ8PwXxe4a54ZGThiSeQFHL+MD/tsiSpe6KYL0iF?=
 =?us-ascii?Q?Rdwl2Hptzruz4dhvoB2SQkOxofRfx8x/3o+LgLj4wqa4kEZY0Sdx0IzRnVC3?=
 =?us-ascii?Q?zAFc7sK+pQSFTsP5r9sHKF3W0d94pYamTWHyNR0U1JPk78Z2n1kh+yemv/b9?=
 =?us-ascii?Q?aKJnTimljMwR6xlLhEtNL1BIch4EXQINinqxx/4CZQ7Zkj8ckvOdZTeyWuKA?=
 =?us-ascii?Q?Lwa6g2wIKsw+bhntPYmXq6vPjsd5pV9Et9Pe54vOlgp2pLqd7NnuBmtOIAta?=
 =?us-ascii?Q?0RpFiv4ila/w6JE0+iY20SnHrZAmy2J8Sh5vAJgMYEE7pWZBXqzoKA5Cq567?=
 =?us-ascii?Q?iMLP76ZXlfOhSwR/A7eOjkGsC5/Gs42Y94hdLvxTMMIF/OEjFvYGbATo0Zng?=
 =?us-ascii?Q?CsbhQ2/QldTlZRolQs1r0GbOHJdUbTvPStR/SfdvVBdLYJSvjxpqSut3fGj4?=
 =?us-ascii?Q?vsm8CSuMB1kahYxrb2ji8SU+9D/uSVw5N3/d7e1jremT8OjYFFyLhDIEbeGj?=
 =?us-ascii?Q?joufZRPJPMuoI0uDdRHYArS9+TOyWk4dvlhPYhes7NBb3j2ylEZWXysZsKjp?=
 =?us-ascii?Q?Q7ChZhTg/OiGKx7fPB88cmJYvpids0cIUknrGNosnTtit+7etaIIc3viiil2?=
 =?us-ascii?Q?avJHM9FeZvAytDM7/QGMqfP7cLM3YtpHlvoOh+/nWNqEN50ErzZ2OKmksta2?=
 =?us-ascii?Q?T8gl00Y6CDtWYyXMEmhzSVvNIOpQC4a6BaZnLlvJMhPZENXxTMI+wyrAYDjZ?=
 =?us-ascii?Q?pwfWTbbZ9CxJvWcGrmjfy9Bl03piij/K61MBoyjJWZjoIfyUGel4L2PbQDWM?=
 =?us-ascii?Q?Oj4SWwuppdXPKybxqBouTeZZh9U1BiIZ/YsztyVrGgfwD0jfKXsoF7kpYF2n?=
 =?us-ascii?Q?Bx1xFYN5RZGuhAzfP2hu61aWRt1trk10nx0QHrCpOpa2T8Xgd9a9Amkoy3iF?=
 =?us-ascii?Q?ozL/W691q6IHHr9jF0PwP8XvBPI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F8CC0ACC87C164FB37D72FAF07D6AC8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f137eb5c-7ece-46e9-aeb1-08d9f2b76cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 08:19:46.9373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzXJV6V/xzqt9BWJc9PSGNrxMwnLCF4WaT6mTT7b3FvoMKMvZVqxJbgLrOJHePRiNBSI0MUQ3Ii9IRwsfT3CoUXe9y1OdM40udmcdv41zN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3721
X-Proofpoint-GUID: Y-JpYlJGLAiON5z9-Eai_HjwUK4URaBT
X-Proofpoint-ORIG-GUID: Y-JpYlJGLAiON5z9-Eai_HjwUK4URaBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=883 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180052

Hi Anthony,

On Thu, Feb 17, 2022 at 02:52:44PM +0000, Anthony PERARD wrote:
> On Tue, Feb 08, 2022 at 06:00:12PM +0000, Oleksii Moisieiev wrote:
> > If set, Xen is allowed to assign the devices even if they are not under
> > IOMMU.
> > Can be confugired from dom.cfg in the following format:
> > force_assign_without_iommu =3D 1
> >=20
> > This parameter has the same purpose as xen,force-assign-without-iommu
> > property in dom0less archtecture.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_=
types.idl
> > index 2a42da2f7d..1080966c33 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -564,6 +564,7 @@ libxl_domain_build_info =3D Struct("domain_build_in=
fo",[
> >      ("apic",             libxl_defbool),
> >      ("dm_restrict",      libxl_defbool),
> >      ("tee",              libxl_tee_type),
> > +    ("force_assign_without_iommu", libxl_defbool),
>=20
> As you are making changes to libxl's API, could you add a LIBXL_HAVE_*
> macro in "tools/include/libxl.h", they are plenty of example there about
> adding new fields in "libxl_domain_build_info".

Sure, I will add it in v3.

--
Oleksii.=

