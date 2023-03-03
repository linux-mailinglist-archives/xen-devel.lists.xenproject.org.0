Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD136A9137
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 07:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505542.778367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzEa-0005kA-JD; Fri, 03 Mar 2023 06:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505542.778367; Fri, 03 Mar 2023 06:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzEa-0005gr-Fx; Fri, 03 Mar 2023 06:49:40 +0000
Received: by outflank-mailman (input) for mailman id 505542;
 Fri, 03 Mar 2023 06:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvdj=63=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1pXzEZ-0005gl-Du
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 06:49:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f544de7-b98f-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 07:49:36 +0100 (CET)
Received: from FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) by
 GV1PR08MB8473.eurprd08.prod.outlook.com (2603:10a6:150:81::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.17; Fri, 3 Mar 2023 06:49:26 +0000
Received: from VI1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::88) by FR0P281CA0003.outlook.office365.com
 (2603:10a6:d10:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.10 via Frontend
 Transport; Fri, 3 Mar 2023 06:49:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT028.mail.protection.outlook.com (100.127.144.83) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 06:49:25 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Fri, 03 Mar 2023 06:49:25 +0000
Received: from 60784093527a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 617462C5-6C87-4D20-95CA-37398010B437.1; 
 Fri, 03 Mar 2023 06:49:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60784093527a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 06:49:16 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PR3PR08MB5660.eurprd08.prod.outlook.com (2603:10a6:102:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 06:49:11 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::f0ae:a3f2:8c03:2e06]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::f0ae:a3f2:8c03:2e06%4]) with mapi id 15.20.6156.017; Fri, 3 Mar 2023
 06:49:10 +0000
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
X-Inumbo-ID: 8f544de7-b98f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyKa7SWr/qSb7NDbwFkZ2OjWkZWYdmTCGs/hhb92EzY=;
 b=iczuOMxD3tCwQ6KPPd1lKovh9SZkXUepMmT6ihuKlHt1xiPA7I0lvjDDife6y3Xb7ZIAXMxiYRc01h9Hi7R1ieTMzZ6bqnEnZXZvoRDr+CtKjOKCnFIxfjPcoM4GE0GF6ENWXKFKBZv5rejm/dhJ6nV1Mph70vWlY9vsnF+RCPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daEmKxfqy97srSqO5zzj14+WsToKAGiO3YoMNboQF4f+kxbX1AXKU/Y8oagRklX3m+yo5iOr565QMdLe49wm8ZfJijeoiCXOsL6jsXFmQVLtnbCHCu2ybg9kYEVqSYcrzJx4m9XGLe13GDDqtAdnqwqO7XmhOdi0nsBPz6O/3DXwRFXHA5b71JAOh8AXM+KIEZgjoiRK2/kYz3TAfk1RrUAkIsd4+StqlxJnjGkCB0bLiUtB7Je2gfWiQQo1gT1DPL1yeR5255Cbv2ZgEGlOGwlEPkeZQ0ew+oOp0OtjYh1IWjWijqZSu3bG1RxQMGQS4j6nciJMDlrbsDaV2U4WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyKa7SWr/qSb7NDbwFkZ2OjWkZWYdmTCGs/hhb92EzY=;
 b=axwWlBWCcUU8UM2qgkcIByvhuek5/iXNfL1rc1YLHgZjX335lOUi0B8D+U4bLCgFqx6CuwGqqugvr6qS5QUOd8jS0UEVYvT9L9a+IgjodPY0b/e/rUXPtOkvl8j/P0xzxflh8BsyY0Sso2W9o8rkDRXuxFvCOSN/DHuqU3PYLGyOfdB9Jff0qdHqCF9DV8lnzpmagixXMYBUgFCl/MZEMJYXXuivJNJa0E6pazr0zB7jw+Gzz16CUhbOCxSyCEE6HFPDV4TZEA9dmgahBBvNxdU1T57fxl0ohMn6qgZKqydIz3I2c5lHPH5gTk+NcWViNQ1320G/+ajiYeAC138Mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyKa7SWr/qSb7NDbwFkZ2OjWkZWYdmTCGs/hhb92EzY=;
 b=iczuOMxD3tCwQ6KPPd1lKovh9SZkXUepMmT6ihuKlHt1xiPA7I0lvjDDife6y3Xb7ZIAXMxiYRc01h9Hi7R1ieTMzZ6bqnEnZXZvoRDr+CtKjOKCnFIxfjPcoM4GE0GF6ENWXKFKBZv5rejm/dhJ6nV1Mph70vWlY9vsnF+RCPE=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: RE: [PATCH 1/2] automation: arm64: Create a test job for testing
 static heap on qemu
Thread-Topic: [PATCH 1/2] automation: arm64: Create a test job for testing
 static heap on qemu
Thread-Index: AQHZTMHSDcd3HNBlaU66d8U8pXGhL67oS5aAgABSVOA=
Date: Fri, 3 Mar 2023 06:49:09 +0000
Message-ID:
 <AS8PR08MB7696EEB381C01A703B5E431E92B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20230302044421.136068-1-jiamei.xie@arm.com>
 <20230302044421.136068-2-jiamei.xie@arm.com>
 <alpine.DEB.2.22.394.2303021748290.863724@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2303021748290.863724@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 446D7E3DFA4D2C43A5FEEE3DB856F7BF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PR3PR08MB5660:EE_|VI1EUR03FT028:EE_|GV1PR08MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1511a81d-671e-4020-81b6-08db1bb36dd7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PVtYtkznSLorXcUkT8d1wcP0RoRAwzjMAKwf+BhOMUg1ew12S8sdFTQo57f4uHeWqnRrqZh66N5s7Ghy6I9y1eK7Vjhv/LYrOmetr6qKYKieLL1JMS/GDIbY00rHMOMEwV23IkAMdYG0KfIEo5Z/8MdICxZSKX8MehWv3Vd8qvRYqzRlKZMr7wM5Cp0yCtnSOt2i+PDLd3twbOjsgVYQStGkazljiB+METNv9ixGPVuj2AYPbbvTOELREPZdXJRpKMwyBxoPboEoZgJlhoLuXaPW9dNpzXxD3AHn2PFruWFjjGb0q09x2Re2N3FGDlsV9zrDCHfgn9Ofkg10Vm50jPZLSdgn1J1uBpFbYqsPzib4s/N7RhxzCZQMcjn+aFI5j4WXnUt+4GH49r1wUuWXA7t+AxtKh1NB+O9G7+Sd5JLf4kImDhtHWRQmOq+kZ+6llsHQV5fswUGd6tBN4bdAVhL3hyOo7+6fvyLWCHimfSq36hnLeAMXamenS1eqlZ2+E5BBj1v1XHXMja5XMf9DU6Xe/s4BAOR2BzHMQrkcdgWeW1+z0CgpaYkHrJEx1Nt1ZcDIaz6dfgubZEa8tmKooK82OUealKmLQ3KNq/WyCQVScwBN8TF9NcqE6Rg9/HfczcRhCWuE/FONPkaDWPXkn5cokz6Z/lxhqV3yHOhZXfFEL2RuzXtpCJAbgkkFRPiJddYJwKwmCZRce4GQgTxpeQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199018)(83380400001)(33656002)(478600001)(38070700005)(122000001)(54906003)(38100700002)(316002)(71200400001)(7696005)(186003)(41300700001)(6506007)(26005)(53546011)(9686003)(5660300002)(64756008)(66946007)(76116006)(8936002)(52536014)(2906002)(86362001)(66556008)(66446008)(55016003)(66476007)(4326008)(6916009)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12d8c2bd-37fc-4224-2f82-08db1bb363f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UyrR9fr0VX4N/1XqwPeGelCNnHbO/EvYNkyzHfbOUP6/769qsD0wJbuXgeKnjCmbcDPAYmEy+N+GS64su5al1RBxrivnh/dM/wB2OXKC64ed27hBlDeoMyB3pNcVR6nlzEyHWTo8BXZuHOH1fh92rjDq6l8KFxTLjWi1CYJ6RTL+H1x3vaIJYybzzEIxaBLc7yiq1zYtQpYG0vOIz9gLXfNOqP6NjGGCBQ2RyTm0MThyLJ/3iGfb0fcGezhLDU79iSEHF9P7qTc072PJYhLXXaPLBL/BGrQbjgZhwmxuwIt+R8qiouLZi/PBMicj91E5F1Fk/h5u69MNYn/5VEC9TUbgrIkpIB0vdY7iodmB9STGt0YsRl5tj0oOhm3LInBBb7YNCc+dEgMTSBbLN/VKQl051iY3bUYZkJzB3P/ES+TqLQ6xZXwjQNa/s+ax77veVbueZzo+OL/+Y//WiqBXe9YiV8ddNXNbn765zRsAPm68CPuEGaRPPZgKKW4pHzeEI+eZwjfKAkVFHOAkftFDSEGmlC7Bv50+9wtVi+Henr0Kh0uiKc//7AbYgK4J6HMOdMOs21UfuC4HueIqHmUB2hCmzfvR3BbG4OYWpmnEXSemxT5mYLdbcI9YFWLYbUzpMGOrFRQfcaze79RiuMnxkcZ6IPFXzJ0FBi1nE20I4sEb97+FX6pMLklMrEoNCAd8lJKyJwbWZVBdjnXP0j5aIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(54906003)(83380400001)(47076005)(316002)(336012)(478600001)(81166007)(33656002)(40480700001)(4326008)(82740400003)(36860700001)(8676002)(41300700001)(40460700003)(186003)(6506007)(5660300002)(26005)(9686003)(107886003)(7696005)(8936002)(70586007)(53546011)(55016003)(70206006)(356005)(86362001)(2906002)(6862004)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:49:25.7899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1511a81d-671e-4020-81b6-08db1bb36dd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8473

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, March 3, 2023 9:51 AM
> To: Jiamei Xie <Jiamei.Xie@arm.com>
> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
> sstabellini@kernel.org; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Doug Goldstein <cardoe@cardoe.com>
> Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
> static heap on qemu
>=20
> On Thu, 2 Mar 2023, jiamei.xie wrote:
> > From: Jiamei Xie <jiamei.xie@arm.com>
> >
> > Create a new test job, called qemu-smoke-dom0less-arm64-gcc-staticheap.
> >
> > Add property "xen,static-heap" under /chosen node to enable static-heap=
.
> > If the domU can start successfully with static-heap enabled, then this
> > test pass.
> >
> > Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>=20
> Hi Jiamei, thanks for the patch!
>=20
>=20
> > ---
> >  automation/gitlab-ci/test.yaml                 | 16 ++++++++++++++++
> >  .../scripts/qemu-smoke-dom0less-arm64.sh       | 18
> ++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
> > index 1c5f400b68..5a9b88477a 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -133,6 +133,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-
> staticmem:
> >      - *arm64-test-needs
> >      - alpine-3.12-gcc-debug-arm64-staticmem
> >
> > +qemu-smoke-dom0less-arm64-gcc-staticheap:
> > + extends: .qemu-arm64
> > + script:
> > +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
> 2>&1 | tee ${LOGFILE}
> > + needs:
> > +   - *arm64-test-needs
> > +   - alpine-3.12-gcc-arm64
> > +
> > +qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
> > + extends: .qemu-arm64
> > + script:
> > +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
> 2>&1 | tee ${LOGFILE}
> > + needs:
> > +   - *arm64-test-needs
> > +   - alpine-3.12-gcc-debug-arm64
> > +
> >  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
> >    extends: .qemu-arm64
> >    script:
> > diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > index 182a4b6c18..4e73857199 100755
> > --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > @@ -27,6 +27,11 @@ fi
> >  "
> >  fi
> >
> > +if [[ "${test_variant}" =3D=3D "static-heap" ]]; then
> > +    passed=3D"${test_variant} test passed"
> > +    domU_check=3D"echo \"${passed}\""
> > +fi
> > +
> >  if [[ "${test_variant}" =3D=3D "boot-cpupools" ]]; then
> >      # Check if domU0 (id=3D1) is assigned to Pool-1 with null schedule=
r
> >      passed=3D"${test_variant} test passed"
> > @@ -128,6 +133,19 @@ if [[ "${test_variant}" =3D=3D "static-mem" ]]; th=
en
> >      echo -e "\nDOMU_STATIC_MEM[0]=3D\"${domu_base} ${domu_size}\"" >>
> binaries/config
> >  fi
> >
> > +if [[ "${test_variant}" =3D=3D "static-heap" ]]; then
> > +    # ImageBuilder uses the config file to create the uboot script. De=
vicetree
> > +    # will be set via the generated uboot script.
> > +    # The valid memory range is 0x40000000 to 0x80000000 as defined
> before.
> > +    # ImageBuillder sets the kernel and ramdisk range based on the fil=
e size.
> > +    # It will use the memory range between 0x45600000 to 0x47AED1E8, s=
o
> set
> > +    # memory range between 0x50000000 and 0x80000000 as static heap.
>=20
> I think this is OK. One suggestion to make things more reliable would be
> to change MEMORY_END to be 0x50000000 so that you can be sure that
> ImageBuilder won't go over the limit. You could do it just for this
> test, which would be safer, but to be honest you could limit MEMORY_END
> to 0x50000000 for all tests in qemu-smoke-dom0less-arm64.sh because it
> shouldn't really cause any problems.
>=20
[Jiamei Xie]=20
Thanks for your comments. I am a little confused about " to change MEMORY_E=
ND to be 0x50000000".=20
 I set 0STATIC_HEAP=3D"0x50000000 0x30000000" where is the start address. W=
hy change MEMORY_END
 to be 0x50000000?


Best wishes
Jiamei Xie


>=20
> > +    echo  '
> > +STATIC_HEAP=3D"0x50000000 0x30000000"
> > +# The size of static heap should be greater than the guest memory
> > +DOMU_MEM[0]=3D"128"' >> binaries/config
> > +fi
> > +
> >  if [[ "${test_variant}" =3D=3D "boot-cpupools" ]]; then
> >      echo '
> >  CPUPOOL[0]=3D"cpu@1 null"
> > --
> > 2.25.1
> >

