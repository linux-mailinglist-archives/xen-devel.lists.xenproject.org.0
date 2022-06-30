Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F556117E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 07:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358192.587256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6mby-000504-Kn; Thu, 30 Jun 2022 05:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358192.587256; Thu, 30 Jun 2022 05:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6mby-0004yI-Hl; Thu, 30 Jun 2022 05:21:06 +0000
Received: by outflank-mailman (input) for mailman id 358192;
 Thu, 30 Jun 2022 05:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfmQ=XF=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1o6mbw-0004yC-Uc
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 05:21:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20054.outbound.protection.outlook.com [40.107.2.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dec6871-f834-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 07:21:01 +0200 (CEST)
Received: from DB6P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::31) by
 DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Thu, 30 Jun 2022 05:20:58 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::89) by DB6P195CA0021.outlook.office365.com
 (2603:10a6:4:cb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 05:20:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 05:20:57 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Thu, 30 Jun 2022 05:20:57 +0000
Received: from 9673085fb4fe.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0719DC3-6FFF-4FC1-86E1-7E4ACE52D450.1; 
 Thu, 30 Jun 2022 05:20:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9673085fb4fe.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 05:20:48 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AM0PR08MB4099.eurprd08.prod.outlook.com (2603:10a6:208:12a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 05:20:40 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90%6]) with mapi id 15.20.5373.016; Thu, 30 Jun 2022
 05:20:40 +0000
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
X-Inumbo-ID: 6dec6871-f834-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UWU+9HcYydiu1Uv9aH8f+MArB4mGxBoXyuvM/+j/L/+g14ES8WdHZrh/0KAkqw1c3io3Z7OkSpfFeU5dy5aLeUfvJDqfaqmr6UM101AoF1RtJtjYfT6h+XZAAXg0wzwyxC433OFY8sizznNvmzorPaiWoa6uj4IyJo+R1BeMk5HaBVKftOJ1YA6sjs3Td9QRXSA8wl4+3xq5EyYkR6kmEqGRV4KF86Lc1hy9m5incVbZpT8FnD+2JOsjwanh/SNscm+E5iGva/tgMVk8N+WdL6m2SwIVH+RSMEkH0RBgPx1AehOqjG36CjLSDVMl4UyaaNQxUYTQjH641uBlQc6jxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6T5dsvrZbLHrASVIXJrjfLKzJvl5HgT2BnlwJphvCo=;
 b=FsJNLUEeRiIj9CJHsIcFp62ISCpqp/jcr2H7leU2OGUIA9lyelPl4vIC3D1NMiUZHfYpek67N8GsXgmaB16cltrp9wc+eQScaxtkSW246XLO1UrLCu3Hr5ZBv0Vb5JUToe+2JlamxadAkr+2HpHqUInDoEtV6B9OxWGgg1Qey5hKWhMB/1WiuJbqBohwd0DmImTmafvtnXWh3OBq6WAZDf3vtKBmKYpJgtsNv98Fy2iGpzEi1EsoeUd3XnCA3ngjhjE/Jhej54uKF4cu1Vvx3rrFi6/uTnVDGeMMwlfEiklocxMlLj4MyExotSXUnkmbrXkiL/wOMT8r3MPtgGDCWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6T5dsvrZbLHrASVIXJrjfLKzJvl5HgT2BnlwJphvCo=;
 b=fS/WmGl515wNJ3cADNT5kWjMsNNQgkT/iWVJAdlC1TVgz94rC0w9mi5GL4MTy53I+pgFpprRdjau5AEblF9qHp4ffpD7GVLUL9wzDEgvXL92nGn/BxVURFBPQY/y5iYlopfOI0Y9reA5FfAnGUeHp+rgh7HJgY5kAxew0aohywQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnSWtrePLHlFiiIcdEP+dpm9iH9rjHG6TEXzzf1RHj95D5oQwgc2CCBwJlwH5fDjTFcrNYK2I6oGiibJRAWOxogOLDn9saE6tiBftUFeOVSWH0cRy7KFjpYZdAPNGMR+dwQEUC+JXlXUnmFGkccnFQkUwZ/JGfqc8k08XsEdA9K8Qc7O9G0ZF2fh9cQU4XNOad1dxuAdSAX8jYZICXEnFAB7g6cMmN9dk+bcMJQ4cHJNyVN89IyV83Wr+ZiTazQZ8hTXyXyBGd5VeVprB20xPLLgLdXOi91JQK8Jk+H3gIgG+ZlmMlhaZaJX57IPoxwMH85HakQTvqn29C2aZpt10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6T5dsvrZbLHrASVIXJrjfLKzJvl5HgT2BnlwJphvCo=;
 b=IOa2XjHTvvNNDxmqVe+8nbpQa17VXIaR4yPiG5L19AHXESDy7/o/fM4EPp0HXeeEqVAv1FblAF/Fp2bDCtcz367OY75QyJHpj8U1fod8raqc/+8BY7OMk9HevaY08WX+rWWFPLXVu5YmR9mk5swd+73qFeuJeGhWIXaYSjhfUuD9ZhuK5+P4WviXt3YM0P7Rbs8MZeRTQUG8vYszYLwvlVO5n3XjMoOJTNzwpRvI74SflN9B6gbF+N0WM8Vtyozb3cYRxbt9IzI5wOAn8ZlUYbPWCk5p+r0bnH6VJaxWJJiWvDG7O5ukvOZdLllPIw1Gimc94XAHRfnyP+Y170AXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6T5dsvrZbLHrASVIXJrjfLKzJvl5HgT2BnlwJphvCo=;
 b=fS/WmGl515wNJ3cADNT5kWjMsNNQgkT/iWVJAdlC1TVgz94rC0w9mi5GL4MTy53I+pgFpprRdjau5AEblF9qHp4ffpD7GVLUL9wzDEgvXL92nGn/BxVURFBPQY/y5iYlopfOI0Y9reA5FfAnGUeHp+rgh7HJgY5kAxew0aohywQ=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH v3] xen/arm: avoid overflow when setting vtimer in context
 switch
Thread-Topic: [PATCH v3] xen/arm: avoid overflow when setting vtimer in
 context switch
Thread-Index: AQHYjCSE7P53YpeE00S5Qtvr6kIMUK1naUjw
Date: Thu, 30 Jun 2022 05:20:39 +0000
Message-ID:
 <AS8PR08MB769671FD067374347EF976CE92BA9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220630015336.3040355-1-jiamei.xie@arm.com>
In-Reply-To: <20220630015336.3040355-1-jiamei.xie@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1A9049B64AEC31469192C62389608D4F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6bfde91f-e322-4c1c-41d1-08da5a58504e
x-ms-traffictypediagnostic:
	AM0PR08MB4099:EE_|DBAEUR03FT021:EE_|DB9PR08MB6620:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 izIt4vxrYW2X6q4NU70eDwJzN2AGemE4VEQDI0XuS8/ynuukrNbgDCIQkeMHqiVN9gj90ezPYe3Qr5NSQ3ADj4UUmet+V3yatUhRanMW3bfTU0ozXz+Fhjf49oTP2sfm+tb/fweMAUg8dDZtRME873fZhZiwy1cXsaRrNe8tzGr/6jfziaquAO7oBNp0BggwLG3mNMHr+6AtJC2+nugn6WZAUtXWLUNzlVIxkCpKvfc1X+W2RqwCZndQ/kF9277/pbqaOtrTI7Bj73isDTvg70c43ulU3mpwSqUqFk7f2N2bbvVaYXCyw9hUUuCA2MkjDCbu1bTs3/563LrmwNnrCfqhuPHiD5CHrw749P0hMPRLCB4iDNBhp3qNaopwU7TcaiOVKrQUDQg3RjocO6ZQ/+lbixa4qprvsuxw3IP7VJV5jdFGdlCoxU+BR3a3b59dSF9GkytwFyLFo25blEz9HmYwwQj1GCoK7pEhcbXuaOUGsRdHBNN3Q+dj32t4BrvITrxWQJflUNjACe+8+O8ikiFSuk60/0tY+mVVGb18BY341BwvBnRc4Xpyiztr2p6DD2T20SMHomoWtldU/iVRBOIE9MhA4g6DuouuAe0F9068VTEVbfnE15vZPidNCba1SwBj0JKJ7F7zwC2yKHiVsbtoO1EdiwHpryYc0QRdEdxKSOweK/tGHIo1Aq2g0jB3xsbAkI4D7TbfyIttZ+9kebi7qu5q2BbhHskAGQmPDnkUEouTOBODM8jrU3bbnXjklsDcJG0l6LGDSCT1KVnsSH7iEMRtpck99SZpD2vCHa+rGz/+V2NOj2fJnkfwa2RG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(66476007)(8676002)(64756008)(66446008)(66946007)(4326008)(66556008)(76116006)(2906002)(8936002)(52536014)(33656002)(55016003)(5660300002)(38070700005)(71200400001)(478600001)(122000001)(54906003)(186003)(41300700001)(316002)(38100700002)(53546011)(9686003)(86362001)(26005)(6506007)(83380400001)(7696005)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bcf7c5a-ac85-45e1-fe56-08da5a5845bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P8ZdWwFwzADihGKNbM9uIRbC5GMZyWwWgdzW8UczccvKlxfcmf90X8/8Bnl8puZSsx/c0Q7rn+COcAE6mtlMEzpHUD5XvRn/u5EEfmNtXDeQZQOZON0LGwX4yQp7l82JTHzykEogojAIEB5HPsda96o1CIW8gTvJUmd5KHjW9UH3j6zOB40KQwchZ21AUpJs0CiylEYwXpOyzpGOe5kIVXev7bct5AhBxtAfDhjfF4NYw7BDpcaEqwItICI9gae/LQnP/vEU1bl8xZ5WEwJi8qxYjkx9dzZyVGGZ0TMEJNFncOgnKV4adoVNeGNiz9hhJjEPOYBYr4+soqW+oqR3qiOEhXO7Jr+xvXnoe8/4yJwEyBz7/fq9KND4jcyGwVlh1GXB7Fs7T9n+jv8MD/IjycA+LqWUeBANwUADXoAXqvBeFTNKE8OaF/gIhOrg7jLjPhWc/ep9lo2t8kmIKpTUQ1Qf/QvOahz/dMZsx9dvND9X+CsysEgr4uxUpeBJ0eW0waIyMtgNn8dgkSdhyU1gu3kv0j4+bDs2AEG2hvQNgL8ndUYLADIDxPxo8esQcqiG1drJq3d+ez3srlJyZDOeXpHdfyhjh8xI4TcRQ9ALetz3wue5OGGBe4wIBE3jjpXTWkEh+h7MWk8qNTH3G6/sxX6smyfEGDxM5F6pwRpwGH+aj0TEaePnrtlaLc1I32QrtsJ7A2u0mfSk61Q6xGrILcTPAYMBtvDrxHEiOUFjgAeyoyX/afuuyMWLNVggVYQu7tSalktO+iUfmllsVcDZzqZxlvHObqxYoup3Fxo5uFukg6kPv8Q/2qFvIa/R+Lvy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(316002)(70586007)(70206006)(4326008)(8676002)(81166007)(356005)(82740400003)(186003)(336012)(47076005)(53546011)(41300700001)(7696005)(6506007)(26005)(478600001)(9686003)(55016003)(54906003)(110136005)(40460700003)(83380400001)(36860700001)(2906002)(52536014)(86362001)(5660300002)(33656002)(40480700001)(82310400005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 05:20:57.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfde91f-e322-4c1c-41d1-08da5a58504e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620

Hi,

> -----Original Message-----
> From: Jiamei Xie <jiamei.xie@arm.com>
> Sent: 2022=1B$BG/=1B(B6=1B$B7n=1B(B30=1B$BF|=1B(B 9:54
> To: xen-devel@lists.xenproject.org
> Cc: Jiamei Xie <Jiamei.Xie@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Wei Chen <Wei.Chen@arm.com>
> Subject: [PATCH v3] xen/arm: avoid overflow when setting vtimer in contex=
t
> switch
>=20
> virt_vtimer_save is calculating the new time for the vtimer in:
> "v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
> - boot_count".
> In this formula, "cval + offset" might cause uint64_t overflow.
> Changing it to "ticks_to_ns(v->domain->arch.virt_timer_base.offset -
> boot_count) + ticks_to_ns(v->arch.virt_timer.cval)" can avoid overflow,
> and "ticks_to_ns(arch.virt_timer_base.offset - boot_count)" will be
> always the same, which has been caculated in domain_vtimer_init.
> Introduce a new field virt_timer_base.nanoseconds to store this value
> for arm in struct arch_domain, so we can use it directly.
>=20
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> Change-Id: Ib80cee51eaf844661e6f92154a0339ad2a652f9b

I am sorry I forget to remove the Change-Id.

> ---
> was "xen/arm: avoid vtimer flip-flop transition in context switch".
> v3 changes:
> -re-write commit message
> -store nanoseconds in virt_timer_base instead of adding a new structure
> -assign to nanoseconds first, then seconds
> ---
>  xen/arch/arm/include/asm/domain.h | 1 +
>  xen/arch/arm/vtimer.c             | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/domain.h
> b/xen/arch/arm/include/asm/domain.h
> index ed63c2b6f9..cd9ce19b4b 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -71,6 +71,7 @@ struct arch_domain
>=20
>      struct {
>          uint64_t offset;
> +        s_time_t nanoseconds;
>      } virt_timer_base;
>=20
>      struct vgic_dist vgic;
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 6b78fea77d..aeaea78e4c 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -63,7 +63,9 @@ static void virt_timer_expired(void *data)
>  int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig
> *config)
>  {
>      d->arch.virt_timer_base.offset =3D get_cycles();
> -    d->time_offset.seconds =3D ticks_to_ns(d->arch.virt_timer_base.offse=
t -
> boot_count);
> +    d->arch.virt_timer_base.nanoseconds =3D
> +        ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
> +    d->time_offset.seconds =3D d->arch.virt_timer_base.nanoseconds;
>      do_div(d->time_offset.seconds, 1000000000);
>=20
>      config->clock_frequency =3D timer_dt_clock_frequency;
> @@ -144,8 +146,9 @@ void virt_timer_save(struct vcpu *v)
>      if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
>           !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
>      {
> -        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_ti=
mer.cval
> +
> -                  v->domain->arch.virt_timer_base.offset - boot_count));
> +        set_timer(&v->arch.virt_timer.timer,
> +                  v->domain->arch.virt_timer_base.nanoseconds +
> +                  ticks_to_ns(v->arch.virt_timer.cval));
>      }
>  }
>=20
> --
> 2.25.1


