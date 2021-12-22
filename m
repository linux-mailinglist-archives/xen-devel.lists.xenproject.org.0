Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5B47CFEC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 11:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250743.431826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzynM-00055p-2f; Wed, 22 Dec 2021 10:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250743.431826; Wed, 22 Dec 2021 10:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzynL-00052v-Vg; Wed, 22 Dec 2021 10:24:27 +0000
Received: by outflank-mailman (input) for mailman id 250743;
 Wed, 22 Dec 2021 10:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rHP=RH=epam.com=prvs=2990e6cae6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mzynK-00052p-PH
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 10:24:26 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5238854f-6311-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 11:24:19 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BM9h11U007046;
 Wed, 22 Dec 2021 10:24:20 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d40pn8bf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:24:20 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7086.eurprd03.prod.outlook.com (2603:10a6:102:e5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 10:24:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 10:24:17 +0000
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
X-Inumbo-ID: 5238854f-6311-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3GmexDeCzmcyc9uUi4apO9kcwdha8S13vKC/60o3ADhBfv4+MxFdxqRqEfKQ9i1lh2uW7vku9x1G+fPDyXftRCalZ/YCKC/4D464r3SDLny0BC/PJ9/j513sI7LBGVnniCFTEgAZ9I175LZ/O0PCpcD43Udm5bCUiKDC66DSnx461QZogmiSPOUMizEnu6aKU4GUSQYTafSwMB8hRqtOksNbymd3Az2ja5EdSLTnIpxWGQ1zPxabPEPmisY8IbAGVaR41N4ASac1AWYtmnUS98igE6uhvT1umXcFISnRW+KtaIhBkcKwOFdVwYj8qRn/dJCOUHtwWMEqF2BVecVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5PtkfWXoRQtOyTDxDnfO/KUXEDhGAC4WR7e4jUvt4M=;
 b=DPdH1JGTO+mhH4oEMUbCYaAUAHA2UJvyHpQtUHv+4vzZlmhPIy6vo46O2Bpg3oTyOOecYdEo/4JWNgS//qV64G+uM0kJdCAZHVsBQn+/YKuWQ2nsPd7+P+C3X547ExNOg1eoEGGBfLHV45QEVZ7radvaZatfSpnhsUY21pbK7u5yHKRfNHjushE+AdHYa2BLQ3+9eyIwHKU3TCZ1QR8TL6K3BjMeYtY2e3sLIp55z73bMijcBhj87As14t6uYcIK57yWFFvq6cYPJL2IgBeJmqVhlwuJCrX1vHOxKkEM0R3PVvH1j5igyfW0so7WBp13UVjnrljGNgm4asCn39GWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5PtkfWXoRQtOyTDxDnfO/KUXEDhGAC4WR7e4jUvt4M=;
 b=DQzdfQlq50CtPGgaAJSaNuqfZDkmaHGfsXIJow/JopvogX7rENd4Z0/VXJi+sFywpropKKdL27Yyy07LIvs/YgtjzdxxQJaQmV9LbKk/huuwpHM2YqU9SdpxPMI3wp4ZI7lwlJBnrB0XkNTIJgTRDO5ltugDEkyunWmj1fxHksa9p70IOUKVZ0uHNi3YDuCWZas8yQfhIcnY+oroze7rE5L4DBZeEpsvzV1kW/AStTiqxKvkTujIxJFT4Giuk+6w7fYatrT69akYiJlKC40NZhUXxNiFP5ri4mVCKn37A38BY4VIVYIvxX/HLCmwAjDC69QjoT3PmUz/sQkx6Xp9aw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Topic: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Index: AQHX8M3K+4k+NJRDpU6TSJ1TAn9Owqw8KP2AgAIxjYA=
Date: Wed, 22 Dec 2021 10:24:17 +0000
Message-ID: <20211222102417.GA2882292@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112201653500.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112201653500.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c195bf4f-e26b-49a1-ab76-08d9c53535ef
x-ms-traffictypediagnostic: PA4PR03MB7086:EE_
x-microsoft-antispam-prvs: 
 <PA4PR03MB7086A3F01EF4B7E8AC6F8546E37D9@PA4PR03MB7086.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FTuq5cWyxnmIDkzvqWYZUadOfsdEKIKhigQ/5YIrS87+mswXniZ6a3WVB5aMqNj74hA3w+mGTFu2JDfy1nsdNvyvDycw1+cDi30ZLPfn3IKBkGaefeEZ0rSpn7qFD0MaAzEQKLfH45QBnZwoEScwsiokTx1/lyBxbzULdmUvoAsb85X0yJ7pMV1sdox12/2jj15w/WZZtDnrzDEXa9w93dgSWOGlu/mnKqNUCoRMCM8ZRfZ6WzRoDKodIoV1YTKJbUUfjhjMhcmRPU26q9hD278biTM6rEnyEJgQPat8t5df0ym7yndCXs4dYz2I+yfW7xexv9ljRTNl4bVmJNj2VgVwunDpLUrGWS9RdEtZuNlluVoXuGdfH1HhYUNv6p3Mz3w42NcvCuW+cMnYz3WSTQDiZ7tF+PND7iAeuBnlsexZDZVdUWHJM5izDjTf82HuqztDMXOSxni1NVXiZNfezCjL+Zj8Ex+0PGEX+OSH6padOWm2uo4aYgMJ5itecsjZxZ60jYJSAUxmO7ZSrBSer8+2Z2PAtzhDX8OR/mYIAiPKOfAaae6UreU7rggtn4tFJDybkETZLQxTmadtdVDv72beF03ncdqI69G/TDdKMgnm3+0rURsQmEgaTSxSFAHL9+K9ElfQm4J+ZZOrACHUfzO5GppCg6SOlirwualArfeJQnv4KfZ1C14mWJj92VAvUq5Eucz6ywB7ypj0BEF/oA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(8936002)(5660300002)(8676002)(6506007)(66556008)(2906002)(66476007)(9686003)(66446008)(6512007)(83380400001)(1076003)(86362001)(64756008)(91956017)(6486002)(33716001)(76116006)(66946007)(122000001)(38100700002)(33656002)(71200400001)(186003)(508600001)(54906003)(26005)(6916009)(38070700005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OjEndYYIr5oh7cqiYpeDXILuVG6JzJ4nD7efXSoigT29tfhYJmHIrc4bD4Qz?=
 =?us-ascii?Q?+U8V4YaocdjbptMG0sz6bPJZG109nkvG6Z60kWaFZavH4sF3vQo6ZhNxqIHR?=
 =?us-ascii?Q?hbfFLGTutY3BP/OlT2UIoylDV2hOlqIaIk28S5yNH3hRrjWCHK86YcGzp51y?=
 =?us-ascii?Q?OICdx8InfJSZHcQ5zC5bL4E4OKdIbBxFZZYbY9Y5l1H6RfKKRCqL5BpdCYMi?=
 =?us-ascii?Q?Syh/1oNOFJ3irt/mpe6NxbIbaP4MqFunG6n/S0jwGMYuK7qROrt63EZHeu13?=
 =?us-ascii?Q?od+3OfcW4/FdJJDouTpncgYiVLa6X9LWCpGeb1VFkS8cCaj2lsDoOFB4aoC0?=
 =?us-ascii?Q?KV1MGjPF1Yk0nc99nVQyQdbtwROqLMtnqKaZV8SIPVEEUHwr4ne60vy2OJSx?=
 =?us-ascii?Q?zJdnJ+U0GdrBibzkHOrdilhdNukm0kQY6r9ozOsuLYuxN9p0+5/5RZPP+9IV?=
 =?us-ascii?Q?b+29hcAR219EVS0JzW8oZV//hxEjphEWoyvMBpdwZ88TCfZSOKswfyA5AFx+?=
 =?us-ascii?Q?qpAxSEdDenRAZQZwwgWCq44QZnX9N8MsBA6L0/BXtmllwQKtslJKojDZ7H+7?=
 =?us-ascii?Q?fsNo/mHpXtr1ZuCMiDezHXaQQwtwTlGMG8+KLSYzn5XL0T5syKFtXWN8wT0i?=
 =?us-ascii?Q?YFjqos/PyForw1ZDEuTUIJGYqNXeS0g+IlgueqqopFGmoQRAIkQlIN6cB/yu?=
 =?us-ascii?Q?A0IAn7i3bRg90IPPzpHdP9zing+i0P2sUyelFtaA+3KfF7G4307a09YaY7kc?=
 =?us-ascii?Q?6x/mtBulTjaxePT1AkxTornIMmuqc6EMq/zcw/e+4/ygyx/9O08EppmCtnGA?=
 =?us-ascii?Q?FqkaD1KQJ5SP8xIp/GRv7a8NON22YOzKqCNOO7G7vLDIBTgsFA5SvV2WQmK6?=
 =?us-ascii?Q?NcRKR6/FTVoJJ3fXRvg2XPc38obA0X0tdXz90K5l5VmO4eM/T2BShsKJgf1A?=
 =?us-ascii?Q?Iirjn2MtBjgmbnVRlXRmsVAoiaqYpwSEs539d3mBkrbmondwqgwV/bcyIQg9?=
 =?us-ascii?Q?lygXuvWYWDGtNRTTghe4oiTAm8AQQTLsRdEneNhS0QZNyGaafL/PVkypR2I0?=
 =?us-ascii?Q?7s30yF35RC2UeLF2+RTcxrhhZwVRQqj/xOUhAEWQzMsxFsuOFep00Jo8W5zh?=
 =?us-ascii?Q?w0BNT3LNvOy/kdwiKtQRm57D1fGX4nUAxoSI3nragYZncS6+7c+E1pmFMV9R?=
 =?us-ascii?Q?/O5mjVA/OtpArn2EPtHn3LAKgQqWWQsnMNUjtzXNNHT11jQS1o35jNiutn+F?=
 =?us-ascii?Q?e5JBalkrP4jPPoADvpFBwnD37dWf+C2SdKkejav+JR5HByY5WQ+UEAavGrQE?=
 =?us-ascii?Q?dnO75FzaB3xWqXsuPKtNnjvXg1rVC0qTC0D7U6M7WMPdfCeW0H1UEC8DygDV?=
 =?us-ascii?Q?6PCZ0w/g1m9Arb2wNh7ryACj5tqfgIi/wGLUBep6yKbEhXZFGzHT/Cn/gqbT?=
 =?us-ascii?Q?sURCPgK+aGX12dkmngmREfxCqu8ouHGaNmpqAs627PVyhef8zb5QGit4XMRg?=
 =?us-ascii?Q?aHid4X7Z0/s+CE11Gr6dJ8E96shApnfaBrSQfLlj48RanJf6ki9Q4ZiT6REk?=
 =?us-ascii?Q?yC5jGOXvTM8SlPnVeUQYvKNIha0vzZl8hgEiX7JhpPXjXbwHTPxmvNPQnJQ0?=
 =?us-ascii?Q?J+QmUKt7sm3uHj/0dCQ8AWs7f7HnwERkp9V0o5Xk3NRILEFrZ0bo7ZtbCpOF?=
 =?us-ascii?Q?+vci4fS+qMf4erLWoohV6GhsGuA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CAD6633753F4544975CDB7C5C9BB055@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c195bf4f-e26b-49a1-ab76-08d9c53535ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 10:24:17.7848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBJL3fJnJPq+W1p9WM4Glcut8Ks8floPtpXTlRaRf6s+FLmsIkPyTGM/7nRS9y2UQ1mDL48d3I3b97jzITDF0N6kS9uoV0l2xJmMA16qJh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7086
X-Proofpoint-GUID: b8tat_gWcsNlzHWqtxWib89iB1zZCqWN
X-Proofpoint-ORIG-GUID: b8tat_gWcsNlzHWqtxWib89iB1zZCqWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220059

On Mon, Dec 20, 2021 at 04:54:25PM -0800, Stefano Stabellini wrote:
> On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > This enumeration sets SCI type for the domain. Currently there is
> > two possible options: either 'none' or 'scmi_smc'.
> >=20
> > 'none' is the default value and it disables SCI support at all.
> >=20
> > 'scmi_smc' enables access to the Firmware from the domains using SCMI
> > protocol and SMC as transport.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >  docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
> >  tools/include/libxl.h            |  5 +++++
> >  tools/libs/light/libxl_types.idl |  6 ++++++
> >  tools/xl/xl_parse.c              |  9 +++++++++
> >  4 files changed, 42 insertions(+)
> >=20
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b98d161398..92d0593875 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
> > =20
> >  =3Dback
> > =20
> > +=3Ditem B<sci=3D"STRING">
> > +
> > +B<Arm only> Set SCI type for the guest. SCI is System Control Protocol=
 -
> > +allows domain to manage various functions that are provided by HW plat=
form.
> > +
> > +=3Dover 4
> > +
> > +=3Ditem B<none>
> > +
> > +Don't allow guest to use SCI if present on the platform. This is the d=
efault
> > +value.
> > +
> > +=3Ditem B<scmi_smc>
> > +
> > +Enables SCMI-SMC support for the guest. SCMI is System Control Managem=
ent
> > +Inferface - allows domain to manage various functions that are provide=
d by HW
> > +platform, such as clocks, resets and power-domains. Xen will mediate a=
ccess to
> > +clocks, power-domains and resets between Domains and ATF. Disabled by =
default.
> > +SMC is used as transport.
>=20
> Would it make sense to actually enable SCMI-SMC support for the guest by
> default if the guest has any devices directly assigned?

Hi Stefano,

Previously we discussed with Oleksandr about introducing new dom.cfg
parameter, such as scidev[] lists all sci related nodes, which will help to
avoid extra domctl calls.

But there is still a question how mediator types should be set for
different domains? I know currently system supports only one mediator
type, but different implementation should be also possible.

For example, if we have to start dom0 and domd using scmi_mailbox
mediator and domU using scmi_smc, because our system supports only 2
mailboxes.

Best regards,
Oleksii.=

