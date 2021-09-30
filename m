Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C238E41DE63
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200069.354454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyYa-0006Jc-Ke; Thu, 30 Sep 2021 16:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200069.354454; Thu, 30 Sep 2021 16:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyYa-0006Hp-HO; Thu, 30 Sep 2021 16:05:12 +0000
Received: by outflank-mailman (input) for mailman id 200069;
 Thu, 30 Sep 2021 16:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v5L4=OU=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVyYZ-0006Hj-65
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:05:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a9a6b1-e0f4-49c2-b13b-6f82865f972e;
 Thu, 30 Sep 2021 16:05:07 +0000 (UTC)
Received: from DB6P193CA0003.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::13) by
 DBBPR08MB4475.eurprd08.prod.outlook.com (2603:10a6:10:cf::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Thu, 30 Sep 2021 16:05:03 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::78) by DB6P193CA0003.outlook.office365.com
 (2603:10a6:6:29::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 30 Sep 2021 16:05:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 16:05:03 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Thu, 30 Sep 2021 16:05:03 +0000
Received: from 2308aaa785f6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 011FA557-478E-4E8C-9ADF-B43CB2ACA342.1; 
 Thu, 30 Sep 2021 16:04:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2308aaa785f6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 16:04:52 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6143.eurprd08.prod.outlook.com (2603:10a6:102:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 16:04:50 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 16:04:50 +0000
Received: from smtpclient.apple (217.140.106.55) by
 LO2P265CA0280.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 16:04:50 +0000
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
X-Inumbo-ID: d5a9a6b1-e0f4-49c2-b13b-6f82865f972e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJIU8W+o1kGXMDCjmeTdGa8w2xMckZxA/lHljKNhmXQ=;
 b=bMRLrm89eg533XRjb0TXTSYCxpcOhJJpxrYy4XQ/eK3uc5ZEFO3QW1Ot+qH5jU5LBIiw4KjMApCcWqJyTTmq7i/Q6HlcZOjzBEfVUjNnxG5k8Xs51WPsuVgx5Abj68WSyZPc1UhMBmAaHTdXeq1U+mv27gZ7Fiw/459vtCqxUgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 477f27175c3969a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFzVZFE7FED456gUuiByr8UtfFrk2Tig1qhFGnhWh/o0Nh96M/8Oaw6rilwRlf4LndG0hC6OIeLRPXgtm7XYZk190vV4IFAexs89cr3X/Pl1lSMtavKAdn4AtRKnlbt3PPgodoK13MXJqi99TJw+bhuTWsBo62uC1gCmpj/dVqoyy/+i9fa44Gh/BOUpmkTWDN4zL+ODqSXhc0aY2+GbMrm1bev6eOXNtsfGNHKt6mo5OYDvHwrN9R4i7LiPoBldKDmRa3x9YCiJNrDW4kyWuqenIwxZVMrL/E3JJ/2ED08a5TvTCG9l90yp3M6MGMt4W+Zlez+PK7XVci4pZV87zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NJIU8W+o1kGXMDCjmeTdGa8w2xMckZxA/lHljKNhmXQ=;
 b=lpK5jnwh0rJf1wOlTN7JsDP1vKOFPcTvkPv/kiT/oa2pMykvLp6C7cuf1Ypt2W73bB3VQNSuwU+rQ3BBHqDtEgrvdRAMvmCYJ35vAomW63BBxOaU+NJyuS7HnAfujD3s6wcu+sxhdp6ZRQrT+JFp440IWFw7zaGwxfwIdvhVNQxHLRQZpW6ylGKWjCvdnasrPBIGJDM/N073dfRPry3ZDnimpW2Qt34fv5NUcKuzvjagw/s1laxNpAXvFZNIpEsh1XqsWlzR/lqWE5fdPSZ21zJ7VGocQjkJu4j7zteRF/igNzT65u/aY2oqXgj6iD24yBhCVMJIhD4CpaJh5TmxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJIU8W+o1kGXMDCjmeTdGa8w2xMckZxA/lHljKNhmXQ=;
 b=bMRLrm89eg533XRjb0TXTSYCxpcOhJJpxrYy4XQ/eK3uc5ZEFO3QW1Ot+qH5jU5LBIiw4KjMApCcWqJyTTmq7i/Q6HlcZOjzBEfVUjNnxG5k8Xs51WPsuVgx5Abj68WSyZPc1UhMBmAaHTdXeq1U+mv27gZ7Fiw/459vtCqxUgc=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 2/3] include/public: add better interface description
 to usbif.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210929074620.28495-3-jgross@suse.com>
Date: Thu, 30 Sep 2021 17:04:47 +0100
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <121F36C1-243F-4546-8B27-8315EE580D5C@arm.com>
References: <20210929074620.28495-1-jgross@suse.com>
 <20210929074620.28495-3-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::28) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abe1b250-d704-4bdc-f5a3-08d9842c1003
X-MS-TrafficTypeDiagnostic: PA4PR08MB6143:|DBBPR08MB4475:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB447597CE86B1A5FCBFC4A10FE4AA9@DBBPR08MB4475.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6ulF3fe4Ni8l6dR0Xg/UwuVZ7SXHrOq7JjOzQ9FjhByOv1ROaPdu8wyvQ3XRtIPUDyhxYI5wgvhNl1mLOdB2blVp/xoder2uHmFz7T36i9ps9s0oUT924Ozos584PSUwAECVxxU45KaSo9xrZT3C/FhZ3MrSFsNd0XloLB3z1KuG+ZpxNtMP3yAFh0k8XPv+ElUeYbGPfId1NwvVC3fQay0zw8wBie7KvWiL+Hfwfofi+L4YfFDs2+NVKRfcaabC6BBRL/PwMUqOOqXjip3YBsCm98LptPNk4wxTfCyw+pxhpJvE+RVzgBPOnKS7raMrhl1VAjFiquZr5Olzl00SMsANq2lZcstbnFNupEVTw0rgz4llApLJumDKii6zn+grngn/PyCPvfIj+QI78asGsCMalrq3xh8X9eOkGn9qsFwxvSGMpaK5++U3w7u2VQAsZ5yxiYbg/MGeAhPRfggn6TP1HtwS++zL1zLQNYdrfXaq2UXWbAVYweZ3h2S4hH8zGNGrRsTZ5QcR6Pupc1VlUqHOUbadyP22gSCOqLV9Eb5tpHRDAktKLKIpg7pQlWeXRSrvSZiNPxgx0gAzkmTw5vT70EUmV3Y6gF6NSCmrB5c0PZZqiqyJhGYb0DI39sfwlwYGz5qoUoZfxuvYBOxOXBW3f4GDv2/QRoXEW3hOsjWQqqWxgLhNnsp1gOenj56/Tlxf8u2HAE/e73QXHZufXY/uLBfz/Uu6vY4JZkXUv9A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(44832011)(4326008)(6512007)(33656002)(508600001)(8936002)(5660300002)(316002)(8676002)(38350700002)(2906002)(38100700002)(86362001)(6666004)(26005)(186003)(2616005)(956004)(36756003)(6506007)(53546011)(83380400001)(52116002)(66946007)(66476007)(66556008)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6143
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3903dc97-f474-44ef-fc0d-08d9842c0839
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZtpLbesjXIq7+3gmYYZeshWB/yikYaF33yu2kUnkYnWWwBGZizeYD2m8shyJwPUSG2lZ1xmUBtKuJ8LCCGxwdulnDRQwnLvEi0XN+znHIGR1Cpd8PJmr+J4vJm/9H5OeQJTQ1XfZ0IkMoQTyn2dobr5dLo4fZLGumryH1+W8p+gJcGpMbfAbXRLvQ6eZplm2gz2MybqhFQOUXgfGWTf5mmJpbz7Yf/FJaAxo57H9t6LCB+4eVGsE0DWQOCfN5Jc/fZtPpELsfb4dhGeS3TE5gbArhHhEIQniHFOYPSsiTNKBhV/w9OonsgLBvfSiauPy5eIGYdFK6/E3GJnSPpYWbzcpVBUvP5QIeX4zUG3wpXQepKpPxRS5Wh/aN0gMxU5byugRW0KqzKPSZtJb9wkINzlLI00DhmGxdRnUyzhO7vl83TkqNsyo712S2mnvOPDPYhdiXM1we5n8irCHsGbEAV3bM67HHoRzeRkP3mw+JQYSAgNBlqhan6olEDJqo4A3XeYnMrlELURdlAm5mrK5QCjLbVhUIlB/LrNo2F8gtN3uGS6IRVJaw/l4YA4ZAcPfO5TJ/DQFztDv2qwYRiNoQ0S1f59cTJfJEjKazvGMD1GvCih5JjQfzvtteyjl+3sQu4C3ar0iISnQSfTCWEJaGzR6y1Q67nNIrpdQlAQf0cLkRonVszEMQrR8VfE1KGnNY0pWSGcneJ9GSxr+PBgxwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(36756003)(26005)(53546011)(47076005)(4326008)(70586007)(356005)(83380400001)(81166007)(36860700001)(5660300002)(6486002)(86362001)(6506007)(336012)(956004)(316002)(2616005)(8676002)(33656002)(6666004)(6512007)(82310400003)(186003)(6862004)(2906002)(508600001)(44832011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 16:05:03.1678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abe1b250-d704-4bdc-f5a3-08d9842c1003
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4475



> On 29 Sep 2021, at 08:46, Juergen Gross <jgross@suse.com> wrote:
>=20
> The PV USB protocol is poorly described. Add a more detailed
> description to the usbif.h header file.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> xen/include/public/io/usbif.h | 164 ++++++++++++++++++++++++++++++++++
> 1 file changed, 164 insertions(+)
>=20
> diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.=
h
> index 96b9fb661d..dd378bcba5 100644
> --- a/xen/include/public/io/usbif.h
> +++ b/xen/include/public/io/usbif.h
> @@ -32,6 +32,34 @@
> #include "../grant_table.h"
>=20
> /*
> + * Detailed Interface Description
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> + * The pvUSB interface is using a split driver design: a frontend driver=
 in
> + * the guest and a backend driver in a driver domain (normally dom0) hav=
ing
> + * access to the physical USB device(s) being passed to the guest.
> + *
> + * The frontend and backend drivers use XenStore to initiate the connect=
ion
> + * between them, the I/O activity is handled via two shared ring pages a=
nd an
> + * event channel. As the interface between frontend and backend is at th=
e USB
> + * host connector level, multiple (up to 31) physical USB devices can be
> + * handled by a single connection.
> + *
> + * The Xen pvUSB device name is "qusb", so the frontend's XenStore entri=
es are
> + * to be found under "device/qusb", while the backend's XenStore entries=
 are
> + * under "backend/<guest-dom-id>/qusb".
> + *
> + * When a new pvUSB connection is established, the frontend needs to set=
up the
> + * two shared ring pages for communication and the event channel. The ri=
ng
> + * pages need to be made available to the backend via the grant table
> + * interface.
> + *
> + * One of the shared ring pages is used by the backend to inform the fro=
ntend
> + * about USB device plug events (device to be added or removed). This is=
 the
> + * "conn-ring".
> + *
> + * The other ring page is used for USB I/O communication (requests and
> + * responses). This is the "urb-ring".
> + *
>  * Feature and Parameter Negotiation
>  * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  * The two halves of a Xen pvUSB driver utilize nodes within the XenStore=
 to
> @@ -99,6 +127,142 @@
>  *      The machine ABI rules governing the format of all ring request an=
d
>  *      response structures.
>  *
> + * Protocol Description
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + *
> + *-------------------------- USB device plug events --------------------=
------
> + *
> + * USB device plug events are send via the "conn-ring" shared page. As o=
nly
> + * events are being sent, the respective requests from the frontend to t=
he
> + * backend are just dummy ones.
> + * The events sent to the frontend have the following layout:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |               id                |    portnum     |     speed      |=
 4
> + * +----------------+----------------+----------------+----------------+
> + *   id - uint16_t, event id (taken from the actual frontend dummy reque=
st)
> + *   portnum - uint8_t, port number (1 ... 31)
> + *   speed - uint8_t, device USBIF_SPEED_*, USBIF_SPEED_NONE =3D=3D unpl=
ug
> + *
> + * The dummy request:
> + *         0                1        octet
> + * +----------------+----------------+
> + * |               id                | 2
> + * +----------------+----------------+
> + *   id - uint16_t, guest supplied value (no need for being unique)
> + *
> + *-------------------------- USB I/O request ---------------------------=
------
> + *
> + * A single USB I/O request on the "urb-ring" has the following layout:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |               id                |         nr_buffer_segs          |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |                               pipe                                |=
 8
> + * +----------------+----------------+----------------+----------------+
> + * |         transfer_flags          |          buffer_length          |=
 12
> + * +----------------+----------------+----------------+----------------+
> + * |                       request type specific                       |=
 16
> + * |                               data                                |=
 20
> + * +----------------+----------------+----------------+----------------+
> + * |                              seg[0]                               |=
 24
> + * |                               data                                |=
 28
> + * +----------------+----------------+----------------+----------------+
> + * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
> + * +----------------+----------------+----------------+----------------+
> + * |             seg[USBIF_MAX_SEGMENTS_PER_REQUEST - 1]               |=
 144
> + * |                               data                                |=
 148
> + * +----------------+----------------+----------------+----------------+
> + * Bit field bit number 0 is always least significant bit, undefined bit=
s must
> + * be zero.
> + *   id - uint16_t, guest supplied value
> + *   nr_buffer_segs - uint16_t, number of segment entries in seg[] array
> + *   pipe - uint32_t, bit field with multiple information:
> + *     bits 0-4: port request to send to
> + *     bit 5: unlink request with specified id (cancel I/O) if set (see =
below)
> + *     bit 7: direction (1 =3D read from device)
> + *     bits 8-14: device number on port
> + *     bits 15-18: endpoint of device
> + *     bits 30-31: request type: 00 =3D isochronous, 01 =3D interrupt,
> + *                               10 =3D control, 11 =3D bulk
> + *   transfer_flags - uint16_t, bit field with processing flags:
> + *     bit 0: less data than specified allowed
> + *   buffer_length - uint16_t, total length of data
> + *   request type specific data - 8 bytes, see below
> + *   seg[] - array with 8 byte elements, see below
> + *
> + * Request type specific data for isochronous request:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |            interval             |           start_frame           |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |       number_of_packets         |       nr_frame_desc_segs        |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *   interval - uint16_t, time interval in msecs between frames
> + *   start_frame - uint16_t, start frame number
> + *   number_of_packets - uint16_t, number of packets to transfer
> + *   nr_frame_desc_segs - uint16_t number of seg[] frame descriptors ele=
ments
> + *
> + * Request type specific data for interrupt request:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |            interval             |                0                |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |                                 0                                 |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *   interval - uint16_t, time in msecs until interruption
> + *
> + * Request type specific data for control request:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |                      data of setup packet                         |=
 4
> + * |                                                                   |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *
> + * Request type specific data for bulk request:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |                                 0                                 |=
 4
> + * |                                 0                                 |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *
> + * Request type specific data for unlink request:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |           unlink_id             |                0                |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |                                 0                                 |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *   unlink_id - uint16_t, request id of request to terminate
> + *
> + * seg[] array element layout:
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |                               gref                                |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |             offset              |             length              |=
 8
> + * +----------------+----------------+----------------+----------------+
> + *   gref - uint32_t, grant reference of buffer page
> + *   offset - uint16_t, offset of buffer start in page
> + *   length - uint16_t, length of buffer in page
> + *
> + *-------------------------- USB I/O response --------------------------=
------
> + *
> + *         0                1                 2               3        o=
ctet
> + * +----------------+----------------+----------------+----------------+
> + * |               id                |          start_frame            |=
 4
> + * +----------------+----------------+----------------+----------------+
> + * |                              status                               |=
 8
> + * +----------------+----------------+----------------+----------------+
> + * |                          actual_length                            |=
 12
> + * +----------------+----------------+----------------+----------------+
> + * |                           error_count                             |=
 16
> + * +----------------+----------------+----------------+----------------+
> + *   id - uint16_t, id of the request this response belongs to
> + *   start_frame - uint16_t, start_frame this response (iso requests onl=
y)
> + *   status - int32_t, USBIF_STATUS_* (non-iso requests)
> + *   actual_length - uint32_t, actual size of data transferred
> + *   error_count - uint32_t, number of errors (iso requests)
>  */
>=20
> enum usb_spec_version {
> --=20
> 2.26.2
>=20
>=20


