Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017F5AB5E0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 17:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397842.638542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU90J-0005z1-9a; Fri, 02 Sep 2022 15:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397842.638542; Fri, 02 Sep 2022 15:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU90J-0005xD-6W; Fri, 02 Sep 2022 15:54:47 +0000
Received: by outflank-mailman (input) for mailman id 397842;
 Fri, 02 Sep 2022 15:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oU90G-0005x7-Rv
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 15:54:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e6b6b61-2ad7-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 17:54:41 +0200 (CEST)
Received: from DU2P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::18)
 by PR3PR08MB5753.eurprd08.prod.outlook.com (2603:10a6:102:87::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 15:54:39 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::d9) by DU2P250CA0013.outlook.office365.com
 (2603:10a6:10:231::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 15:54:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 15:54:38 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 02 Sep 2022 15:54:38 +0000
Received: from 175e8593f4dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DCF786C-9DE0-49DE-8B35-8220CA2D3EC9.1; 
 Fri, 02 Sep 2022 15:54:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 175e8593f4dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 15:54:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB9490.eurprd08.prod.outlook.com (2603:10a6:10:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 15:54:30 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 15:54:30 +0000
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
X-Inumbo-ID: 8e6b6b61-2ad7-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S6NIC2IroUJP8de6BYtVsnbSuIaVHWfgWoQ8fnB4mx8enrpaXuIs61xpO0QT8wpd5JObiENOXfVU9OQ8ILOf8oVniWoD3uC7Qy4soNUPl4i6bQR0ktI9ta++Lii1RLKIxru8uRl9njb1R1ol/5cmR+Q82qziO0iZiR2CnCby9ZPCpghhsYFsNdJLOgOB8iZTHZQkGKhevsy5NcwQth9WgASA0aS/urk4glqjdQGvHYfLks0uyxGg0cgvpIsPnN006H/0NYnUkQt+b9NylgPODfq8uNDw3kw1rmU36icmvqmgmtG9TQv6TZQEboEyUJCYQsD/C7ime57MEPW9xZ+gFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTsAaJE72t/O9Bq6IlWOFuulUXKMbzN0cp7XPNDqjYM=;
 b=R+JOCLkVAeT5+QM5veE9y+4nUYa3X29Zi0sXGa9S7/acktVMtRrAF6fQrIddiUifmxiOuzqJFUMcAJKvhjhayqWLliYMAHP9VY8ywQeX4kjNZsszAtrgr/GRmFSK+mIFPUS/yO5UlxXtgapO2FIy7YjSWqon8jPlpThoj6ip64BHPrbPsykzfCNGfjiZqBxgwC6go1hx/uCfIAb/E0UZRC5hWbxirFCKKxLqCb2ilV9QiLBBzV5ynD2NyI3mtLbf44cVLITUHplElSw+JlupXcjNljQhYhT8D5d+YJtcZv0CxUx54Sk51byYVxPq4fNMIJ7pouLXSW82sBXlwwa1kQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTsAaJE72t/O9Bq6IlWOFuulUXKMbzN0cp7XPNDqjYM=;
 b=GfGWMhSTB3JG0iNsNfiEAHeYA9KgBvnJgvQXimzq3Wiz4ghSSxOxh091RnIjgh2sTvZS8efjAUabW6/V6/kIvFgOTY8C8wv/+n0xYKof0jU8QGY5moaHm25iglcqpMux/ZClmE5Njo412vbs/kX6Jv81fD0gKHKaYFMrWyIlyhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: df1eb71335e77fb1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGipvzuzPO2Ma96Xxyf3e3EcbtbCpjTBw/yYFzLC9JsFDNEMo2iuEYIpa/6Fu0AnxLhsLgm+Ft1WZkahmga+EDWngUoyX1eW8bXItnDPQgiD3d67q53ETDvHCiC04ieI1N4jMZfkl+wGXXWTZUhLe8ec2ZU+4tBy0wGtyxUlMyCrrP6w+BQI0BuiIvW0e6KYLJ65d8y990oqBMa2ajnLFBoPDyDK8HhDwDI3N5DNHFn6XSeKWK2XLG7IQfoEJnLWqWEYuthDGjSyhf9pNubp8sIMSmuI+Tch+qVHBfLgSlMSuqyEmNpZx+J6E42IITOObHxHpaUPz+1ROZOG+xGXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTsAaJE72t/O9Bq6IlWOFuulUXKMbzN0cp7XPNDqjYM=;
 b=Mdeoi2ifzntYYY+909jtZuhYRHfuzJFZJA4lFyRBfvHsxVKzOTRHrZG2PofXN9/I+0zhp1Gw8h9EAyRIbWm/1pxbd3BhkBbES6fhPnAqOOGDDHucg7h2E0z8JCeL2KnXKpTk1nfzR1GrVpae6vTCN+d8NMXRXAt0QjyEvky1Urd+OeponIn0G+i7Hq+k19I5uBJJJTnCa+Z918imSShuJF2km6XCerV/0SKAz1Tpcxndshu9+hZCB2DD2jUpUAgQnVrEJSFcO5cdtsY0l1PmgexHGA1T8AEVvFGfsvRceMbC9uuEpIkYbM/zJg48Cm/zkDz8qmivqJtue/AwB/SMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTsAaJE72t/O9Bq6IlWOFuulUXKMbzN0cp7XPNDqjYM=;
 b=GfGWMhSTB3JG0iNsNfiEAHeYA9KgBvnJgvQXimzq3Wiz4ghSSxOxh091RnIjgh2sTvZS8efjAUabW6/V6/kIvFgOTY8C8wv/+n0xYKof0jU8QGY5moaHm25iglcqpMux/ZClmE5Njo412vbs/kX6Jv81fD0gKHKaYFMrWyIlyhE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYveOA33HU3e+ak0GIRMMly1Yth63K4ewAgAFZKoCAAAQmAIAADY6A
Date: Fri, 2 Sep 2022 15:54:30 +0000
Message-ID: <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
In-Reply-To: <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fa2b4320-ab3c-46ec-f508-08da8cfb710d
x-ms-traffictypediagnostic:
	DB9PR08MB9490:EE_|DBAEUR03FT064:EE_|PR3PR08MB5753:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4+qIn+qtCFEyGw85OTM+M7BnF+IpgSznFNeclF3OANT3vPh02kAlo1rNcxwOtuqp5U8yLsx789BnrsExBmnJ5/QuLQ2+grxH0qri1+DKbLkemwX0vCkq0BINJNXyPW1jbqy9L/5yzjG5+xuzCnksDFGgb4hlTudzglaSxblNL93Nq5Y8YhkBgprSyuHMXJ/hgrUVrxUAuVtd0bppFUW7V9D6veFMGrpjOec215am9tpnTpCG10p2LMUnZQWmLEZg+MHZxQD5o3/tpQuI+tTPC58b0J5IbPuTuPdevd9MvOlIRgmkEh4L+MC1UZAXMvXLYeFKyYNjghWDniF+aEMBwQUUt3LyYb/DiZfYt094BqC4iesYhNDfJBCkp583eTLN04ImSR5n7kpQ5BA/6T5fArAcPFxaVw+yT3hyKdZ6+tJHECeZsuBnLrW03G+1DDEV54QEjdOwFY4UCifmCzv1IpYysrkFMK6BUEpnxwwv9O2L0sPzWOfP7c2o+EScjOcqNQkk9RELk0jdYIO45ziV2bH+MqdjPgGnj4if88Sr+v4fcM0Ce1aoojJfsrYKxsBi+NMZM0GRMgO28XNpiIZauWN33dxfyCK2tR3UltsA6Ku/+QL9+OD8yf8w87nNPCiWsAJZP4vWKNz+mWenMiX5hWEFOvVmLsz174lHbljup9+MVJ1zc0+OzxrIdMXrBEqest6cJxGLLRnlYoEP5A/o7+3xgIH7MyBjtkdfRtKjuxk2B7vyq8jQetr33nq6vroIPOtZwT1b6IxRc/aNkHffJ9j5TL8C6KYsFXBR5XOKrts=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(2906002)(38070700005)(53546011)(6506007)(36756003)(5660300002)(41300700001)(8936002)(71200400001)(186003)(4326008)(8676002)(64756008)(478600001)(91956017)(2616005)(33656002)(6486002)(76116006)(66446008)(66476007)(66556008)(66946007)(38100700002)(54906003)(6916009)(26005)(6512007)(122000001)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FE9E06BB095EF4EA0F09B44F9AD8D49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9490
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9a0e399-b624-4a84-deed-08da8cfb6c2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nmB7ujl332WbQuyyNbRwBsaN+y/uNdnIf3EKLbIMJJlt2SaCFMk0g8ssxepF25cpyC3lPzSrcTLBABp8FN2QNEqvhO0dwoVHg0A7qxJ3V3CpjMCeeVmh6qsEgPXNf0Dab8yB9cNHsYFd0oLW92WOVwGfRLNFPvA4gwlUqrD4df4x1jVu1ZC70oANn8qZZpztwJus93NgX2CJhFaYSAyNWOOVGqPXMy5Uc6G4K3BoipO8oGz+daM8jcZcNDWrafMNCXcjp8CBzPhLTuZ+nIr25xtWDQz8FSJn5ytxlrwoZwWAqTrg9oBxbqWyUWv8fHyM86YubwqMmMfFNGIulZTFsh+8YX3xouZMOCvV5uoEt6ybfWoDqXkcOEk0vrcVPexlZEWvGUuBvaL1qnhYWIsdSyZvEOy4TvjTHD8EmTecseDbijA9NRGFAQSeb26Uo+xhdUrSqUcM/p+cfX0vGg8VOVin9UNK8LffcqetOolyZUr/7OdXHkdJwR3NtQbgzzD5gcBzGKzZx2cgsxenKw5YvqMQqNnQHNKGW6BNDA/GF71+oBZA72WFl55BOzdKDPi36JXZCJhgXvE2q7C+lh/HsqfX4pkUnyPHFmEIfVhdMliE5592cjv/UaPZyv+1vwIcI/1IaPcdmcmem721P+DtHmXXcTncq0GqhVACKl5tKNgztAU+25aqenUopiXqfMPaYJzI3uzAgH87d9P25OCB/RYR4Vgfu3EkAblE/5prOHTtH3rJWhr9xOTsoYxnOQmGzw5lYgqG05lFSILfGj5Juw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(40470700004)(46966006)(5660300002)(86362001)(40460700003)(47076005)(6506007)(2616005)(81166007)(186003)(41300700001)(107886003)(6862004)(336012)(8936002)(33656002)(356005)(26005)(53546011)(6512007)(2906002)(36860700001)(40480700001)(82740400003)(82310400005)(70206006)(36756003)(54906003)(478600001)(70586007)(6486002)(8676002)(4326008)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 15:54:38.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2b4320-ab3c-46ec-f508-08da8cfb710d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5753

Hi Julien,

> On 2 Sep 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 02/09/2022 15:51, Bertrand Marquis wrote:
>>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>>> AFAIU, it is not possible to have *_xenstore =3D true and *_enhanced =
=3D false. I think it would be clearer if ``dom0less_enhanced`` is turned t=
o an enum with 3 values:
>>> - None
>>> - NOXENSTORE/BASIC
>>> - FULLY_ENHANCED
>>>=20
>>> If we want to be future proof, I would use a field 'flags' where non-ze=
ro means enhanced. Each bit would indicate which features of Xen is exposed=
.
>> I think that could be a good solution if we do it this way:
>> - define a dom0less feature field and have defines like the following:
>> #define DOM0LESS_GNTTAB
>> #define DOM0LESS_EVENTCHN
>> #define DOM0LESS_XENSTORE >
>> - define dom0less enhanced as the right combination:
>> #define DOM0LESS_ENHANCED =3D (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM0L=
ESS_XENSTORE)
>=20
> I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead of =
defining a bit for gnttab and evtchn. This will avoid the question of why w=
e are introducing bits for both features but not the hypercall...
>=20
> As this is an internal interface, it would be easier to modify afterwards=
.

How about this?

/*                                                                         =
    =20
 * List of possible features for dom0less domUs                            =
    =20
 *                                                                         =
    =20
 * DOM0LESS_ENHANCED_BASIC: Xen PV interfaces, including grant-table and   =
    =20
 *                                                          evtchn, will be=
 enabled for the VM.                =20
 * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM.    =
           =20
 * DOM0LESS_ENHANCED:              Xen PV interfaces, including grant-table=
 xenstore  =20
 *                                                          and evtchn, wil=
l be enabled for the VM.            =20
 */                                                                        =
    =20
#define DOM0LESS_ENHANCED_BASIC BIT(0, UL)                                 =
    =20
#define DOM0LESS_XENSTORE       BIT(1, UL)                                 =
    =20
#define DOM0LESS_ENHANCED       (DOM0LESS_ENHANCED_BASIC | DOM0LESS_XENSTOR=
E)
=20
Regards,
Rahul=

