Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A2522D97
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 09:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326553.549103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noh3u-0003fy-Mu; Wed, 11 May 2022 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326553.549103; Wed, 11 May 2022 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noh3u-0003dN-JE; Wed, 11 May 2022 07:47:10 +0000
Received: by outflank-mailman (input) for mailman id 326553;
 Wed, 11 May 2022 07:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noh3s-0003dH-Ti
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 07:47:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e8ef22f-d0fe-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 09:47:07 +0200 (CEST)
Received: from DB7PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:36::41)
 by GV2PR08MB8052.eurprd08.prod.outlook.com (2603:10a6:150:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 11 May
 2022 07:47:04 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::d6) by DB7PR05CA0028.outlook.office365.com
 (2603:10a6:10:36::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 07:47:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 07:47:03 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 11 May 2022 07:47:03 +0000
Received: from e9b42a0efc62.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54985072-7917-4C71-8255-189BCCD694C4.1; 
 Wed, 11 May 2022 07:46:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9b42a0efc62.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 07:46:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4948.eurprd08.prod.outlook.com (2603:10a6:208:163::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 07:46:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 07:46:55 +0000
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
X-Inumbo-ID: 8e8ef22f-d0fe-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UVtr+zWMiF/qBr+UjORyc+/rIeiI/2PXFER0d/4+LfzNUAY1TDgn+ea04QM1mbMsMSxypniZYl+DfT0ZD5UBDxAKaXMP/iCLwOcZDFbLMK6Y2oTKUqOg8x95p5HXtJfSTZvD3esgDwthfZrVAkbMXfbcjKWUQMedUFtkkbwmc1txo+YNagr9ivmiLPz2BoJiUunCQ70xSI5Kav8Pl+wVjEIgzZ8fIVp+RfAo+1AHdnYnhysxgbKjzaYd/UZjbCh/h1pt/WasiO/X8Yy4cFrykM0X2AjPC/IxC2B8IxeoVCpbGaDH8eK+6ZFbYBV7nS+lwrV2TtM89rtR6aoZYZecHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmDKFEpEozo5airMWCZhUUKlrRw+X/hfcwJb/+YHlb4=;
 b=YKVVThF1GsEqmYwXoEjzvA18yUxkA2M2z7MRnyy9v1AO4rhsRQ/M38t9o5N/qOmdkH/32jnDJXt4ovYgfoSErDwF6e6InYwGcCCQdWNhSQYTsQs1qFGYDby66vf+UP26th+yPh4tdaOPw3CiltsMUYhd96JXdw+ZsZlpUF+pfdFy47yDr5B8XsEI/7K6Qv7psvjYPmTsqgkDQ62MV1iBAFd8798CxdtRfsWqu7hRuNvPTSTR0RfqAgF/2Gszm9xeQAU5TzjYXYbzS6BGs6SBVwePlrxjzy63hFQqChq2pCLovST1Bd+BolgRwbAQQugEI25MonxmzoaNy0oFUgnPwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmDKFEpEozo5airMWCZhUUKlrRw+X/hfcwJb/+YHlb4=;
 b=NaTgFsYB5KdpYLwLY5Mm+4BFkxerVF10uyFnxjbsL2E+DkuMMx7LRw0ijAx9ODUErPSmahJewwSXHl3wBHqqWhjHipws5iKk5NYTGbstOUyQldZHHlBuULVz+ZigzltBdFc4Zof1dn3FFHMSm8uceQuccs2iIWBV9lRFbd3UpOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ab295fbf0dd03fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njvbff0StlDUemxE7+zDbX5yaSivrFNxA12lxhjhBbAmACoPQvjfkhmxpKYRa2AtsWGJ+GXCfdh6XLpoOAhi767sD8gQYc88kinhh5ZjbxXugT432PbuP9bK+Zsjw8y0jtJCvxwVDVCh+GQrE2NFkJ7YqbT6f56y48tkZZd+KE3ggbZfSy1ZQgXyJYSYJkrEVbaBC3AAmqtSQWWF/OWKx8I6VTaQZX9CWtwW5vzFIpwtUX+WLqDBlVXJODb4kSI7wiT0RGkeJbpuqzju0Pp4Bv2DTQdT0mwjyqqWjc01XvJA6NntBdvh5hk5HORjbktNRjkiHlDmNamBBLPZLOMhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmDKFEpEozo5airMWCZhUUKlrRw+X/hfcwJb/+YHlb4=;
 b=QaqOZQr8KlUUbcYjgqDfbfEY96PPvOD9QsFwQWiKtH8An9oHXuJrYB4qIoUG5F3B2AtBcBoHa3ZiSemiw7bbDtT3o3xhI2nDZqWU4pTAU9h/BiZZ1Hc+6UPnPN2xi4tRYCYBeXxydO1kPxo0ufgnglSUv5ZfPYd0ui6nJIJ2Ow1Hg3gAffnNnY7ORKsgyuxA61WTgmFQXGw1exgdmZFZid1gGajKgT4L+W0rUJ3X7JO75N8Jo5AyYMgt0veDBGXOcB1FdxeCbxbLx9QDnWiFXqpePSZby3w1CXAD81jy1l5lWySZX5q27eMSi8N/wSuRlK2vn7q8OKE5+CyqZFb/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmDKFEpEozo5airMWCZhUUKlrRw+X/hfcwJb/+YHlb4=;
 b=NaTgFsYB5KdpYLwLY5Mm+4BFkxerVF10uyFnxjbsL2E+DkuMMx7LRw0ijAx9ODUErPSmahJewwSXHl3wBHqqWhjHipws5iKk5NYTGbstOUyQldZHHlBuULVz+ZigzltBdFc4Zof1dn3FFHMSm8uceQuccs2iIWBV9lRFbd3UpOg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index: AQHYYBV7IqUb0ECYF0+NQ9CCVyUDtq0YVm2AgAABQwCAAP62gA==
Date: Wed, 11 May 2022 07:46:55 +0000
Message-ID: <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
In-Reply-To: <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e52333e1-0f34-473c-69f2-08da332270ab
x-ms-traffictypediagnostic:
	AM0PR08MB4948:EE_|DB5EUR03FT013:EE_|GV2PR08MB8052:EE_
X-Microsoft-Antispam-PRVS:
	<GV2PR08MB80521E55D92EE57202E8C36C9DC89@GV2PR08MB8052.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JQ2+66Ux/aCew/pVo7IXwGEgpqvOqvYn2peHJkfN8hJVk38PcdkViOlHZA4/ybKctWEOu97vpyqBbLC0GZf/uUz+jw1iaoPDF5zdUP2me5bUaD0pJAoObH7o2z7+YZ7EvpfpnJ7T9IVPL/gkrQmgJsKrB/Uey6fBqpcN2l0MIXTSwR/w2fKPzHu8/Wc5IiebGsjN6A8O2y3W33ekMeG7OBrDAPiQ4F1yByYNIH554Yvgwm6OIemUwdL+IBl55ghWIfsIBrF3B6tnEw1z/cWfDSnRQ1SbnRCMQDQ+q2rIz0Z0mibbCWafPGBLrx2bZhrEnHoLZOKOvLbczchhKohHStZpqM6GqGl1OkOkY1y6GHzYtHBdHpZRzGDyGIsF1YNuTr6MdJfWPXjRQIKedfcA3W4VshuA/gDIep+W1DOWx11yyFR6qhJITNAjP60XCdnTd2QdQXv43nrcHcmlZW34gALzsSWsRRlF1trpPrpE47LXq8vV312vc0LW6L8BnBaPuB9l7rhivM8SMKJjt6faXNhmyg4cIxUE6jK4bESv9X3TfeEuflRHrx+yofPeXf7rOmGiTWw9OxD5dfPha2dFwvjf9G1/c+ggJ7pj6qZ2rrgH9qcsrYUfrJwZdzHzdi7UR1JT1dO9IlGtHrE9Sz8sdB//5jRYVDNcEzpeLpYA7kUEIBNu5RwXD3NB228XZFo7zpcg09r7M+/ffcksJ4vj+LNIwBLgLtjb40t7DrEdYnYwtoICwu8CCnYt3QlnOOVou6FFjGYtCUaEhRj3w2c8AQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(6512007)(6506007)(53546011)(5660300002)(2906002)(8936002)(36756003)(66476007)(64756008)(66446008)(33656002)(86362001)(76116006)(6486002)(66556008)(38070700005)(66946007)(54906003)(508600001)(4326008)(8676002)(91956017)(316002)(186003)(38100700002)(71200400001)(122000001)(6916009)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <372833452B8F6941B4ABF64A151EE519@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca13f316-49e4-4b55-2f6e-08da33226ba8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h2hl3sIn8ApFcyCYP++ckyPLgQJQqou19x6v5J+7cI+HfjRNR1+UGhm7f3KPMvleg0dqS5WUWx46DukqXXGFo6F5b7AR/MrHfPKCtTPkMpI3G7O5wINhHG+KaVLon1QJJ/d+k7IQMZXmDfFnJVDMQwG7iow3RIv7EbmW7u0DL7tyCEZ8bLjGsBsCl2f8BfodU4uM9ZCcCg9Iao0iz6X37NpEzQynRY60u/DQ6bHBgf0gQrdFnwK3sOgeiT520Up/a4sIYnJ1RbWs+GZp3tGGCky5gDsLF5L9W2gDCnpks0oNtjG146e8Lbmy8LE8sOCZ9cnMozELWBjlBB/peCAL5G1GyIur474XeIwvLTLVaq4ZQkc31ajGCGWl7kdfBTbpXqCmwX6DKZbSTKZTzO+Th2dDwHXxpeu4arsGXr7hmjTJ2X8vIbvSTO/W4qqqbdvgTEdV1OgtWtA2VtbivvznerE5nw35StkDmCd9uQG2K/xmSxtomFGC6SRzv0KlNYjZLvt3lE0X0barhnu1yqKhced3sAXFYV/dvLYmgKkKP/IPVDAGHGNs0I1UlDTzyzIJ1kqxEAERIXM0kvPRKguDNXF2qBpxz0YRVB2BacHHKckRXYlWLhznuS7qXfCMELlVLL6rXYSf5kXjTJF2Ut82uBkXItyQzCUuYxXflmKs59OG6wh2D/7XRmCiFtvNjdPeVU07tnYaA78gVSR++ZoaXA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6506007)(54906003)(5660300002)(86362001)(316002)(8936002)(47076005)(336012)(33656002)(508600001)(6486002)(356005)(2616005)(53546011)(40460700003)(186003)(2906002)(36860700001)(36756003)(70586007)(70206006)(82310400005)(107886003)(8676002)(6512007)(4326008)(81166007)(26005)(6862004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 07:47:03.8376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52333e1-0f34-473c-69f2-08da332270ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8052

Hi Julien,

> On 10 May 2022, at 17:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 10/05/2022 17:30, Rahul Singh wrote:
>>> +    rc =3D evtchn_alloc_unbound(&alloc);
>>> +    if ( rc )
>>> +    {
>>> +        printk("Failed allocating event channel for domain\n");
>>> +        return rc;
>>> +    }
>>> +
>>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] =3D alloc.port;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> static int __init construct_domU(struct domain *d,
>>>                                  const struct dt_device_node *node)
>>> {
>>> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *=
d,
>>>     if ( rc < 0 )
>>>         return rc;
>>>=20
>>> +    if ( kinfo.dom0less_enhanced )
>> I think we need to do something like this to fix the error.
>>  if ( hardware_domain && kinfo.dom0less_enhanced )
>> {
>> }
>=20
> Is there any use case to use "dom0less_enhanced" without dom0 (or a domai=
n servicing Xenstored)?
>=20

Just being curious here but would it even be possible to have non dom0 doma=
in servicing xenstored ?

> If not, then I would consider to forbid this case and return an error.

One way or an other we need to solve the crash but if it is forbidden we mu=
st prevent coming to this step earlier as it means the configuration is wro=
ng.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


