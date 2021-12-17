Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09635478B51
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 13:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248605.428801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myCHg-0006eV-K3; Fri, 17 Dec 2021 12:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248605.428801; Fri, 17 Dec 2021 12:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myCHg-0006cZ-Gr; Fri, 17 Dec 2021 12:24:24 +0000
Received: by outflank-mailman (input) for mailman id 248605;
 Fri, 17 Dec 2021 12:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myCHe-0006cT-QK
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 12:24:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42360b8c-5f34-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 13:24:20 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHC8JaZ015046;
 Fri, 17 Dec 2021 12:24:16 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d0smvg9bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 12:24:15 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR3PR03MB6460.eurprd03.prod.outlook.com (2603:10a6:102:7f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 12:24:09 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 12:24:09 +0000
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
X-Inumbo-ID: 42360b8c-5f34-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+IhnQYTfF1T1LxKT4xPxLuM3DfPXdzCpI/YG/qHwjS7uBZmAHP6usRceGxjzv8d6NtNcvzMy3jkZvUm8WzVrtMDMbsghsHCN1Zaen6cUYuF8wfOHKKz/WgwKl87s+yeQzQkw3WJBfxH0C/t29XgBSoC2tiGSbXv2vlvubp8NcNPi15GY2k18m7jOfxk7OUUYuWv4A2DK0GRIpLCcLsDjR9R/JwFcZ2UCUADG+63Y9i52DX7+uDovW6e8XvBm8zRsLK4LT/RzIaWswK0clisdPlXCqkEhZJpmT0ErTTFXwqDjDYw79YXXk62EMvnLcf4hkLhW9l1lvMm3+Ai+ptDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Azdg69faNgmsBcOs2BhmE2AbZt+RVJBB0ZDap45MS3s=;
 b=ToVNUHZGANV5cA+wG+RHpRr+S9kCeyz2Ev5uaEi3TCEVqnTGNZ3fhVuumHwHhM0E9YUNWkaw0a1AH9RpWb9cLYW+xt4WZ32hG3UWK45EZCXqvOQNYdyckJxaBf5t2r4ZXhyQbD2Se9a06S+dQ7j5H367HJggIBgpW49/YNY/NJ0Wv0CoYUPgAjaQNeilcj+vT7uygJ1lZsEgQ+SY8t32RzVbMfZm0LA7mM5vM3XUmfQpNXlEXmWwVOBsa+R1G5+EUmN9/rnFLh8+i7uMP+I4bYktpJNFIoC81iFud4D/3NquHnyaZ3vPA88KYePv9pZ48SjTbdVp/o3zeqAvy3VqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Azdg69faNgmsBcOs2BhmE2AbZt+RVJBB0ZDap45MS3s=;
 b=bWmQziRdngw4o6GVCLP+qDCoE391mLj9/qNGu7DPYfvpz4xBuRdhceFrk5ShVnSmhVg8tr57GXn9jIL3UIzXL1Eq0+j19Ykwao6/V7BM9ZwzJmmKZ2H81CHcoZvVZcp8djPA2QtWpprBktTWoh3mVpHtFZt7+LBmc1hFkyeD3e/EYC0I95qochSvWOqekZP/csaU25cQarJ6PVW6Kuvh04X/cUdEiXLLsJ4eu7X8nxm16HKjEvbWevBV4f9uyM5Yw7aeArnAyxTET2ap2Lq5qhX0RE8zdY1ZOzftH1asRg9uv9KvDIHxpztnofXW6AeSxp2oUc4zfaDhjsC+9CCrBQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC v1 0/5] Introduce SCI-mediator feature
Thread-Topic: [RFC v1 0/5] Introduce SCI-mediator feature
Thread-Index: AQHX8M3EbPa1dWpku0ybFf1q9+Bnxaw0R3oAgAJY5AA=
Date: Fri, 17 Dec 2021 12:24:09 +0000
Message-ID: <20211217122408.GA4023239@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <c8739251-3e13-2337-0ae8-cfae59397251@gmail.com>
In-Reply-To: <c8739251-3e13-2337-0ae8-cfae59397251@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d335c0c5-7fb1-4c10-7166-08d9c1582045
x-ms-traffictypediagnostic: PR3PR03MB6460:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB646053CE24D202DA29D5B10AE3789@PR3PR03MB6460.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qbJH4M29YeaF96VmKyyQFx3Zae/u68kgrGs/jjoyPAAI8Jd2hQzzex3QFHOnoNcvHsvTftcGHbdKYEK8+9m96ZwSxppunlnpDMLt3oy53W4tF1absvtToaUTo6dMesqBuPCC4AfQOunibv2x4+ukBGcN1p8zTFix6z1gWjvkwgh4L2lJEyILuZnshWekr1g83Wrqh5dJ5J8pue4NFiWLiMLbfElTQeDscKhPmubPmJqBjT5rvpdEg4l//HdHwFrqiJvFrACRwXLN+m/uVdi2N26/FGtM6xW61HKMfxQTgb40uAExgMs09C/+6WsfpWL3pj7PtmYzckUM4apiWaDxXihBF3LBeHLMYx78whzaCA7YCaNlFPiJ+bOKTd6qT9LxyavFFYSF1aENMvDKoV8YTYVQf9Vjbx9/HyVeTQTx2Ydst7IxxqHQYrEAybj9By37oeEeM6M0tHwND92nnK/Q3TntFD1R6pgL/j0xwBiRZeQHGAecHDkmnjCAOXJM2aFwkYdZ8ioK4GZXbhs0ntbAMpuioznVQ/rExNX49JASHynGQExUW0pW3nyHYliYX3Cg3IEhAOa7sftumS+0XO1HZus5D81+YSIqbgByp/t19LoGfMXWzuHXTgwWHQcSTCaHnhUa/4aEXFytUBVBzLXkusi/BhEw5I7K6zmtnm2uahQNYpngxZu/cAaNyUUEwvqUdOYP5rBrusOyFt1PmCnkjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33716001)(8676002)(1076003)(5660300002)(33656002)(2906002)(38070700005)(6506007)(6916009)(316002)(122000001)(8936002)(38100700002)(83380400001)(66556008)(54906003)(64756008)(76116006)(71200400001)(66946007)(66446008)(7416002)(66476007)(53546011)(508600001)(91956017)(186003)(26005)(4326008)(6486002)(6512007)(9686003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?157cJKdZkVruoP0suA5dR+u4M5yMvnc1dz2VaL9C2hftyoWWLX1UXIAWKlrV?=
 =?us-ascii?Q?sTRyxiy2FHqV/Hmzs/iTR/clxajrKOd1IufYn0E+nxzMlNjGDQ0p1LX/1L07?=
 =?us-ascii?Q?NzraEt5nbFlbhTdLFGUvsjTewlAh0EqXB5YfYFFmnXVBUMa2eFShFcdq7kv5?=
 =?us-ascii?Q?jVdC0LHVFwIakAoMLZHoOh/5qGmD1YArdAjDrwoN3pb5WLJMhgHReEvc+d4p?=
 =?us-ascii?Q?7yvFEIYfKPK7mz/5TWVdVhC73WCbSsx4SI+zlONOESxIAJulKhSNfTlBJfiV?=
 =?us-ascii?Q?hXnVUMinoRZotXgCneqi4zm53wHScrK2AUXlIBB06rerPI0fkgBUE5LhCzyd?=
 =?us-ascii?Q?TtIPmTEgTK2H9Ik7uf0xvZzlIE8arc6OLNJvNdfPUkm+miD9vndSaa0+4Fz8?=
 =?us-ascii?Q?+AIN63rOly7aPzI+d48mliWAjIKPxOqC2zaijRN8S9DouabAdV7ShVUrWF+U?=
 =?us-ascii?Q?rVah2R7lG9QfJmBzrB8wQSgxGf0tVpbzASnDXWYYvnjZ2hLxStT/R5b6cRvT?=
 =?us-ascii?Q?rMgt+BCQEsCMdlWfPprig7S2NFiNbPdZdo1j107fxTwgC+IrkZXoykD7keN/?=
 =?us-ascii?Q?wn2MTXVx1TNnqnsoMqjurHN0jkutD+VrhoQUKoz7In/wBjSbC9LPGpkZtpz1?=
 =?us-ascii?Q?ybTLdTinktDtFwwFTWFQ0tVpFr06p0tXA7PPSGDGxn8F3e+IZh046IynUb4l?=
 =?us-ascii?Q?dei/W2j9DtIqzKtVAOWIVAeu2JETuiNFOpcMlSDVCWsIirXUTbEUf/6UQJrg?=
 =?us-ascii?Q?Q+USHP27mn0H5NW6vUgMU8IlfQNTtNrCa2QyfoehFGalEkDX3TBR8yoGFWu7?=
 =?us-ascii?Q?3s0+y94zwWp+trO8OmDTA1w416mJ8+w3jYmDYtk0ry4hZnEbcT+sehjrt5Iz?=
 =?us-ascii?Q?BR0foKxr8ELBXyVK2OB88LpLIRqp757uiNDVXi67roAKjnx+wKrcAKNFuLGG?=
 =?us-ascii?Q?WbYMLV4kbYOOg2+7DlSKxEkbgreZJk9Xaq9zyKGu+pXvro9NhjH9WJUJiod/?=
 =?us-ascii?Q?4Ms1z7azJTPwwtxMEiqEl8WLK7pXFO3Dop525qsvjctKN3LT7oRdr7ZtIJoS?=
 =?us-ascii?Q?EzbIFUgkpoT3JPxNnd/PK0SwaqqfUer10COVUuScRmc6S08SFWrOIBAJytFE?=
 =?us-ascii?Q?2rAznJkl3dYR6PGq4quiKJOceBmR+iR3oOx/P/LYXKOsUXB5/yAmtEdYhdww?=
 =?us-ascii?Q?sVhfZhxkMhiYldt/FD4kdhEKQ3msv5cm3MENl9eD6QGFNuxI1aUn7bv1krk6?=
 =?us-ascii?Q?uVIqI/BlTaB/6XAhtYh8LNZYicSPx+jANWaDblfwKD/3k+abJcRPt9CFYjTG?=
 =?us-ascii?Q?6LO4LBrIRbd+INZtSmaFdABGHd6OuSLrVDAihU31fzKljClHN6H8nTWsy9Ku?=
 =?us-ascii?Q?FaAXJN5SH6lEdVyVmHB67KVLt6LVv+oy2HRzMcqOP2bEKLYvcbirgQAl2yiZ?=
 =?us-ascii?Q?f5jftMVigeCLtyOk3Uz7HO+Gqf+u9E57mQwQoDnEy8NdAgs09H2odoNAn7ZL?=
 =?us-ascii?Q?d/0tlPUVlXnEe9Bcaix9b8VhoC6wDYhX655Jg3erkZbmzRyrV9aQZeBIaNgI?=
 =?us-ascii?Q?9J3MfqW15dCf+cwVKzvcXOXL+ds7x6Jr8qCLR2rm9FMRW40aN5OpJtcWnmBb?=
 =?us-ascii?Q?lf8/G+ulR1/eXahWJk1Q/MUErf1uvtWSGQJk2sSqTH8NWKlpOdvWU3sh8l+g?=
 =?us-ascii?Q?OJNK3DFCYdDNSHyxSQsGDiXg5LY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D594ECE64A71349BD54F986085210F5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d335c0c5-7fb1-4c10-7166-08d9c1582045
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 12:24:09.1403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPiiohyQr9hIyVDKODEQcRnUbNjsEj8N1rZzRk2IeyqniFxiBYCFPLolflCSXzX4fCgh585VJPfomVsyg67gCHYh9bA3TBkKgSerRSvqanY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6460
X-Proofpoint-GUID: YfAqsaVos9rx4HEd2PexSV-LTmzjCz5y
X-Proofpoint-ORIG-GUID: YfAqsaVos9rx4HEd2PexSV-LTmzjCz5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170071

Hi Oleksandr,

On Thu, Dec 16, 2021 at 02:33:28AM +0200, Oleksandr wrote:
>=20
> On 14.12.21 11:34, Oleksii Moisieiev wrote:
>=20
>=20
> Hi Oleksii
>=20
> > Introducing the feature, called SCI mediator.
> > It's purpose is to redirect SCMI requests from the domains to firmware
> > (SCP, ATF etc), which controls the power/clock/resets etc.
> > The idea is to make SCP firmware (or similar, such as AT-F) responsible=
 for
> > control power/clock/resets and provide SCMI interface so controls can b=
e shared
> > between the Domains.
> > Originally, we've met a problem, that the devices, shared between diffe=
rent
> > Domains, can't have an access to HW registers to work with clocks/reset=
s/power
> > etc. You have to pass cpg to the Domain, so the devices can access HW d=
irectly.
> > The solution for this is to move HW controls over power/clock/resets to
> > SCP firmware and use Linux-kernel SCMI drivers to pass requests to SCP.
> > Xen is responsible for permissions setting, so Domain can access only t=
o
> > power/clock/resets which are related to this Domain. Also XEN is the me=
diator
> > which redirects SCMI requests, adding agentID so firmware should know t=
he
> > sender.
> > SMC is currently used as transport, but this should be configurable.
> >=20
> > Here is the high level design:
> >=20
> > SCI (System Control Interface) feature can be enabled in xen_config:
> > > CONFIG_SCI=3Dy
> > Mediator can be configured:
> > > CONFIG_SCMI_SMC=3Dy
> > Currently, only SCMI_SMC mediator is implemented, which using shared me=
mory
> > region to communicate with firmware and SMC as transport.
> >=20
> > Xen scmi should be configured in the device-tree.
> > Format is the following:
> > 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> > 		compatible =3D "arm,scmi-shmem";
> > 		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > 	};
> >=20
> > 	firmware {
> > 		scmi {
> > 			compatible =3D "arm,scmi-smc";
> > 			arm,smc-id =3D <0x82000002>;
> > 			shmem =3D <&cpu_scp_shm>;
> > 			#address-cells =3D <1>;
> > 			#size-cells =3D <0>;
> >=20
> > 			scmi_power: protocol@11 {
> > 				reg =3D <0x11>;
> > 				#power-domain-cells =3D <1>;
> > 			};
> >=20
> > 			scmi_clock: protocol@14 {
> > 				reg =3D <0x14>;
> > 				#clock-cells =3D <1>;
> > 			};
> >=20
> > 			scmi_reset: protocol@16 {
> > 				reg =3D <0x16>;
> > 				#reset-cells =3D <1>;
> > 			};
> > 		};
> > 	};
> >=20
> > Where:
> > &cpu_scp_shm is the shared memory for scmi buffers;
> > 0x53FF0000, size 0x1000 is the platform specific free address, which pr=
ovide
> > space for the communication.
> > &scmi node, which should be copied to Dom0 device-tree.
> >=20
> > Device configured to use scmi:
> > &avb {
> > 	scmi_devid =3D <0>;
> > 	clocks =3D <&scmi_clock 0>;
> > 	power-domains =3D <&scmi_power 0>;
> > 	resets =3D <&scmi_reset 0>;
> > };
> >=20
> > Where:
> > scmi_devid - id from the firmware, which is assigned for AVB.
> >=20
> > During initialization, XEN scans probes the first SCI-mediator driver w=
hich has
> > matching node in the device-tree. If no device-tree was provided, then =
the
> > first registered mediator driver should be probed.
> >=20
> > DomX should be configured:
> > Device-tree should include the same nodes, described above.
> > &cpu_scp_shm should be altered during domain creation. Xen allocates fr=
ee page
> > from the memory region, provided in &cpu_scp_shm in XEN device-tree, so=
 each
> > domain should have unique page. Nodes &cpu_scp_shm and /firmware/scmi s=
hould be
> > copied from partial device-tree to domain device-tree, so kernel can in=
itialize
> > scmi driver.
> >=20
> > SCI mediator can be enabled in dom.cfg the following way:
> > > sci =3D "scmi_smc"
> > which sets scmi_smc to be used for the domain.
>=20
>=20
> Great work! I can imagine this is going to be nice feature once upstreame=
d.
>=20
> I am wondering, would the Xen (with the required updates of course) also =
be
> able to send it's own requests to the SCP? For example, to control overal=
l
> system performance (CPU frequency)
>=20
> or other let's say important power management task.
>=20

I think yes. In current implementation Xen register itself as
privilleged agent and use it's own channel to request=20
which is used to get agent configuration and process device permissions.
I think this channel can also be used to do some configuration tasks
via SCMI. But this will require updates.

--
Oleksii.
>=20
> >=20
> > Oleksii Moisieiev (5):
> >    xen/arm: add support for Renesas R-Car Gen3 platform
> >    xen/arm: add generic SCI mediator framework
> >    xen/arm: introduce SCMI-SMC mediator driver
> >    tools/arm: add "scmi_smc" option to xl.cfg
> >    xen/arm: add SCI mediator support for DomUs
> >=20
> >   MAINTAINERS                       |   6 +
> >   docs/man/xl.cfg.5.pod.in          |  22 +
> >   tools/include/libxl.h             |   5 +
> >   tools/include/xenctrl.h           |   3 +
> >   tools/include/xenguest.h          |   2 +
> >   tools/libs/ctrl/xc_domain.c       |  23 +
> >   tools/libs/guest/xg_dom_arm.c     |   5 +-
> >   tools/libs/light/libxl_arm.c      | 122 ++++-
> >   tools/libs/light/libxl_create.c   |  54 +-
> >   tools/libs/light/libxl_dom.c      |   1 +
> >   tools/libs/light/libxl_internal.h |   4 +
> >   tools/libs/light/libxl_types.idl  |   6 +
> >   tools/xl/xl_parse.c               |   9 +
> >   xen/arch/arm/Kconfig              |  10 +
> >   xen/arch/arm/Makefile             |   1 +
> >   xen/arch/arm/domain.c             |  24 +
> >   xen/arch/arm/domain_build.c       |  11 +
> >   xen/arch/arm/domctl.c             |  15 +
> >   xen/arch/arm/platforms/Makefile   |   1 +
> >   xen/arch/arm/platforms/rcar3.c    |  47 ++
> >   xen/arch/arm/sci/Kconfig          |  10 +
> >   xen/arch/arm/sci/Makefile         |   2 +
> >   xen/arch/arm/sci/sci.c            | 128 +++++
> >   xen/arch/arm/sci/scmi_smc.c       | 795 +++++++++++++++++++++++++++++=
+
> >   xen/arch/arm/setup.c              |   1 +
> >   xen/arch/arm/xen.lds.S            |   7 +
> >   xen/include/asm-arm/domain.h      |   4 +
> >   xen/include/asm-arm/sci/sci.h     | 162 ++++++
> >   xen/include/public/arch-arm.h     |  11 +
> >   xen/include/public/domctl.h       |   9 +
> >   30 files changed, 1485 insertions(+), 15 deletions(-)
> >   create mode 100644 xen/arch/arm/platforms/rcar3.c
> >   create mode 100644 xen/arch/arm/sci/Kconfig
> >   create mode 100644 xen/arch/arm/sci/Makefile
> >   create mode 100644 xen/arch/arm/sci/sci.c
> >   create mode 100644 xen/arch/arm/sci/scmi_smc.c
> >   create mode 100644 xen/include/asm-arm/sci/sci.h
> >=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko
> =

