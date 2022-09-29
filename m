Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273285EEFD0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 09:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413503.657183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoRi-0004qT-Aa; Thu, 29 Sep 2022 07:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413503.657183; Thu, 29 Sep 2022 07:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoRi-0004nd-6t; Thu, 29 Sep 2022 07:59:02 +0000
Received: by outflank-mailman (input) for mailman id 413503;
 Thu, 29 Sep 2022 07:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTqY=2A=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1odoRg-0004nX-63
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 07:59:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10074.outbound.protection.outlook.com [40.107.1.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929f1539-3fcc-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 09:58:58 +0200 (CEST)
Received: from AS9PR06CA0235.eurprd06.prod.outlook.com (2603:10a6:20b:45e::34)
 by PAVPR08MB9532.eurprd08.prod.outlook.com (2603:10a6:102:312::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 07:58:56 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::64) by AS9PR06CA0235.outlook.office365.com
 (2603:10a6:20b:45e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19 via Frontend
 Transport; Thu, 29 Sep 2022 07:58:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 07:58:55 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 29 Sep 2022 07:58:55 +0000
Received: from cf5f8e8847ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2543D1F-406A-47AF-87F9-379BB5B2B3C6.1; 
 Thu, 29 Sep 2022 07:58:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf5f8e8847ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 07:58:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6586.eurprd08.prod.outlook.com (2603:10a6:10:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 07:58:44 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 07:58:44 +0000
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
X-Inumbo-ID: 929f1539-3fcc-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lY3UP9uQVECo3TIErkTdAEm0FG0MA3a6lgcAsjJphzMt/J6d/9QyIB1bo8HJJ2iDKglNjUhEtZDs0JKXUiTatKNIvoi3K/karYXJqa/3zsN4ee9oK9TvvdJB1dB90y0dq9wxtfopHg/IWsdoHcXZU3ZZ7QBPf9t/r65vG7uuI80239oQwQ/a0yAuMQpOglZZ+iSdJc63zbr4ECzMB6bvEYCm2jhyYbse0K0Gix9y6pPqQUMEI2fhGN4HBu+7GRrJxbcZgXajG5J0Q6lEWhWz5rDzzCDMPZcRB7AACIfLhCoTSIyC0L7LYpC787Ar+KDfase6iuMD+s6PY/RQGTFG0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVUB/AKB85Vte6N9diczScXiOxSaW3nHO/laeJK4ofA=;
 b=FC099LHnmm5nYx8ZdcY0/pIRoYDcJkX9x/QMdlGmsBSV0Ykv/TzC9Un5ncDEqlrnVC8zjix1b3lMtVrzS2hTmw+5/EPIWeC0Y9kenBZHz9mNPLPCXO7jvvZ7Q0vgsqVaWBVg04mu4nk02EOrq1npUL0Zc+yg6nlZO21qPQ2eNquCIeV9GpmUuwI4haThUCAcP+t//75K/CRTwUOdSOyu4I1qdO/IwTHvzYKkuIHyemuHrQJ4PSPSDxJClWHa74W5hj/C2SQrRJ7aPNzUJ+Iy4whSfovSsNkI5SI8TyQ64RveydXTtDjuP8n/56prV/0HjRe7bWAPD0u9y4evpWlX+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVUB/AKB85Vte6N9diczScXiOxSaW3nHO/laeJK4ofA=;
 b=BJ5Ti1n2UVzhZgxUKdkbw3PGwO8c2gl4nLKphaOWpjcfIBdgmxkhLhHgDoAb9WmXHDxzkhLag6OlZbek5292BMNigztZjsLyiVP9sCE2mSTmgUaG6j3R8aCRgIiw5hE7Ioxu14PgSWqi884cny8gkE3AZDS1LwelPzq9YEu8hzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc32e94498152417
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUfqe7FQGaWOADUHnnl9vW7grI7IyKPH/Z/2DSFWC27FVNdRVXU9fYUDc7sEU8HH5qvIcfH+yLsP3JAL5380FFlN1JsDcXeRJ/L0K9hB8vvCxOjeowxiwNX9b4AOreMM+vX5BddAFaMLhe5tt5Hh9rAg8XF9arCDa1rPDe7CDtPru+09Vj8GYulfBT0752iD4yVwdpRZgnh7kOZwectleXv3e4rLgavt4H7tOagieXYkDC3fm3oPW7Prc+EAzYW4uQobeEvETbwj2MSLnRxmu+Ifuu9y2WrXd8ey4FrFaL7dHl1as/F5t0DzBZF3XIh+fOHBWzxcpED2Uyw3EpYnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVUB/AKB85Vte6N9diczScXiOxSaW3nHO/laeJK4ofA=;
 b=LCmx+vl82QyxSHN+kB8lmFtESzne//vJuRVGgr1CComBIdXzizoXnYsrP5eYLRR0X3NxXvBLhSvs3DpfC8ohMmPKd9mqCAlW19AOeX9k9FSLccUoB8F7jq1/zky08DSn9MQ6xgwrYoGPCASUMdoXSe6Bk06V2Q9C5dShgcz6LfFi7K0P3JqHcqNYZV5f4TdnRYTFzJhblajkUI8etHybECWMDKFe6zE51+aWS8tSuGLAhJRxV9CsEIPLy7diflAIDV34vl154WYwbQsYWBKgBgpKAEtgdaQEIsf528o4TiK0wwypv2SYXTomijm2lD3whbBMmh02zWpXxRJgP0hb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVUB/AKB85Vte6N9diczScXiOxSaW3nHO/laeJK4ofA=;
 b=BJ5Ti1n2UVzhZgxUKdkbw3PGwO8c2gl4nLKphaOWpjcfIBdgmxkhLhHgDoAb9WmXHDxzkhLag6OlZbek5292BMNigztZjsLyiVP9sCE2mSTmgUaG6j3R8aCRgIiw5hE7Ioxu14PgSWqi884cny8gkE3AZDS1LwelPzq9YEu8hzM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <82b9b153-46b6-429e-30b3-b30ee0e2f59b@arm.com>
Date: Thu, 29 Sep 2022 15:58:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
 <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
 <504534ec-32bf-0bab-7a61-86d75b6e1f71@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <504534ec-32bf-0bab-7a61-86d75b6e1f71@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|DB9PR08MB6586:EE_|AM7EUR03FT056:EE_|PAVPR08MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcf5688-8d3f-495c-f47a-08daa1f07538
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NQVjdjayjLMgL969G6ptQz7OIAMibSD7G9dNQoGH2ccyqL609Io3nIT5mGtLNrHQTPA4Oyj2Pckeh+6g98iBEe559uazJJwn23Xub1VjGx8PAMb9mEbxEvA3qjmqmbD6BunG8qYEMck8LQJq62mAiPP52vk5B8u9j2Mpy5i/URAo6XTiufztENlm1792n1N7fiQ6tcTLopEIkMSBGAVZ5lUvNpD9tk4bVXRlphKduHO891+2lrieNjZESl29Sejo25Xtzmk+Ft5LMxaBowsp6CRELzdvKGUI7zj0elIfDDqgPvUeYRs9WLI18nXOM4yu+KJ98apk9xLi57Fqzlc1OA4vTHY0xXu5MmJpLvUsNyihV9DFRT3CGEqvOuw4hkuMpJuTMtqbyeOeND4S6MGZaAKLR0znxYg9svv7ni2tmg3+oq7q9W1UfgcHCIgTdNKfH/mHm+O0RVB6w/8ZHoUkqYLX/L+/psax8s5aj8HSz8NDJ5hu7+aCvkqawMLgc9T4lZN5TUuWPdL+ZURZ0OLaaEUSdyPsmg0QJEEUFFBibs84qscV4D6BiHyC6kvmVlE08iI1gY3dwHwio0JGaoboIm27fHHYKBOphYA6Jp0lo5Z99iSUcU/ZGVYhav/GjxDK55unnYGoj6Qhk7tFAhc09ttpKBoZf0B7TLH/Dz4bKkImb6+ul9x/EZtzPr5ivl/NuzBeJarkckSKCb/SUp6um24VOC3FrC78XaZjK5BDOac/XcUxRaamqL8zztXmP9pTCdz8KVXDp02o2u7YPmEwCoapS65O8LcZT7uI8MABZRM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199015)(6486002)(54906003)(6916009)(316002)(478600001)(66476007)(5660300002)(4326008)(8676002)(66556008)(36756003)(38100700002)(8936002)(41300700001)(66946007)(83380400001)(6506007)(53546011)(2616005)(186003)(86362001)(6666004)(6512007)(26005)(31696002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6586
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2880dc68-78d8-4250-4b48-08daa1f06e09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cuJfhaUsGIUuKiN3M7MReB83tA38zlGxhx7ikUey0wZBgGQkHkQuVgjs2FIEyTSeH2jDw9KEXnBSxw7UNKWG5Pc97QWyD2cM02z4dEOcpxdxyuORNgZ/nfrG056KEbaPP8HIst7wywnvqGWgcPyM7bmfSUEQzw7rL/fmIXvKRzm9xx7uN+7g2Tiik/uVQr0MbkMla2Ewub2fMYRzrKizdQfGj89mpzLenAJQMeGISBBSsH6Gdwa6wJcmHGnRGYxmOwrDpl3axZxnMiTK4Tuf1nQRwsQ9SzJWPIdyrQ+uKFEzQUkYhu71nkIWnpe2Bw112qY1jm8NRg3Fh4aH6Ic8hV9/I0av03paCM+7TrN7lpspN8wK8MxJLVCLj4sVB9Gx1/jZq4DlHOk4DsYE1bTkXYz0UWoQmkJBQTmdFqW1ZlZ9V0SN4YGxNd5uf8FoqTcAQn1vPtZtTiKTXz3ECTRcb3fwIdUjGApB92kX9u/m7YSQfcOe6WzdNI100dcSusVXI3O8RF7ZSPHD8RcnhJlvPgFo8LYCxEW4aGLoUX/DeSeaaqRH9eHQqCseJpvorUUEbPaXJQK/+c0NrggURGPUCRZ56nlsVQqi/CTMFvm7jQQcm8y7trg9V5rJmN9VAEam/d5TESpHUHoqvUytOoVmpEAQpphkk1D8oCOol4n2J4eTAdp79gXtu47fggSX+X1LsxPdMsIlQoCF4mL22BSMGasZcQ+bv8qxxOQCu1TOJtOXIAvrXzkfbJMHqMwbo8hYP4yMneDDX913oQ+wk6uvwta6KipdUJDOszzePlf+BfYyfvIIpPYUyXwyyOtg9J5h
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(54906003)(316002)(31696002)(86362001)(336012)(356005)(36860700001)(81166007)(82740400003)(31686004)(186003)(47076005)(83380400001)(2616005)(2906002)(26005)(6512007)(6486002)(478600001)(6666004)(70206006)(8676002)(4326008)(6506007)(70586007)(40460700003)(53546011)(40480700001)(41300700001)(6862004)(5660300002)(8936002)(82310400005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:58:55.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcf5688-8d3f-495c-f47a-08daa1f07538
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9532

Hi Jan,

On 2022/9/27 17:39, Jan Beulich wrote:
> It's the comment which is wrong - it wasn't updated in Linux commit
> 54413927f022 ("x86-64: x86_64-make-the-numa-hash-function-nodemap-allocation
> fix fix"). Our code was cloned from Linux'es. In fact when memory is not
> contiguous, too small a shift value might be determined. This in particular
> also may matter for the lowest range covered by any node: On x86 this will
> always start at zero (and hence won't influence the final calculation), but
> iirc on Arm memory may (and typically will) start at non-zero addresses. In
> such a case the first node's start address should be ignored, as it's fine
> to (kind of) associate all lower addresses (where no memory is) with this
> same node. But that's now indeed something which will want taking care of
> while making the code usable for other architectures

Sorry, I hadn't read this before my last reply. I think I kind of 
understand what you mean now. If we do not ignore the lowest memory 
start address in the node, then the shift we calculate may contain a 
part of non-ram physical addresses. But if we ignore it, which address 
should we start from? Counting from end may ignore most of the ram area 
on this node.

Cheers,
Wei Chen

