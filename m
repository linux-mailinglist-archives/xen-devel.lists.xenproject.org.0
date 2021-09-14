Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416A40A8BA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 09:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186211.334935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3LF-00029I-4f; Tue, 14 Sep 2021 07:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186211.334935; Tue, 14 Sep 2021 07:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3LF-000278-0W; Tue, 14 Sep 2021 07:58:57 +0000
Received: by outflank-mailman (input) for mailman id 186211;
 Tue, 14 Sep 2021 07:58:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ3LD-000272-Sd
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 07:58:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aa556b4-7c11-4efb-839d-4a4e8b0d6f98;
 Tue, 14 Sep 2021 07:58:54 +0000 (UTC)
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
X-Inumbo-ID: 4aa556b4-7c11-4efb-839d-4a4e8b0d6f98
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631606334;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XrDpap8pmKJKkv9I71CpW+Ut00pu7KKxgmuVvD69BXw=;
  b=HHzdORNLuciBdKibzhagYpMRv4ElzhhHMXGKuJMlPoM8AjNZ2bGXccjy
   Lzwmu5cnTa2CKgxAbWtpZbe6iv8yb/HTaJqO4E/EeXlnJv6cFItmQ17yH
   T7QGoZ1K6rin8pNYsN/oV3UJGgTys6pe22MQYCnpnaBAyoik5C7GEUfjc
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Y8eriGLJivOF6AdwkHQTYDT0uyp0zxMLOgklhYt7Qcep5cxc/Wak1gtFfHG1BgSjGXXnzLkRiD
 sgGrrbRqxODqyjfDVndCIhhd8D5dgZsQ/gUY5sD2oQ2cVa+L6MrXGurcWFHnXVDfSaFQN+PauZ
 NJtbd5KyTX1OVvQRGA+MecXLCWB2j5kEdl74eU+lJdCluFpzEasNr8G+BEQoREP0BujLeY0ha1
 3pvOqjgTIYZpZFiQq2kq8ZmoD+3afcZZSPWZz/anQCcTF808N1CBQucon99EBTASh2dO/HyFf8
 duF3RQpVDnWuKxMaDlldwCE8
X-SBRS: 5.1
X-MesageID: 54423534
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7DLP7qil4/+B+z50mAOoD/zVX1617xcKZh0ujC45NGQN5FlHY01je
 htvWGuAb/mDM2qnft1waIXko05T6J/XxtUxHgpkrShkEyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8x3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1tuoWvexs1OZfJxvoaUxhdNxFVBaRZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2pwURquFO
 6L1bxJFMRCeb0Z0JmspAZ08oPaw2HKuMB9h/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnmSL9RZJXHrm//f1CnlKe3CoQBQcQWF/9puO24ma6WtRCO
 wkX9zAooKwa6kOmVJ/+Uge+rXrCuQQTM/JZA+c95SmOx7DS7gLfCmtsZiBcbNUsnM4tTjUxk
 FaC2djvbRRDubiURHTb0rqxqjq2ETcZJikJYipsZQgC5cPqrMcsjxbMZtF5GaWxg5v+HjSY/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZi46/xrlQn6i1AYneomlZomM2XPj5OkVee51UWK9U
 Gg4d9m2tb5VVMvWyX3RH43hD5nyuK3Ua2S0bUpHWsB7rmXzoSbLkZV4vWkmTHqFJProbtMAj
 KX7ggpX+JYbF3+jd6Yfj2mZWplykPSI+TgIUJnpgjtyjnpZL1TvEMJGPxf4M4XRfK8Ey/1XB
 HtjWZzwZUv28Iw+pNZMewv47YLHOwhknT+DLXwE8/hX+eXHPyPEIVv0GHCPcvo4/Mu5nekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARMBkwuj2iSccG1nqBlLMdvSYHq2llpiVQQENle0wXkzJ4Gp6aYUbZwserc7sudkyJZJo
 zMtIq1s29xDFWbK/Sozd574oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdTFR5/CMv2ae60yw/jt3Yqh+8vDVDDJcNeeRuw/dEyeTDxlPI+P+oFNQ7HmmmBz
 w+TDBpB/bvNroY5/cPnn6eBq4v1QeJyElADRzvQ7KqsNDmc9W2mmNcSXOGNdDHbdWX15KT9O
 rkFk6CiaKUKxQ8YvZB9HrBnybMFy+Hu/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PwZxmvS4PAyLBmo7SN75uPaA0BbPh3Kgy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvV1rIweDa/qlhEvmwNLbpHrAyPr5I2CNodXOU4wL
 z7I3KfPitywHKYZn6bfwZQV4ddguA==
IronPort-HdrOrdr: A9a23:RljdXKG0+dnTIdvMpLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="54423534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlqjMiNDO6xOk0y91ueXrfzcfjKks958L0WdoeH+hxZ4EUu7XWV0ctBYIQPMdAH12cMkR/Fn/9LsYOyi3sUJiTk3brkjR73T8FDj/GVs+63o5eWm2v47Zqy/BHNYjimk3svV1JI5Ydy+BbwueXX7m+c/XiEG92IckwQDC0RANp/tNUxIzyc2fcnEQ4v1xDTMsh0zGVYlb3IqfzDQsl+fGjalODkSlibDZt2Dn7vK6ztX6BfnikBzYc+fKTiEaCFiF3JbHxA330ifo5YPb8dvtCxWxfV2rpvkuZfqsNxbcLFe6H0QXjv8W0LHUCU3XhJb6e5BfrmVrCUy6wKZg4KeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XrDpap8pmKJKkv9I71CpW+Ut00pu7KKxgmuVvD69BXw=;
 b=Cz/IvXD78ZF9QjV7exz7Ylo7prDl8j2wIy7J8ZIF26AqD0nkzLqINMOVYCZsx+3bXp1hc8tMaLIIJL4D0Uy3j3fLBHSPAf1iJMuju/RlEbrN0r5Pd4o1zXjsDfHdNfAud6YWxjLfbOe0HBz2/QV6jawTFFKFJikMMmgKpsiCn6hkGJ7hAgDQwnoiGIR1BADEFqjOwhat1kNSSlvQrmn39IcKPAtLjDGqIPNUDEs/sxQsgRmMmu9xC2oDUk2aiKdBWSs+7kocWrMxQ8JzZUnYRAHQAESjUMd/YfZE9l1b3MeJ922QfLaTKwpA+CNfpkCiQE2V3v2Cz6EqAsNa8OsRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrDpap8pmKJKkv9I71CpW+Ut00pu7KKxgmuVvD69BXw=;
 b=ZU2V8WMb9WJM1cg6mFxCgIfbeDf3BhGzeUK3V3hC12FOTVGlBhU7+4tAGI51bv8iqfkBGSBCuoQ+uYV47SL3cYoUb4+0vxtFydmqabbfaN0AXglVHzBtNbIWZNxo4YDBEPgRHyb8Do7OKs8+ft8Ct7TYKj1LebWM/B8GqCUHEVE=
Date: Tue, 14 Sep 2021 09:58:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xu Wang <vulab@iscas.ac.cn>
CC: <Damien.LeMoal@wdc.com>, <konrad.wilk@oracle.com>, <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] xen-blkback: Remove needless request_queue NULL
 pointer check
Message-ID: <YUBWNkD3lECHrhAp@MacBook-Air-de-Roger.local>
References: <20210910035918.24907-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910035918.24907-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 200dd00c-22ad-4f3b-31fd-08d977557de4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-Microsoft-Antispam-PRVS: <DM6PR03MB422044049DBC424663C4D83E8FDA9@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kD1dkEX/OIhgH5Q8Yk8YaC4GuVeMqE1CKJTsmXurRGIEi4hx3BXFK7TKKEAL5XWUw8Jkvp+6olQ1brs8sOO4YX/pmJVs1Df+bvVAxAHz+Un8za3d7JtDLBm2igpgXtOnh6coJ3vpLFZO3FuXcZLDu/3z2O7JhmajojFNrVPdOQ5KJZSZgAuOKRL/zOoXE1VNAQz7vfNPLZKoJsZcFAdFI31Np7RqIvjXZ3aWQmLjo/qVOXvhouootiA25PGe9Lpn3sAfP+PZ/+5KSnP2ZuQWQzzVgXos3pRk0mYLWzlKzT4xQ1oPSvONiiW0ptDOePEmagh9h5EUeIvvaYR1KxU0DPrFQaWHNu1yRM9jkAPSpqpzhMGtVpBHPaAXMYpUbI3rynouehxRjPGIdIj/YYE6iaR4RCFQTESVrvpANAKGiIWtbKxRGa2f8MjUCN8MXlCSv+jox039V2QxbIWSGLTgKNtXwMpfQBsh4b1O9mQ76XsLiPWG22MbposmCyqX0xl56pxxKQ2qt93ZkB+XY+V6+lxLfndKc6ISIBQ3CWpG+beHmePh2uqOsnqbkctQulyq0FE38iLxXLKl7zeoRJBYBUV4mLhqOS32fs4lf+2xIsFgRgeKnO0n3VXlf6iuVBITOMa8REsau05c2P7IxNnNUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(83380400001)(6496006)(6486002)(4744005)(9686003)(6666004)(186003)(5660300002)(8676002)(85182001)(38100700002)(956004)(66946007)(66556008)(66476007)(478600001)(8936002)(2906002)(26005)(316002)(6916009)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzlBK0lRMHdta1dWMThadEM4QzJ3NmZaeFJGQWdzUS9HbzhyUUxCZGxYNXBy?=
 =?utf-8?B?QnQ3VHlkeERrM09JL2hBUzhBd1hYUFAyRVNFNUlyZURCZWdYMkQwcFZpcmMy?=
 =?utf-8?B?UkpkNlZ3YU1qeENhRkJxMU9qaUpLQW9kQnlxa24zUFFEZ2FFL21JbUsrRjVO?=
 =?utf-8?B?R2JKRDQwSnNGakJ1aXNEeUlJekJrTWhDSzVvTTZJUnIxVGE2ZU9SMWNWZG1Z?=
 =?utf-8?B?d0ZHdUI3K3hWVDhxd3FKVnYrU3duM3ZjM3k1dmF5YVRCS3NYdE93RzJuVlVH?=
 =?utf-8?B?eklBQzkyMmc4RDc0bGlnay9nV0J5UFpUaEgzYkhuWk53eDBYNUovb1NiNGdN?=
 =?utf-8?B?MlNWeVhUK2JhdnlrWS9zbjhaRVZEZ0tlYVNtRmVTWHZCZmJvSXdSQ3MyWnBV?=
 =?utf-8?B?clA2RG5JTno3c3p4ZGdZdmFOSGs4M1A2dWlzeldBTFpNdFhhdTV1WHdPcUJH?=
 =?utf-8?B?R044QlNjVjVSUDE3eXF6RTNTYkV2M3MwMzRXRlRua2hXWnl4bURkRHdhVGRO?=
 =?utf-8?B?VW96dXE3WXBQTE9GajJLV0FYVW0wZS8vVU1jaC9YSWZMckp0dnpveUdZMVFk?=
 =?utf-8?B?bFlQRVNpWThlVm0rS2Z6UlREVTFNQTlWczhOb2E0aGV0KzNkNnNnd3dJWnpj?=
 =?utf-8?B?NFc0OFNYWnFLdXViazNpbDR1SmFtMTVtM3hVMW1KT0U4RGczcVRub2M2ZFJQ?=
 =?utf-8?B?MFVTekorUnhBYmREWThycTRPNGVUbVZ2L2tHdklwQmxyMnlxTEFWcFl4ZW04?=
 =?utf-8?B?ZTBtdm9rdlBzNEU5SjZWekd4aG9ZRURZTVBGTWR6UnJBTkhXN0VSY3g1aDlk?=
 =?utf-8?B?WmhTUVU0aVdQVVFRYktaN0doeVN1eWRKNktoZ0tYOHo3ZDVROVAvMm9tSUoy?=
 =?utf-8?B?VnVJdHBIT2JlaGVqSW5qYjc2QzBTTUIzV0g5ajFKWVUxbnJvQzZDWW04blFx?=
 =?utf-8?B?MjhVTU10NVdwUUpUQ2NPdHFxM0czOGhVQjdYMjQrRVRNbUtheG50alFsMnVv?=
 =?utf-8?B?eTZSN0NQYzFFUGpFWldhNHRDa2lFY0MvTitBSEwwREx5Tm1jVnZnbENHQ3BT?=
 =?utf-8?B?VVp2aTJ4MzF2K3I4eWp5QzlUb21jcmNoU0Y0MDVZS2J1ZVovS1E2RWo3TnRK?=
 =?utf-8?B?enhnSXQ5d2ZidGlpZ0hObWh3V01HWlg2VW1GdHJ2SEFwbDVaWjhqYWVnb1FI?=
 =?utf-8?B?ZkNqN3huemI3QnBSTWFaOTVZZE00NWN6YWpxTVArMkwvcGZXQ21Na3FwSkRX?=
 =?utf-8?B?cFhBRWR5aURXK0RORzhrRlUwM1dpd0R3YnVQSGNJWVRKZzRRdEtBaXRLczRv?=
 =?utf-8?B?TkNCU2RhNGZ0d2szVFNrSSttbUxMVHlDWXZMbGxNQVB6UW5aMTRRcFg5ZElS?=
 =?utf-8?B?dVlNYlNIdFJ2OUdCclJwempIb0hMTS9vZ0RydjBKU2MvVDA4bGY0ZjdmZWFF?=
 =?utf-8?B?eHVkaGZKVVZrbkRhcUR6RTJNTTJHMW56Tk5FVXhFN0JkZnRaVHE3SVRIZDFN?=
 =?utf-8?B?Wld4dkt1TGFMQWNkcUNvUXp2Y1ZwUWRxWlpZSGNWS3huSWgwcTQzSGltRXk3?=
 =?utf-8?B?MmF5Tll3RS8vb1hKakZjRmdldFBqTU5vRnpDU1lrMkI1Vmh3cnlxNk1pUWlS?=
 =?utf-8?B?aisyNjVIdnY3Vk4vNkNhZTdEeXJOV0xRVFk1STJDaUh6UmN2TXpjb2VjbDlH?=
 =?utf-8?B?Y1QvWXIwbmEyVXlqZ1lUbXZacUpiZ3BCT0crMEsyVDRRQjFJVGpGQUs3K0Rk?=
 =?utf-8?Q?r6lpcHzVBOD/bgBnviw3ZP5kImRYDj18gHpQUz8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 200dd00c-22ad-4f3b-31fd-08d977557de4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 07:58:51.8310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3U5A3nWbujbaU3HBXAXahv/3j6GwDQmoWCfCKBLFfIZK2+5Z/kUBNFgV8VbxCwVnIyta7FGy5EsO9LbXLUBuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

On Fri, Sep 10, 2021 at 03:59:18AM +0000, Xu Wang wrote:
> The request_queue pointer returned from bdev_get_queue() shall
> never be NULL, so the null check is unnecessary, just remove it.

There are other places in the code where the return of bdev_get_queue
is checked to not be NULL, like __blkdev_issue_discard. Should those
also be changed?

> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Regards, Roger.

