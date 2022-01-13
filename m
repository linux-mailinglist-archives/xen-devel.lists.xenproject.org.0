Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3648D58D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257049.441468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xBw-0002MY-O7; Thu, 13 Jan 2022 10:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257049.441468; Thu, 13 Jan 2022 10:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xBw-0002Jx-J6; Thu, 13 Jan 2022 10:18:48 +0000
Received: by outflank-mailman (input) for mailman id 257049;
 Thu, 13 Jan 2022 10:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WE3=R5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n7xBv-0002Jn-1B
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:18:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c99217-745a-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 11:18:46 +0100 (CET)
Received: from AS8P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::8)
 by VE1PR08MB5120.eurprd08.prod.outlook.com (2603:10a6:803:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 10:18:37 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::38) by AS8P251CA0010.outlook.office365.com
 (2603:10a6:20b:2f2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 10:18:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 10:18:36 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Thu, 13 Jan 2022 10:18:36 +0000
Received: from 3d0d5306b929.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B1303AF-8235-484E-8906-9A305CCE0465.1; 
 Thu, 13 Jan 2022 10:18:24 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d0d5306b929.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jan 2022 10:18:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB6123.eurprd08.prod.outlook.com (2603:10a6:10:20a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 10:18:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4844.019; Thu, 13 Jan 2022
 10:18:22 +0000
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
X-Inumbo-ID: 30c99217-745a-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afjjrc1ITCSLeYCYt+u/Q1NRUZQvPIG5HyF0vfjrfGA=;
 b=GoqGxKGVu/rqIVm8065c6qZe59hQgai/X3W8rO1ouS6myUHIAvk6LNVDvz+50B4ZAZXlC21fl092yTdbn+E+Xyt4E97j951aSv1kyjaFZ198Eq0bOsh3u4vlpVExP5+FSqhAfN6+6behyUQ87XZRp3iZWX+FS2gnVbQ/YzYRqFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf012327a012358f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0pF4WATL4NVASbfMOPm+6hMS/W7ExIYDWFSZ2DwD9Tiw5ohbZ6Nv63cOXj3UXerWipCA3IjjN371n4//BN8DQu4bHXYdQZgfuwpWr7g9sgN7RuH2iTtO5hRfCRqgG7rmbaaYz4gI0oUiDCdZ2b238mhTD+aWqJwviIuerTYxi+buH5R+w38A6jzqmPgYnJhgfRSfL9Ut1prR4GJpqruB4CsKEwR5pdGnmLJRNOdbhBy/TKklibgOlR5LntDk7itH4Fg6fbY/f4KdwFvkS+A2Oz79bunDxejfY6Zs7FsSvJxrMI5qP6LRYbn8zprJHJmmUZYbP4vWW462nO/T1x9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afjjrc1ITCSLeYCYt+u/Q1NRUZQvPIG5HyF0vfjrfGA=;
 b=fyW6iyNxw7Uq/JqTVrYImZCQzC/3RKFOQcp64XOM8fZKmU8eNalSQxKXkfYDHY7kkHCy6Oge+0Sg3T0myAPAHZtQbkR+xFdpLQ/iFnnb4tJLbihDDdqY90Xu62/kuifsv2J9qFEDHhlne48vacNL//1G5yi109laE1+Bohqz/CLUS6/mC8iG16eqntR5gm/Cb9RrZalw4uURYH3p796oRogei2xYTmYT2P2h62Fw0hUDa6Vfj45Ntnj+wOLo+hdKPxV/lt6ixEpuvrjUyafz/I3yaMpKCWo9Ns5JGSnlTpNiqtB6eoy9Juz7jyvnRThWgMiUryzXI3ab5YNiSc2wqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afjjrc1ITCSLeYCYt+u/Q1NRUZQvPIG5HyF0vfjrfGA=;
 b=GoqGxKGVu/rqIVm8065c6qZe59hQgai/X3W8rO1ouS6myUHIAvk6LNVDvz+50B4ZAZXlC21fl092yTdbn+E+Xyt4E97j951aSv1kyjaFZ198Eq0bOsh3u4vlpVExP5+FSqhAfN6+6behyUQ87XZRp3iZWX+FS2gnVbQ/YzYRqFs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Luca Miccio
	<lucmiccio@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [XEN PATCH v2 4/5] xenstored: send an evtchn notification on
 introduce_domain
Thread-Topic: [XEN PATCH v2 4/5] xenstored: send an evtchn notification on
 introduce_domain
Thread-Index: AQHYCBjHbbjYjleLtkqmAysdkxDl76xgvZQA
Date: Thu, 13 Jan 2022 10:18:22 +0000
Message-ID: <83076C8B-940C-4C39-BC09-AABA5849FC1D@arm.com>
References:
 <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-4-sstabellini@kernel.org>
In-Reply-To: <20220113005855.1180101-4-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 66228885-51e0-41e4-3c1f-08d9d67e0fc8
x-ms-traffictypediagnostic:
	DBBPR08MB6123:EE_|VE1EUR03FT008:EE_|VE1PR08MB5120:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB51207861D6C5105F5B98B5D59D539@VE1PR08MB5120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zQMujPClW6dWDpwCn6FOULjjRxQWer9428wViSd3UJ36JVNBlrxsUIjrFqEOb1f113T+rUFp9pZlLuU4fU1sN4oJxw7Hm6RfqUkGS2lnjh3PRanDDTxOJWHd30gmgDRGrNaOhb6+VUYQ9jbI0YdzxP3BGX7xEHLcJMFfgLRqDnK9IpS3brCcRptsvLMJuT+3n/v70VE0T2FqrFzGKxVljNMI4SQnPRpKN3PCatifkU5ENuX0airL+cjEMlv4s22BjNyhA4s3lS/lHHidMYCQ1HSLJTV0lt0SO7n0df6wohWcb8/mVjmRoGTVWIUhcYv7kM48bq2+0GfDffWC4mPJL5FiGfnXlkY7TfSTwR0HG9KIeKxpOh6cnQE87+FOwgOlYNByETLN5cW/FTr1xnX4grTDFUnqJb4B4AGeBvVsYdcLEVfjsqADFlOfMkIy7KvzaerMOups67ZaJn1ZKzZI3RXBXncmUmJcKq2l67dqro/E3xLz78f+Tvk4uGR68sJ5OyYDHiDEtLWiwjUHFKXTc1hclzzFMpHlriH1ROLvOIV29SwWg7RfRe7KB4vS6THCG7A7/2Uzl5TSaPcd1t+UKJ4OcWWvaH1OyMuC4NAqf5rWMuPui4eHKksboclkqaOK6XWghGK49Airtt3Fj20KXa0+n5w/VV+0d573A5BIhs3zruca9sUmvkJfG6kp+QKBhygx0YIOhtkRuAh9lCUTQ/vU954t4pGMkFw50SAtCbEeS1Bt8m7Gw2htkIK5RrY2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33656002)(6916009)(71200400001)(186003)(36756003)(316002)(26005)(15650500001)(4326008)(54906003)(6486002)(2906002)(2616005)(508600001)(8676002)(53546011)(86362001)(64756008)(66446008)(38070700005)(66556008)(6506007)(83380400001)(38100700002)(5660300002)(91956017)(76116006)(66946007)(66476007)(6512007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93C9F969CB4B964696DB86B002A054F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3412c56f-7b21-4168-34a8-08d9d67e06fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tv68f66pdbEV8H31nqnlaKn7SpFrUzDDOMMDQcx145OBmlonezBzljKX3nmV6FeDlRF1IMVgD2stgNFXLStB3t+XpqzQP5jV2hbbGNVQsma37BsxPXE1NNhCRzvQ2zxL16RyJn/DJTcH0V/3nRTKCiA5DLxBhTPcv/ELhZRyWCruZxirrtrckrXzbAJZ5Sty/tAWJ3VNn9ANmY1ixgVHb7jYlUwuDUVs9sdEoK0a7+JFavrM1fSVOI6/QW2AZIMWtDm8vTPqivAPR6LLj51oG2LJiA0Z2mu1g+5ViPTqMkxP7jV8Da73u6fubfnRl9JSApHyuQp1ONw4DqBWspZX0ycaRMQkrBhATkegsnFL6aZNRr3IM7dlmwN/2nwtCs4bptgNogXK6lIdMwmrNHVeqNLGed/Fe9+x9GHlGhJGDSFHsBrJGZb8XzI+rJpcb2z69oPjk6YH5l2pRDEsOJYpfuprc0reh7VvZNL6ITa+5wHH3Gs2pcA+SbEnhCAjT3KuAHu4Uu+L8F+qY4f+Zwt67hhGnQuOwt4KeDBBRV3cIWRSylz33cZ8H5U8/Vbl7axzg5k/KStzjY0+qSYPbuktiZIncsYnlAaZI7zFdK2dSQf8hWFNQYOWI8kPfT2FKNgxWVgjgIm3gtqyDIya9Ykxv7jAmgraccb9RIU+echbBoyjZz/dfaX4LhlMiytxFZN6OA0bhzJWCkBKKwRCORA5rLw3olSa33pAMEs5zzVf6MBJy3wV3eGZdeNOvgTJ8RuPTX8qG1BKwb/mcgvvg2NAlw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(70206006)(6506007)(70586007)(6512007)(53546011)(186003)(508600001)(336012)(6486002)(47076005)(36860700001)(86362001)(82310400004)(33656002)(36756003)(54906003)(2906002)(26005)(316002)(40460700001)(2616005)(4326008)(6862004)(83380400001)(107886003)(5660300002)(8676002)(8936002)(15650500001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:18:36.7556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66228885-51e0-41e4-3c1f-08d9d67e0fc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5120

Hi Stefano,

> On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> When xs_introduce_domain is called, send out a notification on the
> xenstore event channel so that any (dom0less) domain waiting for the
> xenstore interface to be ready can continue with the initialization.
>=20
> The extra notification is harmless for domains that don't require it.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - drop the new late_init parameter
> ---
> tools/xenstore/xenstored_domain.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index d03c7d93a9..7487129e47 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ct=
x,
> 		/* Now domain belongs to its connection. */
> 		talloc_steal(domain->conn, domain);
>=20
> +		/* Notify the domain that xenstore is available */
> +		xenevtchn_notify(xce_handle, domain->port);
> +
> 		if (!is_master_domain && !restore)
> 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
> 				     false, NULL);
> --=20
> 2.25.1
>=20
>=20


