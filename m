Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF458AF8F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 20:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381475.616182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1iw-0004Oa-MT; Fri, 05 Aug 2022 18:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381475.616182; Fri, 05 Aug 2022 18:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1iw-0004Ls-JO; Fri, 05 Aug 2022 18:07:02 +0000
Received: by outflank-mailman (input) for mailman id 381475;
 Fri, 05 Aug 2022 18:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIDu=YJ=citrix.com=prvs=2098568dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oK1iu-0004Lk-JL
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 18:07:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646b1995-14e9-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 20:06:58 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Aug 2022 14:06:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5402.namprd03.prod.outlook.com (2603:10b6:806:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 18:06:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 18:06:37 +0000
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
X-Inumbo-ID: 646b1995-14e9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659722817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=N0/54p4No/wTFPdg0dZSU4Qe/D5i6arfL0fpOb6VaCg=;
  b=HwJHtVgYtxagwCNY5jjQ8CbR0513TQ7v4RYyWnAwAPCrF2Q5R9trNjNw
   6ivv2VgRqsg9s4vekP/kEn22cY+KcFnNEcD2bSTsXzBeEsdAWhTvII7AY
   /mPQN3+vcs8N4YpKgpMfNoSk/XxJrp3UnXdg5B7PGrBjZAT/4yX1xUiCF
   E=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 77914750
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4s/J9KBkbtuyrhVW/zfiw5YqxClBgxIJ4kV8jS/XYbTApD4l0jxWn
 GIfXmiAPanbMGSgeNwlaI+x/EpSuMKHn9dmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEs/7b83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW2Xq2M00CBwnAbFbwLdRAj9K7
 6Q+Fj9YO3hvh8ruqF66Ys9Fo517aePNY8YYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14w7/u3yGvG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFa43GlWXYqhpAgMf/vD7nRI8YTYG/zaF1hVm1wGBDJxcvAA7TTf6RzxTWt8hkA
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlxqPK7i6DC2MDTzoHb8Yp3OcpQRQ62
 1nPmMnmbQGDq5WQQHOZs72S8jW7PHFNKXdYPHdUCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZutm07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:tKyQMqnSnnakZONjPg3hajRvrkXpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77914750"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy9cYPBGn5vhY1U8clll7VozmaAmt4lP15MNEf+212qQxTN57WvOJDbVpUOvYKRaGVcYA0ticMgdB5SotG079avafwsSWlgjTtY/rnehTd4ieWlxDs0pM/Yw31AjgGLa8iK0sT5NIAF87sYqy86KRlt76aGuzc+45WSUqOqn6TFo52TzC8iOIrCYMIMlJ/fKCs2eUOqLFmfg/KL1V8uDsmTEIwFFpb5z/9XXauW+Mc+TbTGnmMzcGUpz63kPo4WlWAE/j4ibsxodOnYpdJ9XEgn4uMxj1oBFo1Y09Zh5hN/SpR4vbU10yxzH8ISZnY6BmcEF548Ae2VofRhYc4aZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0/54p4No/wTFPdg0dZSU4Qe/D5i6arfL0fpOb6VaCg=;
 b=UE7YVB12vXAI8LP14bYRVH8SCrDWyPuU5US9OKZQjfHqhLF2LLgw4ZphHeo2EoRAo0Dqu9QTdVEne+nLRQ16Esp+wyibmWKmr7eVlQjRoqEsLX/A9WXPUNrNXYhJyKWW4+IG666Zj69bYqTuIiee1zuxRQiR61YcGnBMssse8Tn1mjiEa/ea2OJvz6w57sNUWAv7xJ5oWxevFxkzx0T3/n/Dl0Pxcl/dAHqDn1snyA2H4Y6mJUtpQtgYz+IXCmrR4UNdWdC2zjCIZUUdC+gWxSUCfH+LjnOGY7I3DWe+5Gt4eLlZxjiKi274pX/4VtkeQmsPNDdHdJhc3KjdceNjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0/54p4No/wTFPdg0dZSU4Qe/D5i6arfL0fpOb6VaCg=;
 b=q94ubgVVyNBblGwAzaMVO2P2Qbr+AgaLKs8hbiakWGxoIZ8Jid2Vqfwe4sYwxG4rR48EvOpgd/rtlzwvkVt7vGCs7bz7hLFKZm/oxEwyxMvBkA6kcoYVrg9W8enAi7IqLNFOtZUDxaZguMhmWF1QTmeuvY/ZYc9r5vrefvDTigw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Topic: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Index: AQHYo3Q7g2T4T7O1X0OIdhve1Wb7Ta2gpUyA
Date: Fri, 5 Aug 2022 18:06:37 +0000
Message-ID: <cb9b9589-0d0d-d644-385a-eedcdb90f733@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <6e5fd9edfea379b69682fa538141298fc1bc3110.1659116941.git.edvin.torok@citrix.com>
In-Reply-To:
 <6e5fd9edfea379b69682fa538141298fc1bc3110.1659116941.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 109cc667-413d-47ae-b562-08da770d3d9e
x-ms-traffictypediagnostic: SA0PR03MB5402:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PNbCfz7cz8wBiuDpG+1UW6BjAFAwg1VesVttOcYHxCkfx67UJe9jN93A9dFQzrPK8PJQgTX4v/SQO97uncYbChUZyH9MK0/D1amqczPqb38L/LP4BJwIVZHB4MmzJImrLss56Ur0wCEh6WSi0h1mZ78I+hvvZsOQYXmuDij/KDLIT7Dq4H6jo3PO7gsWa9skFhRAvCE5l8dnc6TRPt50Y84o3IzVzTX4RdOBFWP17rps3yKqAt+MXYGrqIaYcW4GebiscIm/d6m/v5PvjZsyY8++jX50njLqQkceeL1bADZffi0f6AlL9MhIIIdn9Hp8NuUji5+EYAhaNKcpLW1Tt1ZeBYP7h/uzWQXCu/SrgYD7WFQqYmu2XeoN/rdJagivhTBtMbHsdkNEt75jrcCt/XqSh0e4fYjOdgQge82pyrXB9VG5z9iuPf2J/r/rNU+S4jSikUHbQ7/On0tvES+R/Kqd6DUxts6DvMHyVG9wQNiXT62HUeBbbpSIidhGCmcRg8Q+Z4P7Dwb51j9Jw4YEj51Cqc9QM/lS3/j2rnEsV20uzhp/ypKMxo3dUCZr9ld/SIcNQf0JO4n2mPTCkeEOMiitTw+hl+XiXU9cDBx5AMu/9Mtm1+g/bwmeeu74K2Jq0yjsGZZBmbmwgW9eqCC97RQTgeVNJLWtFGVifYM0NElWxvHhBnaCAoEgMgr4FXFbsAUvRTLvcWUt8CqzorArQrQSW8tfVUTZlClp6KxLqB4CTKmeWo33TsstnjvSaUmNI4a0U5lfGrQu3hjfwklrdqDonC/zHtwCecM1hxH/iGxWgwkgFyKpCl2TitqNvbgqTABZqh3lRZSQfwrN6KvPFaQ2yZduoVCp9ddJivIla/7vSnn45F4JHmNGZVB++CZ1buviP1yuSsJxf+E1DsN+Yg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(6486002)(966005)(478600001)(41300700001)(71200400001)(38070700005)(86362001)(82960400001)(38100700002)(36756003)(26005)(6512007)(53546011)(83380400001)(66574015)(31686004)(2616005)(186003)(31696002)(6506007)(110136005)(54906003)(107886003)(76116006)(66946007)(66556008)(316002)(64756008)(4326008)(8676002)(66476007)(66446008)(5660300002)(8936002)(122000001)(91956017)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L016Q1lrUmEzVVlHSXRiQUpobjI0ZDE4TE5VYlNKNVhVdGYyYUw1SjBKK2hZ?=
 =?utf-8?B?Z1N4QnZ4OU9vZjlUVm42Nlc0UmZHL0RrQ2xpVnBtWmJmcHZJRjNVQ2dOWXow?=
 =?utf-8?B?OWlTbkI3UnFWVHpuTkxORGt5MkQ1blV1KzVLajdOMWRBM1JTYWdHOVA2VmQr?=
 =?utf-8?B?OWIyY09sODZtQ3IwaU8xN3FIbjl3dm1ObGpEU1IvcXRLUDlYTWtMbFNuYThj?=
 =?utf-8?B?b0xhZUpUWU9rWUJBUW5CdFVsQnAvbGh3UURSWjFYMU5NWWxDQitTM1NPZTFS?=
 =?utf-8?B?WVIvelVVL1NkTjVEZE1qQ2hNcm9Eb1pwTXkvbmdjeGYydjJEWmw1ZnNhcFA2?=
 =?utf-8?B?NmVhUWtOKzV4bklhNGVTYXZ6cld4OHhaN0lLcmxPSEJIa0Yzb1VtWFZCT1V0?=
 =?utf-8?B?VW5GaDNuT2JZbytYakc4ZWhzTGNzeUZJZmZGYUpheXkrWmt4Q3A5QjJhWmtC?=
 =?utf-8?B?cCtpUmxncys1Mzh0c0p6WEExdjBBQWM5ZnpnR1piekF4enFJVDVndW5Kajhi?=
 =?utf-8?B?UjY3N0NxbmVwY0habjUzVTRBS0JBdjdDb2EwMUJINU9IOUQ0MUxJbDlJZSt6?=
 =?utf-8?B?eHpxQWFGZUQ3QXIyRXJHOTNkc1hYSlI2YndNNmcva1BHVmpMUDdxbVgzWURU?=
 =?utf-8?B?RldrUmxSalQyWTJWeHJsR0ZSM1BJZXZXVXBjNEFwS1VyMkZyM1hhMDRwRDBL?=
 =?utf-8?B?MnlobWpBa3VRZUFmbHBTRTk3ZXE1cVJyd1VlYzNFeC9LMUhGOWFoY0FpbDBL?=
 =?utf-8?B?aHpGR2ZCMXJMZlUrZW9zZTZWMkpQSlBaeTZxT0EyYmNkdTRzSHJGUnVQVUlp?=
 =?utf-8?B?eExPc01KUU9RMTZFSWZIU09XVWZuNWlJMkJWN1AvRUhISWN3RklSOG9hazRC?=
 =?utf-8?B?NHVDazN5NUNwRUdlZHhiNFBOV0h1Sm1ZdHdtQy9PV3l0clJtS3R1SXYrNENz?=
 =?utf-8?B?UHlaUGVqYTlEUDJHVnJOTnA5WlU4U01WS3pLS2NOK2pmYmZpMTI5ZVFRdTZN?=
 =?utf-8?B?Rm9Nc2VIa3JHU0s2TVNYc1BoK3VnS3U5Tmpac0dSNW11WSttUFJRdVZDdjVL?=
 =?utf-8?B?VlRNdVpiL0ZGWFVQSHdiUExPeERhYlVJUkVJNC9YUVFRUTF0aGNwWk83WUdX?=
 =?utf-8?B?dktPRVdhQzRUMXlWdUQvWm9xQzBPb05iTjIxWVZCcTFvVHkzMURNTU9wZXk2?=
 =?utf-8?B?NlY0NGZISmlqMkUrbmllRW1nSWQ5a2RHYU1wUk1LYVN3NVRwSDBCTjJvVVU2?=
 =?utf-8?B?dFdpSjFmWHpURVpMNW1jaEEvbTRCTDBQcEs3MUxsTm5zejBhQk1Ud1VSajd3?=
 =?utf-8?B?MExrN0hEZ3NkNTVsUHFUSlhsaTFWQXY1RXBrQzNTeUJSdWZsbTdVakRiUFN2?=
 =?utf-8?B?eDg0WEFxRDhmRnE1b1ZvcHdHejFIUmtpUVhMUWxQcnJoUHFFRCtCQy9Pa2tB?=
 =?utf-8?B?MXdnbnJ3OGJNdjBYS1dtYTNuR21hVmJmVzgyZXZXQitsWGJqNTAzV3N6RUVj?=
 =?utf-8?B?S0k2d2g5K05LQmM4cnhjRXBoSW50YkdWN3dYM1FoK2pUaURmUzFNcnZ0Mm1V?=
 =?utf-8?B?aFZqY1RTNHFvVng5czUwWXVhVmFSOWNUaklObW9BblAyMDkyNXUxa3VSZHhF?=
 =?utf-8?B?Mk5xLzBxYTNsclZnZkU1bXVEb1krbU5jRUM0cnhCMDlIczNVVUY5Wjc1dG52?=
 =?utf-8?B?SUYxQjRXdVEwMzVJcFR3YWV6bkFwVHU3cDZBSDVONDZMbjhsV2dDS2g2MFpM?=
 =?utf-8?B?dmgwbWFuNTJackFQSDlyL0gyUmkyTUdtMDBveTFjbUJtdWZnamRMcW5NdCtW?=
 =?utf-8?B?Y21hOXZXRlZpT2xsSjRaTEpvWGR0RDhGVkVha3BFbDYxNXZNb2ZpMVpzdSs4?=
 =?utf-8?B?S2wrQkdxTXcyVVZYa1Z6ck9wQ21NeGU3LzZySm5MM0VSNFd4dDlPeE5Oa2t5?=
 =?utf-8?B?clhucGRwTUNQNU4vU3dkSnZ6RjZMSytCV1JoNjkyS2V1WXJVWk5tV0kydHhm?=
 =?utf-8?B?cHpBK2hTYXk2VW9BbHhsa3o5SzZ6M2hEa2Q5aXp0b25iK2tqWWdvbjBNTVFI?=
 =?utf-8?B?aEwyQllod1FDQXVJUTBCYmFjQ040T0JKeW5UTmxHdS9UYkJxUmhtWmFBUjk3?=
 =?utf-8?Q?6oxIkOrZe+qAAT+xCOzop1xJx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11540DE6C2241C4E886321D6ACB0657D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109cc667-413d-47ae-b562-08da770d3d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 18:06:37.7813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76Yk1U99n2ONm3z9bMpX49+AyDKjd2PhCdh9qwNI9iYahHnt3u9Kn6zvnSZNNtokUjQWVi93Yko+1m3zAPmvZlJ/+HY4wwVmIU9HIm7IeEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5402

T24gMjkvMDcvMjAyMiAxODo1MywgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gQWRkIGEgZmluYWxp
emVyIG9uIHRoZSBldmVudCBjaGFubmVsIHZhbHVlLCBzbyB0aGF0IGl0IGNhbGxzDQo+IGB4ZW5l
dnRjaG5fY2xvc2VgIHdoZW4gdGhlIHZhbHVlIHdvdWxkIGJlIEdDZWQuDQo+DQo+IEluIHByYWN0
aWNlIG94ZW5zdG9yZWQgc2VlbXMgdG8gYmUgdGhlIG9ubHkgdXNlciBvZiB0aGlzLA0KPiBhbmQg
aXQgY3JlYXRlcyBhIHNpbmdsZSBnbG9iYWwgZXZlbnQgY2hhbm5lbCBvbmx5LA0KPiBidXQgZnJl
ZWluZyB0aGlzIGNvdWxkIHN0aWxsIGJlIHVzZWZ1bCB3aGVuIHJ1biB3aXRoIE9DQU1MUlVOUEFS
QU09Yw0KPg0KPiBUaGUgY29kZSB3YXMgcHJldmlvdXNseSBjYXN0aW5nIGEgQyBwb2ludGVyIHRv
IGFuIE9DYW1sIHZhbHVlLA0KPiB3aGljaCBzaG91bGQgYmUgYXZvaWRlZDogT0NhbWwgNS4wIHdv
bid0IHN1cHBvcnQgaXQuDQo+IChhbGwgIm5ha2VkIiBDIHBvaW50ZXJzIG11c3QgYmUgd3JhcHBl
ZCBpbnNpZGUgYW4gT0NhbWwgdmFsdWUsDQo+ICBlaXRoZXIgYW4gQWJzdHJhY3QgdGFnLCBvciBO
YXRpdmVpbnQsIHNlZSB0aGUgbWFudWFsDQo+ICBodHRwczovL29jYW1sLm9yZy9tYW51YWwvaW50
ZmMuaHRtbCNzczpjLW91dHNpZGUtaGVhZCkNCj4NCj4gU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2
csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCg0KU28gd2hpbGUgdGhpcyBsb29rcyBsaWtl
IGEgZ29vZCBpbXByb3ZlbWVudCwgZG9uJ3Qgd2UgbmVlZCB0byBkbyBpdCBmb3INCmFsbCBsaWJy
YXJpZXMsIG5vdCBqdXN0IGV2dGNobj8NCg0KSXQgZG9lc24ndCBsb29rIGFzIGlmIE9jYW1sIDUu
MCBpcyB2ZXJ5IGZhciBhd2F5Lg0KDQo+IC0tLQ0KPiAgdG9vbHMvb2NhbWwvbGlicy9ldmVudGNo
bi94ZW5ldmVudGNobl9zdHVicy5jIHwgMjkgKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS90b29scy9vY2FtbC9saWJzL2V2ZW50Y2huL3hlbmV2ZW50Y2huX3N0dWJzLmMgYi90b29s
cy9vY2FtbC9saWJzL2V2ZW50Y2huL3hlbmV2ZW50Y2huX3N0dWJzLmMNCj4gaW5kZXggZjg4OWE3
YTJlNC4uYzBkNTdlMjk1NCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy9ldmVudGNo
bi94ZW5ldmVudGNobl9zdHVicy5jDQo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMvZXZlbnRjaG4v
eGVuZXZlbnRjaG5fc3R1YnMuYw0KPiBAQCAtMzMsNyArMzMsMzAgQEANCj4gICNpbmNsdWRlIDxj
YW1sL2ZhaWwuaD4NCj4gICNpbmNsdWRlIDxjYW1sL3NpZ25hbHMuaD4NCj4gIA0KPiAtI2RlZmlu
ZSBfSChfX2gpICgoeGVuZXZ0Y2huX2hhbmRsZSAqKShfX2gpKQ0KPiArLyogV2Ugd2FudCB0byBj
bG9zZSB0aGUgZXZlbnQgY2hhbm5lbCB3aGVuIGl0IGlzIG5vIGxvbmdlciBpbiB1c2UsDQo+ICsg
ICB3aGljaCBjYW4gb25seSBiZSBkb25lIHNhZmVseSB3aXRoIGEgZmluYWxpemVyLg0KPiArICAg
RXZlbnQgY2hhbm5lbHMgYXJlIHR5cGljYWxseSBsb25nIGxpdmVkLCBzbyB3ZSBkb24ndCBuZWVk
IHRpZ2h0ZXIgY29udHJvbCBvdmVyIHJlc291cmNlIGRlYWxsb2NhdGlvbi4NCj4gKyAgIFVzZSBh
IGN1c3RvbSBibG9jaw0KPiArKi8NCj4gKw0KPiArLyogQWNjZXNzIHRoZSB4ZW5ldnRjaG5fdCog
cGFydCBvZiB0aGUgT0NhbWwgY3VzdG9tIGJsb2NrICovDQo+ICsjZGVmaW5lIF9IKF9faCkgKCoo
KHhlbmV2dGNobl9oYW5kbGUqKilEYXRhX2N1c3RvbV92YWwoX19oKSkpDQo+ICsNCj4gK3N0YXRp
YyB2b2lkIHN0dWJfZXZ0Y2huX2ZpbmFsaXplKHZhbHVlIHYpDQo+ICt7DQo+ICsJLyogZG9jcyBz
YXkgdG8gbm90IHVzZSBhbnkgQ0FNTHBhcmFtKiBtYWNyb3MgaGVyZSAqLw0KPiArCXhlbmV2dGNo
bl9jbG9zZShfSCh2KSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgY3VzdG9tX29wZXJh
dGlvbnMgeGVuZXZ0Y2huX29wcyA9IHsNCj4gKwkieGVuZXZ0Y2huIiwNCj4gKwlzdHViX2V2dGNo
bl9maW5hbGl6ZSwNCj4gKwljdXN0b21fY29tcGFyZV9kZWZhdWx0LCAvKiByYWlzZXMgRmFpbHVy
ZSwgY2Fubm90IGNvbXBhcmUgKi8NCj4gKwljdXN0b21faGFzaF9kZWZhdWx0LCAvKiBpZ25vcmVk
ICovDQo+ICsJY3VzdG9tX3NlcmlhbGl6ZV9kZWZhdWx0LCAvKiByYWlzZXMgRmFpbHVyZSwgY2Fu
J3Qgc2VyaWFsaXplICovDQo+ICsJY3VzdG9tX2Rlc2VyaWFsaXplX2RlZmF1bHQsIC8qIHJhaXNl
cyBGYWlsdXJlLCBjYW4ndCBkZXNlcmlhbGl6ZSAqLw0KPiArCWN1c3RvbV9jb21wYXJlX2V4dF9k
ZWZhdWx0IC8qIHJhaXNlcyBGYWlsdXJlICovDQoNClRoaXMgd2FudHMgdG8gZ2FpbiBhIHRyYWls
aW5nIGNvbW1hLg0KDQo+ICt9Ow0KPiAgDQo+ICBDQU1McHJpbSB2YWx1ZSBzdHViX2V2ZW50Y2hu
X2luaXQodm9pZCkNCj4gIHsNCj4gQEAgLTQ4LDcgKzcxLDkgQEAgQ0FNTHByaW0gdmFsdWUgc3R1
Yl9ldmVudGNobl9pbml0KHZvaWQpDQo+ICAJaWYgKHhjZSA9PSBOVUxMKQ0KPiAgCQljYW1sX2Zh
aWx3aXRoKCJvcGVuIGZhaWxlZCIpOw0KPiAgDQo+IC0JcmVzdWx0ID0gKHZhbHVlKXhjZTsNCj4g
KwkvKiBjb250YWlucyBmaWxlIGRlc2NyaXB0b3JzLCB0cmlnZ2VyIGZ1bGwgR0MgYXQgbGVhc3Qg
ZXZlcnkgMTI4IGFsbG9jYXRpb25zICovDQo+ICsJcmVzdWx0ID0gY2FtbF9hbGxvY19jdXN0b20o
JnhlbmV2dGNobl9vcHMsIHNpemVvZih4Y2UpLCAxLCAxMjgpOw0KDQpUaGUgbWVtb3J5IGFsbG9j
YXRlZCBmb3IgeGNlIGlzIHRpbnkgKDQ4IGJ5dGVzKSBhbmQgaW52YXJpYW50IGZvciB0aGUNCmxp
ZmV0aW1lIG9mIHRoZSBldnRjaG4gb2JqZWN0LCB3aGljaCB3ZSd2ZSBhbHJlYWR5IGVzdGFibGlz
aGVkIHRlbmRzIHRvDQpvcGVyYXRlIGFzIGEgc2luZ2xldG9uIGFueXdheS4NCg0KRG9uJ3Qgd2Ug
d2FudCB0byB1c2UgdGhlIHJlY29tbWVuZGVkIDAgYW5kIDEgaGVyZT8NCg0KfkFuZHJldw0K

