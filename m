Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B558EB97
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 13:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383570.618760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkKG-0006DO-6X; Wed, 10 Aug 2022 11:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383570.618760; Wed, 10 Aug 2022 11:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkKG-0006BA-3g; Wed, 10 Aug 2022 11:56:40 +0000
Received: by outflank-mailman (input) for mailman id 383570;
 Wed, 10 Aug 2022 11:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddlM=YO=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLkKE-0006B4-Ew
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 11:56:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c1762aa-18a3-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 13:56:36 +0200 (CEST)
Received: from DU2PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:3b::34)
 by VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 11:56:32 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::ef) by DU2PR04CA0029.outlook.office365.com
 (2603:10a6:10:3b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Wed, 10 Aug 2022 11:56:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 11:56:32 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 10 Aug 2022 11:56:32 +0000
Received: from a6dd5ceef11d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8879A817-FDC1-4626-9B95-1EE60344C05C.1; 
 Wed, 10 Aug 2022 11:56:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6dd5ceef11d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Aug 2022 11:56:26 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAVPR08MB9064.eurprd08.prod.outlook.com (2603:10a6:102:32d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 11:56:24 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 11:56:23 +0000
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
X-Inumbo-ID: 7c1762aa-18a3-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U6WAShoKr+aG8Q31wHAw2EjtOypZiifF4yTWpDIs5aRkncGfGXXPiT/KeVyIYP/tbZZDVzp4NOI6E5t4vizb8qVf890N+4FpPnf1lfOg9wffEbcZzshONoRcNYzm6gI0H3117HW2NCiRKpLrCCpc15PbKAKNvOdA4hWIR6zLRLm2gEGxzUklqfUDKoznbA4bl5+b1LlrjnDR3P+oYpdCU8mfy3dGqnO0HT3Cl3gRubH7N6IpXdK/7rKzV+PQmeCvAXCJP88CsTaEqJM9vxDHTIkCHwlaKppiKY0SyvcfSZa5SfYGk84tLPZsmKryPKLek6cLgtmS3XAPk5nCLCn0GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE95nfIZuCt6z/SWDU0EUqYaPZFYyYQCEQX+gy3ATr8=;
 b=P3GjY5DH8y3llcyGtseEqGtX29PJoCIdyT2N9dgfDzZ/gkC8A7IdRMcu24kr4yagiJPeO4/yZciumyqCCwUSslTgRdTGDxGbaRsXFFfbDkeaefs41cAxbpKPwyWr92wqUhTMGMYEnEHgzTTl06v14XbbqzmkP8UPRHCYoUfjpbgaQfJBxmmsXszVymuyQTkYsigOoNZY4k93r1bEK3oy9lCqrC2AWbHFKTsDAJwjH6ruhdhfiG67GsVuy85+Oue6wnR/WjcWeqSqttkpElc6R1/x0dUQtujusGBirofnSE1wLxSG33iCwxVsHjd2Mo8g/DglDFAhvKTa/DF1p6Ww+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE95nfIZuCt6z/SWDU0EUqYaPZFYyYQCEQX+gy3ATr8=;
 b=WgS91BEIbAWeQv8lINeVTd0z60vMlpvxWrCvtU7IDbLAqFzaOE9mCA4XJLieTRiRugT/pNTSQWzPpTVGalJ4aooyojK1sCmOAzYHsRR17cDDilOS63ZuSSsgzPwi2TLHI/NDCdKP6v1eiTv5MAkHMXEu00pLjTJwjtkiYGIJUI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c76e0028ea7a129f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoNWq7zzlbIT1kNPAy9zLaVWQMeJjhSoyrxLh2KEFsnjWYMD3TtFiHQlAGVaXYVU5Or542HfykuSJa1EDPwOil2r55rbeDB+i1Udr0S3XBMB1Y6/jDyhI01Ed/eaNn1/bvIXIjqfz8k0P9h7/tBNnYmQojRYmyqtecqvAwscyph2UFmi4WaeXZAtA2tA2Yd1BE6i4KqRRpP+WxwpYM3PQULWnan+Zu+Cb+Q38FNaw1A3sz6Xu5VBw5jJL5PEe4TmDOdTU73ImzlcCKrq+LnJlxpcQbOth0mT/03bxSbDHYJYGUGMpgVvDpBY0pqvRXAueq9S8FzpfaGQp0FvK6iLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE95nfIZuCt6z/SWDU0EUqYaPZFYyYQCEQX+gy3ATr8=;
 b=NTHfFRhkXhLy8F82MtkRD8Rff8zKZxCak+VakKzz1U8BeADh7yhkLry26EhXflmpn8RGbrdxd5Dqj44V0fiiWAnYZL+q4ImszOyo3VN8mC0OKDbFC0KgJeZejCYXKr0nzE201Jz3m1rXD0lT97JFi++1++tqupPB7MpT7ArpnJpk7hvybr6CcjfmvYyYBIltbJho/46P24WGeGcSJpYcRpZ8woNs4oPsvl47HdUmjBjhLD5vzvmPdOAgjBX83Tn6fL/trUguLuYQ7L9SMMPnmeQBzmiE+/2oezLXK6b+fWE7QAF2TToAXrjeH9+dqLddNHWtHwQa1vsD8yBsdIITfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE95nfIZuCt6z/SWDU0EUqYaPZFYyYQCEQX+gy3ATr8=;
 b=WgS91BEIbAWeQv8lINeVTd0z60vMlpvxWrCvtU7IDbLAqFzaOE9mCA4XJLieTRiRugT/pNTSQWzPpTVGalJ4aooyojK1sCmOAzYHsRR17cDDilOS63ZuSSsgzPwi2TLHI/NDCdKP6v1eiTv5MAkHMXEu00pLjTJwjtkiYGIJUI4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Topic: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Index: AQHYrAfaSCwnUxIuckmqYlBEjhSF8a2oCFsA
Date: Wed, 10 Aug 2022 11:56:22 +0000
Message-ID: <D4EA645D-95DC-40ED-990A-8E376ABEC554@arm.com>
References: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
In-Reply-To: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9b3968fc-bc1d-4869-2d90-08da7ac75e15
x-ms-traffictypediagnostic:
	PAVPR08MB9064:EE_|DBAEUR03FT018:EE_|VE1PR08MB5215:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oJPVdsseNxjCQmTvdALoCcE+p2CrF5+vx93DpZwdC2Mag+lY5FlMPrxGhxvU3sMamBHZAThq7rf176O9RzYyzPGsp7SOICc7WzggZdGWOKbEp//DP3BAFsq1v+1MpYwy8T2Ek+FaOJyxKJU0qpRtnCgMxauWnYpWAa49aO05RzqyOFW1T/pTQC8JjwBJC6pjHwc39zBCn+/xR1fKiam7rSWyfBpfe8S7l1u16LFsBWhPWvoh0qJD2cZUy2XSVXkiKtvaqURnOrYRuOsMus/TM8ZKMTBjnakNkd/GzIcie9YS7i55V07sqwBv8IUrjJ1nwCo2Cn4en8KLAKU/t+0VXAKsdM8zOnaVvHbWrdofn0BrgqSaComkygqBxquJULMnFUbh3Ffw8YbPFdL52sUG6QUuMDt5YwcBmNQa0IiF0ME5HuaEcFuzC0ZISovF7KU3uyjMu3g4gHFLpzd+wBjiOi8rVoEqkWWkGQn26Mfw37FrqasRGUfFZkY0XYqUJ4SvUWDMhVJEeNngLCv0FkbaCcEimmbCf7fccq6ZPe3DSfMOdPSUhjh4UxOHxFK3RiIgwLRVN/A/P0AA08k4N+HYDn7vx9bihDy5frwyIyQZP38YsPSKnbt3D6ciUJ4qcRogIPbPVCFKsYkrFKG8EkTtB6L513vFWrwtjE+DDOCvTN5AYw10FPIGm54KkGxiYU1fa9hve1aMymJy+r8//n8HUXI5vb9Jw+F27BkpNnHBPGCtp5xUmqBdM+btAGRUmBxTsyliIH33poSz8DfJEDMDloC4jMgxwl1xPoA4cvd6qXTIYF4O98LtK5WDQA+8D+u200o7Z9dxFW+EjbAwfK63uw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(76116006)(4744005)(66476007)(8676002)(66446008)(4326008)(2906002)(66556008)(33656002)(91956017)(66946007)(54906003)(478600001)(64756008)(316002)(71200400001)(36756003)(6486002)(6916009)(38100700002)(38070700005)(53546011)(86362001)(41300700001)(26005)(122000001)(6506007)(6512007)(2616005)(5660300002)(8936002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5776A43A1D928443A67221A61885B49F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9064
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b60b5b9-62bb-423e-023c-08da7ac758a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PnJCzwIYkyIjRnl6/jS0pIWIZLhj0e+rVwkQriYg8rGNueWJRYtxVGuAuJSZUuPbl3Rkq+w0zdquJT+V+e7bd+91U0MXRjK7YjgWLb4veWz2QKH+dLBhiVVnWCQnqQFlBWWZM3C58jrg7jwQHrOIOgX0qdKA44fWWVeeFv3NOwLFwFaBRzO9NC/BnACU64Z/o/hZiUXb2o9GFFa1VLntRJHfdiPSpZ0jr823wGOSDABvAP837ShHbVwRxcvzZM8W54yi88SANyzMYemTUmbXdL4fGg6RfIkoVpmpsYK07g8rWxW631eMGWIRYaoKR9fCir2t6jwSKePQPxW2bpZUQtf9h6bS8ACsRNTYOWHl11FeoRKDhYWNxldBHPBgTgOs5nma1ZI1uBogCEgpq1zzE1D1Zl5Y7Ex0fxuQemJBhv+/ffQNSRPmkwE/s9KkEOh3KWbERHHvXpb2Na1LI6R0fvx8tsbXoMCNHCy4pB7IW7RSdtMEMoU0waPNpMG5Ro4cpkp4u1/IVXZCzRYSUmjhaq/Vt6+EYjA5a740d0kON5TA9mejCLgk48sfFiEY0zRDRp5ZEDqmN55P0GOoxJBSOMPazwoaJkW0M8AjOKqkUyIYR93AVxCkSKHBz0buyMvM4oae18e2AmnXYJ2xDdyonH7/YGBMFf4J7S/Gm8puNxAw3k2ZkgrMGgFtAqCTSeKX1uTHZjmzZHmzJpCSErn8kk8Fns3OA8ZjqpysOUFAF14pMb43tahpbeTPwjJZXr8e+XzdNta58V6Zlxk53DpOnpmMYW/gm+RQEBzdfeKnEfY6ITKxDN247DimQhL1BhvE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(40480700001)(47076005)(70586007)(6512007)(336012)(4326008)(70206006)(26005)(186003)(2616005)(8676002)(6506007)(478600001)(41300700001)(6486002)(2906002)(316002)(53546011)(82740400003)(40460700003)(86362001)(82310400005)(36860700001)(36756003)(81166007)(356005)(5660300002)(8936002)(6862004)(33656002)(54906003)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 11:56:32.1873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3968fc-bc1d-4869-2d90-08da7ac75e15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215

Hi Jan,

> On 9 Aug 2022, at 4:50 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When passed -1, the function (taking a u16) will look for segment
> 0xffff, which might exist. If it exists, we may find (return) the wrong
> device.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I tested the patch on ARM and it works as expected.

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul

