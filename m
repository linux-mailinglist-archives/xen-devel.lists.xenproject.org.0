Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225754ADAD5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 15:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268394.462223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRBQ-0004FC-Fk; Tue, 08 Feb 2022 14:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268394.462223; Tue, 08 Feb 2022 14:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRBQ-0004D8-CB; Tue, 08 Feb 2022 14:09:28 +0000
Received: by outflank-mailman (input) for mailman id 268394;
 Tue, 08 Feb 2022 14:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHRBO-0004D2-3y
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 14:09:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b69cb2ba-88e8-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 15:09:24 +0100 (CET)
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
X-Inumbo-ID: b69cb2ba-88e8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644329364;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LwRQ86U9fUeZVSWTl8y9PW4TH6QK6utFIa/sksdtkSg=;
  b=Dk98l7or3ytXokyu+RMqZuOwjU7ygaRhcSvh/1VKqWy55eamv7jzZMFV
   S9i1LCK0IN+jg/rg52JHmtlSuMjUvd2KlVkAYVxgM8Od7jR8maWR1Gy7L
   kjTMj2XMDDGGN+KGZGjctRgNoCYr5NXVsX+3dVl966Lqv4k2zEgTOhEYU
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7HrXLG6KJhxHFMDfU2UB89Q0lX5LxUc6l+b6nurzE1pLZr0K1eXmIwB0gEC+CwmYNIDiqggrKm
 aZT7WbllJJ40C6gA5/Z45+fVPyhmQfHg/VeGxVth08aeJQaPijt035+fNBwoQ0jvlPsKQ1Yxye
 siuJPxQIbqwck3IfuuW+LnlH12NmAvIoK3tZgSBeSyxsbtWbaQfP1edKHWGFyFhIKTbWeaubjb
 6LhsHn2nNbh0OZk3tUnB+3fljPI0HXCUTeAMUKkVkX6tHVYPU9Nw9BDKsM52Vg5p0GxPib2L52
 sVOjZlYzQJYcNGvt7UWM0CHR
X-SBRS: 5.1
X-MesageID: 63191596
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ma5PT6PpPap1IojvrR2FkcFynXyQoLVcMsEvi/4bfWQNrUpxgTdWy
 jZMXDqHPKnbN2f2KNp+b9ix90sPv5/WyoRiSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500ozw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxrKtYEg0
 JJkiduLSRsUNYz0kss9cTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvI4BgWZu7ixINceZf
 NciaxR1Vk/RXj5EAVkwJdFvtuj90xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe18hFqVo
 1Xj7mvwAxwEHNGHwD/D+XWp7sfFkDnnQosUGPu9/+RznVyI7mUJDVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QdNQDul88wCLxar86hycQGMDS1ZpVtsis8MnQC0w4
 XWAldjpGD9HvaWcTDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myKkUih/MVd9lHLSCp9v5Ayzrw
 zuKoS49gJ0elccOka68+DjvgS+op5XPZh444EPQRG3NxiR9aY2+boqk82/n/O1AJ4aUSFqGl
 HUcks3Y5+cLZbmWjzCESugJGLCv5t6GPSfajFopGIMunwlB4Fb6I9oWumsnYh40bIBUIlcFf
 XM/pyt+p7UCbWPtRJMwWIKtNs8L9aLPNfbMA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7GMijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQ1QRZTYLcqvwyCySgJkClA3cFzN89eLndscl3VNxsy5bNvg8
 HCnQVN/w1Hin3DBIgjiQik9NO+2DM8m8yNhZHdE0bOUN58LO9fH0UviX8FvIelPGBJLkZaYs
 MXpi+3fW68SG1wrChwWbIXnrZwKSfhYrVnmAsZRWxBmJ8QIb1WQorfMJ1KznAFTXnvfnZZv+
 NWIi1KEKbJdHF4KJJiNN5qSI6aZ4CF1dBRaBBCTfLG+uSzEreBXFsAGpqVvfJhXdE6Tn2DyO
 sT/KU5wmNQharQdqbHhrauFs52oA615GE9bFHPc9rG4KW/R+W/L/GOKeL/gken1WDym9aO8S
 /9Syv2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSB0XQPLLZ8PI4/7
 /0mvcoat162hhYwa47UhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZowVYEcwI
 zKSiK7TvJhmxxLPIygpCHzA/etBnpBS6hpE+0APegaSkd3fi/5pgBAIqWYrTh5Yxwls2v5oP
 jQ5LFV8IKiD8ms6hMVHWGzwSQhNCAfApx70wloN0mbYU1OpRirGK2hkYbSB+0UQ8mR9eDlH/
 e7HlDa5AGiyJMyhjDEvXUNFquD4SY0j/wLPr8mrAsCZEsRoejHimKKvOTIFphaP7RndX6EbS
 T2GJNpNVJA=
IronPort-HdrOrdr: A9a23:AGkDwqsgiBNcsG5JzF3RUoo67skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63191596"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQKTWrjoGwpyDeOIfK6eYKizfxfkj/a7X84VfriavomFMgNudNEEaPydAped8yY+PE7yMVTDUVR/5aEVKDwd2BSxY2+lRnYp6ViqfVhWgfHUFUTjf6l4TTIsOTf0yLxGpm0EGSMu2haVgMcLqZ/Mv5uxIgCVZHW+jlcfwNH8UgJD6VfmuYcY1sIv7s7zTBa6OQp0AHli9tF/qANY1TnLWdGx+wb9FV1qFeG5rNfCBV/NQFLY5re0dzyjQ1qZzRZBnDoGkIP74M4a9SW7gVvxSyMxVkBipKVM9en0hExS6wDYrRV2zNcUkYGb5lSPVdw3VsoU9z2BbALVY0s1AWDuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr8IIs307OvsHETBHZnlWCjQWd8h6fIT9/urLdR1Hrg=;
 b=M6QTND6dFI9iJl0S0py1buiidqrhEUDHmwuYO0l12cWptybjIJv/movd3jJ3ANgwxNtWzywYZg2eYNlWD5BHSx+CV4FtBdK9VY3GmWJmHjxg60Xg/o325raIpn74SET9+Du3ShP+kLpVcF1V8JDoaWyKpqH67YKcgRmLBzluhyClmeMLy4pqI3uSe/1yKr62k3tGhYeXw1+Fmf6b8xVlFH4MG2MvEh1nGzEo8nkbf+gf7HNL7hk0RD+aFO43ZwnFDlKQ5sccYr5z9EK8ysy4+38OyQD7GmyLXM7AmbFCz25FCHr9ME3zUWLbjPwskjsHxp8JEDef0fS9ZhdtfBFNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr8IIs307OvsHETBHZnlWCjQWd8h6fIT9/urLdR1Hrg=;
 b=ndksjSoTM3GN76u6Y+0O6foNoqDxQwM9v2+AHOwHdqlPu+GT8V756s2PCv64EpvP08ve/+ACypcZQnCZmDsH0mqiFsOE2v56sNMINcMeki7JuQCezvYpzVpyf76LX5U/IvfRaR5YRSCLRaoXNAjOq242VptDZwbzqg9LyiylTbM=
Date: Tue, 8 Feb 2022 15:09:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <YgJ5hmxtTXz9XDdr@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
 <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
 <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
 <YgJP/jMhWBrLOpb2@Air-de-Roger>
 <ec27927e-6c05-0e61-c0b8-c28bfd4d3d5e@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec27927e-6c05-0e61-c0b8-c28bfd4d3d5e@epam.com>
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bd2c424-fad8-4559-8f59-08d9eb0c972b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6350:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6350DE75716623287419CD4B8F2D9@PH0PR03MB6350.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRGsdTyhvgVGfFChMOLXgA2Y6CzmITs9DAl/4TvISEFOzO/rwJYvDTjGp+QVSZHUtxAcWKCUtf40+KoRwiGEdbtb+lstAQYNZhTo7+yMT+Gzysvw+ro3OXYqMA2oGLn/aDNBOv8w8rStINE8jI/J2KakZp8T2+BO2RdjvdS0vSTlcnO6LYUrg1sONsX98V/F4D97Ltqov85C6Vk0Z1SUg+EAXUbUMutD0MADOVqcu1Kr/lbWRgMA8AuWC8z7+CajIFhop/QqBa5RUEO4F6nmyWYQacD3Q1RfEnVd3WSe5VMeFqTqPWKiuvOx1yaRBI9rCsoUSrPVycAlXGzQG+3atle34dlz67vG2MGsuoNPbmB8KIwLaCXw1TQLhk5nYrt7Cy5FtJxyYO/b9ezx0jqeQSbpS0WzglOwHpfpCjfGq5E5fzKTvWyRwrFgpInhXI6qqv4SfSiTk4lrb25K5iDcYjuDdJxW8GtHxpNlQhZWQjZLEX4EUTc2uJ43F7B+XZUiYkB+K9s7b+EmINQuqc7E00whODrYwHwScs1/42nkEEJBB9LFLhSQKnVIu0/GTdqmLLn1naBQjzFNUpliDSlo8oiUbqfVbSc/3fINCWhJtqdn42UrLFDjbsYeWoU7DsNEo6tfBIYbHQjaZmGjFFGtZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(6486002)(33716001)(2906002)(508600001)(38100700002)(82960400001)(7416002)(186003)(8936002)(53546011)(66556008)(66476007)(54906003)(6916009)(85182001)(6666004)(5660300002)(86362001)(66946007)(9686003)(6512007)(26005)(4326008)(316002)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2txMU5FZkFnVDdkand1S2VGZ1MzM2V5WHF0ellnK2Y1dFp3M3UxbVVoZERp?=
 =?utf-8?B?V0dBQWc1WTdCNG0wYVFReXBucWlmUHkvUWp5cXdsbzhvWkhoTndYeGNuVnRh?=
 =?utf-8?B?RUpxdmMyL1FlZVkrUDI0Zk5FNUpsSkZSRU9kRTU3NytnbmRpc20zaWdQTkZp?=
 =?utf-8?B?RzJxYVBKRlBlVzY1U0tKUlpBYzJEcXBZWFdDK2M1M3FmU1JNVHhzbVRaaUtn?=
 =?utf-8?B?WWkzQmJMMzZCN21oRWdoVlp5dDRQTnBSZWpUZDhWbkJGaDBGV2gzdmxXWmZT?=
 =?utf-8?B?NlMzcXpDZ3FHZXZOVXNsTE0vWlVSaHU4ZGlCUkRVUjU5dm9mZ1JEdVZOb0t0?=
 =?utf-8?B?RW85SkN0VWZxamlLaE1CTXQ5ektXc0liVFhKbVp3ZXVYZmJxYjI4WVB3M2Jn?=
 =?utf-8?B?clBqaWpnU0x1RDVrVHBnVy9WdkkrRjhGTUtyRXlJZm96ZENEUzQ4b0hyd2Vj?=
 =?utf-8?B?S3BzMDRFSnB6ZC9pVUV1c3RYNEQ3MzFNWWlvczMyZEpIUFlJRkU0eVFQSjBM?=
 =?utf-8?B?SDYrVDBRQVFsK3lBenc2RlBldHdTUzk5MFRQZ0NjTkRTV2dESTRoSUt3eFV6?=
 =?utf-8?B?WVdtOFlheWxKd2JDNDdmZzdZTytyajN0cjJUcUFtTzlPRkZ5TnlKU29kd2w2?=
 =?utf-8?B?eFpEWGJXZGhEWDJka0U4MkVNdHYzTmJOdUFoT3o3QmNHUW9obE9xSk5xL3hH?=
 =?utf-8?B?MkppSkJCTjRXNWRpR2hxNHE3dUo3SjRXMjBNZnlQWTUxdDYvbTJ5Zld6V2lz?=
 =?utf-8?B?V29Wb0k0aytmYWZXNEN4bTVrUzNVWHlaOXFhMmR1YXNYcjJxeXYwUHVXL1BV?=
 =?utf-8?B?N1dGQU1hMXZPODlrcjZLYnd2cG1lQmxHWDhyZ1Ara2hFTTgybUxQNTdYNmxL?=
 =?utf-8?B?NzdhL3lENmVoTDZQN2JpM2Z1OXhvT05Xb2ZhelovYjF2dzNGbU44NnZiaEtE?=
 =?utf-8?B?TUx4eWNYSWtUS3JIYng3NWE1ZzVGYldwaStGdW95NlpKd3FuVVQvV2NEYjJm?=
 =?utf-8?B?c09VRW5mbldBR3pIT29FZE00THdKUG5WUWMrbVVKTFVaZk1wL3o4bi9tblF5?=
 =?utf-8?B?cmhEdVU3dURXbEdSSlNsR00vZkhVK0hwSnFXQ24zVFJPbXBkVDF2U3VWM2NU?=
 =?utf-8?B?NUNhZGdtRWkzL2VVZGxhTCs5SDB0U3R5N1hTTnZXTGVya2NYaGpmWnczZThW?=
 =?utf-8?B?Zm51Q1A2MEtKTU5JTGlGUnZVNUdHTFNCbXd5cEl4VkJySUxBZjVUQWFpc1dK?=
 =?utf-8?B?eWVpQXNPc2paL3lKek1OZjd2ZnBTM2dXZUk5eVNmVW5aOW5hRjRZaWFWZ1BR?=
 =?utf-8?B?S3lmWFlROW5vbW5ydzVOZWJidGNVTnlJeWYvUG5JOHp0NkdjWXBndWFjYUg3?=
 =?utf-8?B?NnEvek5UQnB5aWRQQU5ZK2tVdkxxcUxZcmh3cGJKWmc2OUNJcmlxTzFFSVlU?=
 =?utf-8?B?R053Q1JtK21RV3QrbjZLYUZ0R3pIQVp5U3JwWHl1NnRDcjEvVkptdDJ1RjQ0?=
 =?utf-8?B?SzFDd1JBdXhpcVpjdzNuZE5hbjIxRDJDcnQ2OUhKbVpPdi9zeCtyYWhzOHor?=
 =?utf-8?B?Q3Q1Z29zOG1HdUdFd0NPOHk3S3V0TjFSQjFyNFZybDRONG1UTmhFaDUwazd2?=
 =?utf-8?B?RXEwQy96TVU2RWszdWcrazd2U05zS2E2bnliNkNCVFJLc2VpR2NobDd6QkNr?=
 =?utf-8?B?STh6ekF6QzNOTXorMnBxcFJ5Z3ZQOHhxenZreXBMWE8xZWduMHpNS25CcERa?=
 =?utf-8?B?VGZvM0JyWnU3T2JTeUdzOXBwUlh3TGozOFRuckZMOEp3R0Fhb09KbXowK3NH?=
 =?utf-8?B?ZHJTN2FHemdxZVZwR3JQT3hHelpGeGV0eTFRZFd5alZQdXkvZitPZytKNG5G?=
 =?utf-8?B?TXhKbDYxYjk1dm84eE85bDhjMG1OVXBOTVhhMm5jT0x5eVFjT2F1WFpvN3hj?=
 =?utf-8?B?YzQvWFU0Ujk5c21wSmc3c2hYQmZpc2ZsZTRJY2hZanIyNnptU1pDRDVNZXJ5?=
 =?utf-8?B?TWI1YW5ySU9sak5pZzdjSTFra28vRVNZMkdmdlFSS0dJaWZxK2V6RWdPV3lv?=
 =?utf-8?B?em5DaUJ0YXU3M0xVa1lwUzNJNGpOMkYwQnlGN3JFSGdHZnEvT1R1b05mdkRE?=
 =?utf-8?B?UDZzOEpkVEhXQ3N4TzRUaWFpZ1VHOTlsTVZWSkl4ZG11Y24wUytTL3F4NlRi?=
 =?utf-8?Q?we+DTkIMA2rcVe50jj14ugg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd2c424-fad8-4559-8f59-08d9eb0c972b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 14:09:16.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCEDKQIq0g7VhwI6E5I5kalsEfjsAX8SZoI0qgxTvffegehsz+mnlmJCW95oPQNWqjJwkwLNkBbm2X3SqyY9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6350
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 11:29:07AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 08.02.22 13:11, Roger Pau Monné wrote:
> > On Tue, Feb 08, 2022 at 09:58:40AM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 08.02.22 11:52, Jan Beulich wrote:
> >>> On 08.02.2022 10:38, Oleksandr Andrushchenko wrote:
> >>>> On 08.02.22 11:33, Jan Beulich wrote:
> >>>>> On 08.02.2022 09:13, Oleksandr Andrushchenko wrote:
> >>>>>> On 04.02.22 16:25, Jan Beulich wrote:
> >>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>>> @@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>>              pci_conf_write16(pdev->sbdf, reg, cmd);
> >>>>>>>>      }
> >>>>>>>>      
> >>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>> +                            uint32_t cmd, void *data)
> >>>>>>>> +{
> >>>>>>>> +    /* TODO: Add proper emulation for all bits of the command register. */
> >>>>>>>> +
> >>>>>>>> +#ifdef CONFIG_HAS_PCI_MSI
> >>>>>>>> +    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
> >>>>>>>> +    {
> >>>>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> >>>>>>>> +        cmd |= PCI_COMMAND_INTX_DISABLE;
> >>>>>>>> +    }
> >>>>>>>> +#endif
> >>>>>>>> +
> >>>>>>>> +    cmd_write(pdev, reg, cmd, data);
> >>>>>>>> +}
> >>>>>>> It's not really clear to me whether the TODO warrants this being a
> >>>>>>> separate function. Personally I'd find it preferable if the logic
> >>>>>>> was folded into cmd_write().
> >>>>>> Not sure cmd_write needs to have guest's logic. And what's the
> >>>>>> profit? Later on, when we decide how PCI_COMMAND can be emulated
> >>>>>> this code will live in guest_cmd_write anyways
> >>>>> Why "will"? There's nothing conceptually wrong with putting all the
> >>>>> emulation logic into cmd_write(), inside an if(!hwdom) conditional.
> >>>>> If and when we gain CET-IBT support on the x86 side (and I'm told
> >>>>> there's an Arm equivalent of this), then to make this as useful as
> >>>>> possible it is going to be desirable to limit the number of functions
> >>>>> called through function pointers. You may have seen Andrew's huge
> >>>>> "x86: Support for CET Indirect Branch Tracking" series. We want to
> >>>>> keep down the number of such annotations; the vast part of the series
> >>>>> is about adding of such.
> >>>> Well, while I see nothing bad with that, from the code organization
> >>>> it would look a bit strange: we don't differentiate hwdom in vpci
> >>>> handlers, but instead provide one for hwdom and one for guests.
> >>>> While I understand your concern I still think that at the moment
> >>>> it will be more in line with the existing code if we provide a dedicated
> >>>> handler.
> >>> The existing code only deals with Dom0, and hence doesn't have any
> >>> pairs of handlers.
> >> This is fair
> >>>    FTAOD what I said above applies equally to other
> >>> separate guest read/write handlers you may be introducing. The
> >>> exception being when e.g. a hardware access handler is put in place
> >>> for Dom0 (for obvious reasons, I think).
> >> @Roger, what's your preference here?
> > The newly introduced handler ends up calling the existing one,
> But before doing so it implements guest specific logic which will be
> extended as we add more bits of emulation
> >   so in
> > this case it might make sense to expand cmd_write to also cater for
> > the domU case?
> So, from the above I thought is was ok to have a dedicated handler

Given the current proposal where you are only dealing with INTx I don't
think it makes much sense to have a separate handler because you end
up calling cmd_write anyway, so what's added there could very well be
added at the top of cmd_write.

> >
> > I think we need to be sensible here in that we don't want to end up
> > with handlers like:
> >
> > register_read(...)
> > {
> >     if ( is_hardware_domain() )
> >         ....
> >     else
> >         ...
> > }
> >
> > If there's shared code it's IMO better to not create as guest specific
> > handler.
> >
> > It's also more risky to use the same handlers for dom0 and domU, as a
> > change intended to dom0 only might end up leaking in the domU path and
> > that could easily become a security issue.
> So, just for your justification: BARs. Is this something we also want
> to be kept separate or we want if (is_hwdom)?
> I guess the former.

I think BAR access handling is sufficiently different between dom0 and
domU that we want separate handlers.

Thanks, Roger.

