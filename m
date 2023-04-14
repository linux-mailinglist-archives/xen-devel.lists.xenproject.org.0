Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9A6E1A05
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 04:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521013.809249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn8sm-0000FT-8T; Fri, 14 Apr 2023 02:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521013.809249; Fri, 14 Apr 2023 02:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn8sm-0000C6-5V; Fri, 14 Apr 2023 02:09:48 +0000
Received: by outflank-mailman (input) for mailman id 521013;
 Fri, 14 Apr 2023 02:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eyEl=AF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pn8sl-0000C0-7z
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 02:09:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe02::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1d9db4-da69-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 04:09:44 +0200 (CEST)
Received: from FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14)
 by PAXPR08MB7599.eurprd08.prod.outlook.com (2603:10a6:102:23e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.46; Fri, 14 Apr
 2023 02:09:42 +0000
Received: from VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::df) by FR3P281CA0038.outlook.office365.com
 (2603:10a6:d10:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.7 via Frontend
 Transport; Fri, 14 Apr 2023 02:09:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT056.mail.protection.outlook.com (100.127.144.95) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Fri, 14 Apr 2023 02:09:40 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Fri, 14 Apr 2023 02:09:40 +0000
Received: from 84de44484703.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 734486FC-61CF-4B57-B731-BE6F4D2464D7.1; 
 Fri, 14 Apr 2023 02:09:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84de44484703.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 02:09:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 02:09:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 02:09:31 +0000
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
X-Inumbo-ID: 6c1d9db4-da69-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K66/NOBOzweoXpUKEC2T8xfXCJQM7bOv4DduEzKc9A=;
 b=dk/6pKjfJxDt7qRUG2kkSolCHVRlhsjYKxyYVspZ8GNGdoGgwtoGQbMys9fYd7RLUvnxnCOii0gT4eclf1n24RrY8m7e5dBsElm7DE6Rybb4V2PGj56Kfhq3laS8mVqyrPxcZ9CaFjx3qSFeP1TxjNXgzHgc3SC3vDs8NWACr4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fy1E6sTz9XEvrZFc/HlkUjpT0IkQ5wPFlzUlmVlPOkdPVYr/+/0w+uEFkRNF8/bNXzGRZMkzZ0bbt9VG9mk4meb1ZEUnjqLtAUM/C9+WplE3Xpy7H4Ff04hiVg4XJ4PyBjuoMQe6MfGNPPM2IPkhLaWjKHq5wdfTUiyHU0eFf1q5KiEQrrsQgCTBGNb7IEgAcgjSuBMB6WCVn4mtnxt6pY0gkJ7yodyu2e4qZHoRHUOnmLS39N9AtvQM2KF83fyQbSdAiC1TZMYTKjv38x0DjFoN7YFUOMYnQvKdUEFFOw6OkeDLDBrW3//w2lT9gZJ5VTxZSAy09rJYqkjSbov7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K66/NOBOzweoXpUKEC2T8xfXCJQM7bOv4DduEzKc9A=;
 b=aiwpKwOoUJY5nvmd+cqsD6r9woTfjRS8PZWmLubz6nm0BfYXUvPXFM0dofTzyirqD5TF6P52+vKqO1eOiOwfJGVQQ5tam6iH0wa+/yFpGPtlzdRSN0Xxb5i1929jo0RDUUM/fXJfBIKCdcVVn7DphM3ZF2ZPezajofQx9rQmTTdjTWGzeVhBxqr19VnQR8lCL6gWNDcafHnre7pekT+PLPRTYZR2SSxFn/jeXYb6C4UFilki7KlgUgtpZVIogiJ9xE1ZVY0tyW8ZVHUn4VhUvuIGSKLU61QPQEPM5LeHiNkaFBe9yZXvK7UEMJrt1iitHlYg3eZfP1SUMuW19NQkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K66/NOBOzweoXpUKEC2T8xfXCJQM7bOv4DduEzKc9A=;
 b=dk/6pKjfJxDt7qRUG2kkSolCHVRlhsjYKxyYVspZ8GNGdoGgwtoGQbMys9fYd7RLUvnxnCOii0gT4eclf1n24RrY8m7e5dBsElm7DE6Rybb4V2PGj56Kfhq3laS8mVqyrPxcZ9CaFjx3qSFeP1TxjNXgzHgc3SC3vDs8NWACr4g=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>
Subject: RE: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
Thread-Topic: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
Thread-Index: AQHZbKpCBmKbFexulkCLTCM8AA6Zz68qDq7Q
Date: Fri, 14 Apr 2023 02:09:30 +0000
Message-ID:
 <AS8PR08MB7991D4C1352B785D505AE63892999@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-13-vikram.garhwal@amd.com>
In-Reply-To: <20230411191636.26926-13-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CE209F4D9041C34993750FB80751A88B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5520:EE_|VI1EUR03FT056:EE_|PAXPR08MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 645e1be3-bc12-46c2-412b-08db3c8d4e9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8//2IIWN6YZLqD9LMG3rU8d9L666/PPPmTIyqKZwNETnQy9M+z3Njnqpdo7+O+MGde9effTC2qa1bUe8zSUOQ2BBdVUsc+9/gbCXHJbJcKXQnr8mPLneGjwKH6xbP8HFFCmgH7xRyQ/I6FXPIncvAT5BC5AriWr/Th/1n11f9VRuyeGpxrq/rz1Dd7bszb9iFkJ8fVf8MutSDUss/gY/DLCOjAKrVidy5PAPp34nHO8cqRBHTEiUAnu+ZKTb1w5zOqjbiP0s6C9WXXUAR5v8mmjMF/Ryvbb35irIlwkNqDqgEek0IPT8acN9qjdsy5aNr+66n7bXK1mkPPDUHQyuZ98YWhG/WIh9wD3K6r24BYj4g5MCugEJVC0cuOtE5mqtM7WzmGlD5YQeiToyqGmdlXXktjO8Mdf2F+oqmfJ3ClS1MeQoU4ihI7hJ+RduIjE6SUOrKJ+SpkDV3VHJLsONr8LnpEWpiN+CmAyjCBIhkU/If2xj4VHsqkxU01wPRO6klWY+YKr6/hj6tY8y572k8gxyEAOytTO4VGM7tT+0gcgTX/ctn60GNpGUyh9pOEwgs25h59cwWo5ckG67Dd7qTIFkQAPlIDqR8BWtMImFggWz2SWJ/x/LOig/yhlxn9xD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(451199021)(478600001)(71200400001)(7696005)(186003)(66446008)(110136005)(64756008)(26005)(5660300002)(54906003)(6506007)(9686003)(2906002)(316002)(76116006)(4326008)(66476007)(52536014)(66946007)(66556008)(8676002)(8936002)(41300700001)(122000001)(83380400001)(55016003)(38070700005)(38100700002)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	497de3b1-0aba-4402-df66-08db3c8d48a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kQmJYxlkEmrbyNc7F8DKThMXbq0wgv5LW7Cn7koPvnPs/wzGpB7Y/QGPNbtwKMCgs3uGWTG5h5eI3rb+HPOvcRR5e6IFTrr4sIkjhSq3OCRZMD4joiHbLrhXBqDx+S3k5WnA3c9t+TtUxDKADT8nTGlJ0tqmjTe4Y9k/PZp+23nVadfOsXY9oATtbmWBSoZQBcbEpkf3LTlQssl5YPnCQV7cb9rissUWb1QTMs/dUg566y+zerxyVoTrbiIfBzp4FZVDdvUzzA0IoycBUZrAHy7xXeXzsLOiWn7dXLq0LoAoJJ+3qI+cHE+Mf7vgL6rx26JVD08LBiTNcMK78J03BKyuBqfbnl5AiQXj6GHD1P2UQBa6vUeh1Cp6WjQW5umqSV8bBjt6J5Vp8/vsi8whba3ib7d8/5rmcFSva9I+v94Zk2XBajPHDuPy0jORPGggiBEfnmXrSaAflhhSuwV35MimRfeOy5GweBSu6nZAnHNTQgeVnRGdTPqjhh0vg5Y6OaeTuY7oRzyVpKKNevjkkD5CMnZKVlG1ekks0UA0p+5lWJyEsIDVuPmte6+wZAw28sfBkObOJqlPfk5e3wlcs6YGoKhJ0whc3kPwN5IOAJPnrEfQamz5+4zc6Kyt63QFApopwxEN3sTi7NYehlTK1MfAqetqNBRT5+a+rB0YdAazvMrMk5IVlW8smU84D8dq+B65pGpT/BvQo1XRhsMvdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(70206006)(8676002)(70586007)(4326008)(41300700001)(54906003)(7696005)(478600001)(110136005)(316002)(86362001)(33656002)(47076005)(83380400001)(336012)(9686003)(6506007)(26005)(52536014)(5660300002)(2906002)(8936002)(82310400005)(40480700001)(55016003)(82740400003)(356005)(81166007)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 02:09:40.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645e1be3-bc12-46c2-412b-08db3c8d4e9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7599

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
>=20
>  Dynamic programming ops will modify the dt_host and there might be other
>  function which are browsing the dt_host at the same time. To avoid the r=
ace
>  conditions, adding rwlock for browsing the dt_host during runtime.

For clarity, could you please add a little bit more details to explain why =
you chose
rwlock instead of normal spinlock?

>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/device_tree.c              |  3 +++
>  xen/drivers/passthrough/device_tree.c | 39 +++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h         |  6 +++++
>  3 files changed, 48 insertions(+)
>=20
>          if ( ret )
> +        {
>              printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign
> \"%s\""
>                     " to dom%u failed (%d)\n",
>                     dt_node_full_name(dev), d->domain_id, ret);
> +        }

I am not sure if it is necessary to add "{" and "}" here.

> +
> +        read_unlock(&dt_host->lock);
>          break;
>=20
>      case XEN_DOMCTL_deassign_device:
> @@ -322,25 +345,41 @@ int iommu_do_dt_domctl(struct xen_domctl
> *domctl, struct domain *d,
>          if ( domctl->u.assign_device.flags )
>              break;
>=20
> +        read_lock(&dt_host->lock);
> +
>          ret =3D dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                      domctl->u.assign_device.u.dt.size,
>                                      &dev);
>          if ( ret )
> +        {
> +            read_unlock(&dt_host->lock);

I think instead of adding "read_unlock" in every break and return path,
you can...

>              break;
> +        }
>=20
>          ret =3D xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev=
));
> +
>          if ( ret )
> +        {
> +            read_unlock(&dt_host->lock);
>              break;
> +        }
>=20
>          if ( d =3D=3D dom_io )
> +        {
> +            read_unlock(&dt_host->lock);
>              return -EINVAL;

...do something like:

ret =3D -EINVAL;
break;

here, and then add one single "read_unlock" before the "return ret;"
in the bottom of the function?

> +        }
>=20
>          ret =3D iommu_deassign_dt_device(d, dev);
>=20
>          if ( ret )
> +        {
>              printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign
> \"%s\""
>                     " to dom%u failed (%d)\n",
>                     dt_node_full_name(dev), d->domain_id, ret);
> +        }

Same here. I am not sure if it is necessary to add "{" and "}".

Kind regards,
Henry

